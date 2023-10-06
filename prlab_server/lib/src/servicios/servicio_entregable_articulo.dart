import 'package:prlab_server/src/excepciones/excepcion_endpoint.dart';
import 'dart:io';

import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/orms/orm_entregable_articulo.dart';
import 'package:prlab_server/src/orms/orm_imagen_articulo.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:prlab_server/src/servicios/servicio_almacenamiento_archivos_nube.dart';
import 'package:prlab_server/utils/mailer/templatePublicarArticulo.dart';
import 'package:puppeteer/puppeteer.dart';
import 'package:serverpod/server.dart';

/// Servicio para administración de artículos.
class ServicioEntregableArticulo extends Servicio<OrmEntregableArticulo> {
  @override
  final orm = OrmEntregableArticulo();
  final servicioAlmacenamientoNube = ServicioAlmacenamientoArchivosNube();
  final odmImagenArticulo = OrmImagenArticulo();

  /// Crea un [EntregableArticulo].
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.<br>
  /// [articulo] ([EntregableArticulo]): Un objeto que contiene datos del artículo a
  /// crearse. No debe contener id, ni fechas de creación o modificación.
  Future<int> crearArticulo(
    Session session, {
    required String titulo,
    required String contenido,
    required String contenidoHtml,
    int? idMarca,
  }) async {
    try {
      final idAutor = await session.auth.authenticatedUserId;

      if (idAutor == null) {
        throw Excepciones.noAutorizado();
      }

      final articulo = EntregableArticulo(
        titulo: titulo,
        contenido: contenido,
        contenidoHtml: contenidoHtml,
        idMarca: idMarca,
        idAutor: idAutor,
        idStatus: 1,
        activo: true,
        ultimaModificacion: DateTime.now(),
        fechaCreacion: DateTime.now(),
        fechaLanzamiento: DateTime.now(),
      );

      return await ejecutarOperacion(
        () => orm.crearArticulo(
          session: session,
          articulo: articulo,
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Lista todos los artículos existentes no eliminados en la Base de Datos.
  ///
  /// Args:
  ///  [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  Future<List<EntregableArticulo>> listarArticulos(
    Session session,
  ) async {
    try {
      return await ejecutarOperacion(
        () => orm.listarArticulos(
          session: session,
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Recupera los datos de un [EntregableArticulo] por su [id].
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [id] ([int]): El ID del artículo consultado.
  Future<EntregableArticulo> obtenerArticulo(
    Session session, {
    required int id,
  }) async {
    try {
      return await ejecutarOperacion(
        () => orm.obtenerArticuloPorId(
          session: session,
          id: id,
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Elimina un [EntregableArticulo] de forma permanente.
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [idArticulo] ([int]): El ID del artículo consultado.
  Future<bool> eliminarArticulo(
    Session session, {
    required int idArticulo,
  }) async {
    try {
      await ejecutarOperacion(
        () => orm.eliminarArticulo(
          session: session,
          idArticulo: idArticulo,
        ),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Recupera los artículos pertenecientes a una [Marca].
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [idMarca] ([int]): El ID de la [Marca] a la que pertenecen los
  /// artículos.
  Future<List<EntregableArticulo>> listarArticulosPorMarca(
    Session session, {
    required int idMarca,
  }) async {
    try {
      return await ejecutarOperacion(
        () => orm.listarArticulosPorMarca(
          session: session,
          idMarca: idMarca,
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Actualiza el registro de un [EntregableArticulo].
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [articulo] ([EntregableArticulo]): El objeto del artículo a actualizar. Necesita
  /// contener el id del mismo.
  Future<bool> actualizarArticulo(
    Session session, {
    required EntregableArticulo articulo,
  }) async {
    try {
      logger.info('Se va a actualizar el articulo con id: ${articulo.id}');

      logger.finest('Articulo ${articulo.id} actualizado');
      await ejecutarOperacion(
        () {
          return orm.actualizarArticulo(
            session: session,
            articulo: articulo..ultimaModificacion = DateTime.now(),
          );
        },
      );

      logger.finest('Se actualizo el articulo con id: ${articulo.id}');
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// servicio para actualizar la imagen de un articulo
  /// Args:
  ///  [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  /// [rutaImagen] ([String]): El path de la imagen a subir.
  /// [idArticulo] ([int]): El ID del artículo al que pertenece la imagen.
  /// Returns:
  /// [String]: La url de la imagen subida.
  Future<String> subirImagenArticulo(
    Session session, {
    required String rutaImagen,
    required int idArticulo,
  }) async {
    final nombreImagen = rutaImagen.split('/').last;
    final directorioNube = 'articulos/$idArticulo';
    final imagenSubida = await ejecutarOperacion(
      () => servicioAlmacenamientoNube.subirImagen(
        session,
        rutaImagen: rutaImagen,
        nombreImagen: nombreImagen,
        directorioNube: directorioNube,
      ),
    );
    logger.finest('Imagen subida a cloudinary: $imagenSubida');
    final publicId = imagenSubida.publicId!;
    final url = imagenSubida.secureUrl!;
    await ejecutarOperacion(
      () => odmImagenArticulo.guardarRegistroimagen(
        session,
        nombreImagen: nombreImagen,
        publicId: publicId,
        urlImagen: url,
        idArticulo: idArticulo,
      ),
    );
    logger
      ..finest('Registro de imagen guardado en la db')
      ..finer('Articulo $idArticulo actualizado con imagen: $url');
    return imagenSubida.secureUrl!;
  }

  /// Recupera los registros de todas las imágenes de un artículo.
  Future<List<ImagenArticulo>> obtenerImagenesArticulo(
    Session session, {
    required int idArticulo,
  }) async {
    return await ejecutarOperacion(
      () => odmImagenArticulo.obtenerImagenesArticulo(
        session,
        idArticulo: idArticulo,
      ),
    );
  }

  Future<List<EntregableArticulo>> traerArticulosPorUsuario({
    required Session session,
  }) async {
    final idUsario = await session.auth.authenticatedUserId;
    logger.info('Se van a traer los articulos del usuario $idUsario');
    return await ejecutarOperacion(
      () => orm.traerArticulosPorUsuario(
        session: session,
      ),
    );
  }

  Future<EntregableArticulo?> traerArticuloPorSlug({
    required Session session,
    required String slug,
  }) async {
    return await ejecutarOperacion(
      () => orm.traerArticuloPorSlug(
        session: session,
        slug: slug,
      ),
    );
  }

  Future publicarArticulo({
    required Session session,
    required int idArticulo,
  }) async {
    logger.info('Se va a publicar el articulo $idArticulo');
    final articulo = await obtenerArticulo(session, id: idArticulo);
    print(articulo);
    final imagenes =
        await obtenerImagenesArticulo(session, idArticulo: idArticulo);

    String imageneHtml = '';
    if (imagenes.length == 1) {
      imageneHtml = '''
      <img src="${imagenes.first.url}" alt="${imagenes.first.nombreImagen}" style="width: 100%; height: auto;">
      ''';
    } else if (imagenes.length > 1) {
      imagenes.forEach((imagen) {
        imageneHtml += '''
        <img src="${imagen.url}" alt="${imagen.nombreImagen}" style="width: 100%; height: auto;">
        ''';
      });
    }

    final articuloAPublicar = templatePublicarArticulo(
      contenido: articulo.contenidoHtml!,
      titulo: articulo.titulo,
      imagen:
          'https://getbuzzmonitor.com/wp-content/uploads/screen-shot-2018-10-17-at-8.39_.11-pm_.png',
    );

    var slug = '${articulo.titulo.trim().replaceAll(' ', '-')}';

    final checkSlug = await traerArticuloPorSlug(session: session, slug: slug);
    if (checkSlug != null && checkSlug.id != articulo.id) {
      logger.severe('El slug $slug ya existe!');
      slug = '$slug-${articulo.id}';
    }

    final archivo = File('web/static/articulos/$slug.html');
    await archivo.writeAsString(articuloAPublicar).then((_) {
      logger.finest('Archivo ${articulo.id}.html creado');
    }).catchError((e) => logger.severe('Error al crear el archivo: $e'));

    //actualizar slug en el articulo
    articulo.slug = slug;
    await actualizarArticulo(session, articulo: articulo);
    logger.finest('Articulo ${articulo.id} actualizado con slug: $slug');

    var browser = await puppeteer.launch();
    var page = await browser.newPage();
    await page.goto('http://localhost:8082/articulos/$slug.html',
        wait: Until.networkAlmostIdle);

    await page.emulateMediaType(MediaType.screen);

    await Future.delayed(const Duration(seconds: 3));
    await page.pdf(
        format: PaperFormat.a4,
        printBackground: true,
        pageRanges: '1-3',
        output: File('web/static/pdf/$slug.pdf').openWrite());
    await browser.close();

    return true;
  }

  /// La función `traerEntregableporFiltro` recupera una lista de objetos `EntregableArticulo` basados
  /// en una sesión determinada y un ID de estado.
  ///
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión, que representa un objeto de sesión.
  ///   idStatus (int): El parámetro idStatus es un número entero que representa el estado del
  /// entregable (entregable). Se utiliza como filtro para recuperar los entregables que tienen un
  /// estado específico.
  ///
  /// Returns:
  ///   un objeto `Futuro` que se resuelve en una `Lista` de objetos `EntregableArticulo`.
  Future<List<EntregableArticulo>> traerEntregableporFiltro({
    required Session session,
    required List<int> status,
    required int idAutor,
  }) async {
    return await ejecutarOperacion(
      () => orm.traerEntregableporFiltro(
        session: session,
        status: status,
        idAutor: idAutor,
      ),
    );
  }

  /// La función `listarArticuloMarcayEstado` devuelve un Future que enumera los objetos
  /// `EntregableArticulo` según la sesión, el ID de marca y los ID de estado dados.
  /// 
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. Representa la
  /// sesión o conexión actual a la base de datos.
  ///   idMarca (int): El id de la marca del artículo.
  ///   idStatus (List<int>): El parámetro "idStatus" es una lista de números enteros que representan
  /// los ID del estado deseado para los artículos.
  /// 
  /// Returns:
  ///   El método devuelve un objeto "Futuro" que se resuelve en una "Lista" de objetos
  /// "EntregableArticulo".
  Future<List<EntregableArticulo>> listarArticuloMarcayEstado({
    required Session session,
    required int idMarca,
    required List<int> idStatus,
  }) async {
    return await ejecutarOperacion(
      () => orm.listarArticuloMarcayEstado(
        session: session,
        idMarca: idMarca,
        idStatus: idStatus,
      ),
    );
  }

  /// La función `listarStatusEntregable` devuelve un futuro que enumera el estado de los entregables.
  /// 
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es obligatorio.
  /// 
  /// Returns:
  ///   El método devuelve un objeto "Futuro" que se resuelve en una "Lista" de objetos
  /// "EstadoEntregable".
  Future<List<StatusEntregable>> listarStatusEntregable({
    required Session session,
  }) async {
    return await ejecutarOperacion(
      () => orm.listarStatusEntregable(
        session: session,
      ),
    );
  }
}
