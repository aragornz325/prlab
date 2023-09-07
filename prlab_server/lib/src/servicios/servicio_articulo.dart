import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/odms/odm_articulo.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:prlab_server/src/servicios/servicio_cloudinary.dart';
import 'package:serverpod/server.dart';

/// Servicio para administración de artículos.
class ServicioArticulo extends Servicio<OdmArticulo> {
  @override
  final odm = OdmArticulo();
  final servicioCloudinary = ServicioCloudinary();

  /// Crea un [Articulo].
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.<br>
  /// [articulo] ([Articulo]): Un objeto que contiene datos del artículo a
  /// crearse. No debe contener id, ni fechas de creación o modificación.
  Future<int> crearArticulo(
    Session session, {
    required Articulo articulo,
  }) async {
    try {
      return await ejecutarOperacion(
        () => odm.crearArticulo(
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
  Future<List<Articulo>> listarArticulos(
    Session session,
  ) async {
    try {
      return await ejecutarOperacion(
        () => odm.listarArticulos(
          session: session,
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Recupera los datos de un [Articulo] por su [id].
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [id] ([int]): El ID del artículo consultado.
  Future<Articulo> obtenerArticulo(
    Session session, {
    required int id,
  }) async {
    try {
      return await ejecutarOperacion(
        () => odm.obtenerArticuloPorId(
          session: session,
          id: id,
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Elimina un [Articulo] de forma permanente.
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
        () => odm.eliminarArticulo(
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
  Future<List<Articulo>> listarArticulosPorMarca(
    Session session, {
    required int idMarca,
  }) async {
    try {
      return await ejecutarOperacion(
        () => odm.listarArticulosPorMarca(
          session: session,
          idMarca: idMarca,
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Actualiza el registro de un [Articulo].
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [articulo] ([Articulo]): El objeto del artículo a actualizar. Necesita
  /// contener el id del mismo.
  Future<bool> actualizarArticulo(
    Session session, {
    required Articulo articulo,
  }) async {
    try {
      logger.info('Se va a actualizar el articulo con id: ${articulo.id}');

      final articuloFinal = await ejecutarOperacion(
        () {
          return odm.obtenerArticuloPorId(
            session: session,
            id: articulo.id!,
          );
        },
      );

      logger.finest('Articulo ${articulo.id} recuperado de la db');

      // Se compara con el registro de la db, si el valor es null se deja el
      // valor anterior.
      // Si el valor es distinto de null se actualiza el valor en el registro
      // de la DB.

      articulo.toJson().forEach((key, value) {
        if (value != null) {
          articuloFinal.setColumn(key, value);
        }
      });
      logger.finest('Articulo ${articulo.id} actualizado');
      await ejecutarOperacion(
        () {
          return odm.actualizarArticulo(
            session: session,
            articulo: articuloFinal,
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
  /// [path] ([String]): El path de la imagen a subir.
  /// [idArticulo] ([int]): El ID del artículo al que pertenece la imagen.
  /// Returns:
  /// [String]: La url de la imagen subida.
  Future<String> subirImagenArticulo(
    Session session, {
    required String path,
    required int idArticulo,
  }) async {
    final nombreImagen = path.split('/').last;
    final carpeta = 'articulos/$idArticulo';
    final imagenSubida = await ejecutarOperacion(
      () => servicioCloudinary.subirImagen(session,
          path: path, fileName: nombreImagen, cloudinaryFolder: carpeta),
    );
    logger.finest('Imagen subida a cloudinary: $imagenSubida ');
    final publicId = imagenSubida.publicId;
    final url = imagenSubida.secureUrl;
    await ejecutarOperacion(
      () => odm.guardarRegistroimagen(session,
          nombre: nombreImagen,
          publicId: publicId,
          url: url,
          idArticulo: idArticulo),
    );
    logger.finest('Registro de imagen guardado en la db');
    logger.fine('articulo $idArticulo actualizado con imagen: $url');
    return imagenSubida.secureUrl;
  }
}
