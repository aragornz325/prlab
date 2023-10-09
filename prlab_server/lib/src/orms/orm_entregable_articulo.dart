import 'dart:async';

import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/orm.dart';
import 'package:prlab_server/utils/extenciones/columna_int_extencion.dart';
import 'package:prlab_server/utils/manejo_de_errores/manejo_de_errores.dart';
import 'package:serverpod/server.dart';

/// ODM para administracion de articulos.
class OrmEntregableArticulo extends ORM {
  /// La función [crearArticulo] crea un nuevo artículo insertándolo en una base
  ///  de datos mediante una operación ODM.
  ///
  /// Args:
  ///   [session] (Session): El parámetro de sesión es de tipo Sesión y es
  ///   obligatorio.
  ///   [articulo] (Articulo): Este parametro es de tipo Articulo y
  ///   representa los datos del artículo que se debe crear.
  Future<int> crearArticulo({
    required Session session,
    required EntregableArticulo articulo,
  }) async {
    try {
      return await ejecutarOperacionOrm(
        session,
        (session) => session.db.transaction(
          (transaction) async {
            logger.info(
              'Creando artículo: "${articulo.titulo}"...',
            );
            await EntregableArticulo.insert(session, articulo);
            final response = (await EntregableArticulo.findSingleRow(
              session,
              where: (t) => t.idAutor.equals(articulo.idAutor),
              orderBy: EntregableArticuloTable().fechaCreacion,
              orderDescending: true,
            ))!
                .id;

            logger.finest(
              'Artículo "${articulo.titulo}" creado exitosamente.',
            );
            return response!;
          },
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función [listarArticulos] recupera una lista de artículos usando una
  /// sesión y una operación ODM.
  ///
  /// Args:
  ///   [session] (Session): El parámetro [sesión] es de tipo "Sesión" y es
  ///   obligatorio.
  Future<List<EntregableArticulo>> listarArticulos({
    required Session session,
  }) async {
    try {
      logger.info('Listando artículos');
      return await ejecutarOperacionOrm(
        session,
        (session) => EntregableArticulo.find(
          session,
          where: (t) => t.fechaEliminacion.equals(null),
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función [obtenerArticulo] recupera un artículo por su ID usando una
  /// operación ODM y lo devuelve, o lanza una excepción si no se encuentra
  /// el artículo.
  ///
  /// Args:
  ///   [session] (Session): El parámetro de sesión es de tipo Sesión y es
  ///   obligatorio.
  ///   [id] (int): El parámetro [id] es un número entero que representa el
  ///   identificador único del artículo que debe recuperarse.
  Future<EntregableArticulo> obtenerArticuloPorId({
    required Session session,
    required int id,
  }) async {
    logger.info(
      'Obteniendo artículo con id: $id',
    );
    final articulo = await ejecutarOperacionOrm(
      session,
      (Session session) => EntregableArticulo.findById(
        session,
        id,
      ),
    );
    if (articulo == null) {
      const error = ErrorPrLab.errorElementoNoEncontrado;
      throw Exception('mensaje: ${error.mensaje}, errorType: $error');
    }
    logger.finest(
      'Articulo con id: $id encontrado',
    );
    return articulo;
  }

  /// La función `eliminarArticulo` elimina un artículo con borrado fisico.
  /// No recomendable su uso.
  ///
  /// Args:
  ///   [session] (Session): Este parametro es de tipo "Sesión" y es
  ///   obligatorio.
  ///   [id] (int): El parámetro "id" es un número entero que representa el
  ///   identificador único del artículo que debe eliminarse.
  Future<bool> eliminarArticuloBorradoFisico({
    required Session session,
    required int id,
  }) async {
    try {
      logger.info('Se va a eliminar el articulo con id: $id');
      await ejecutarOperacionOrm(
        session,
        (Session session) => EntregableArticulo.delete(
          session,
          where: (t) => t.id.equals(id),
        ),
      );
      logger.finest(
        'Se elimino el articulo con id: $id',
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Elimina un articulo con borrado logico.
  Future<bool> eliminarArticulo({
    required Session session,
    required int idArticulo,
  }) async {
    try {
      logger.info('Se va a eliminar el articulo con id: $idArticulo');
      await ejecutarOperacionOrm(
        session,
        (Session session) => session.db.query('''
            UPDATE "articulos" 
            SET "activo" = false
            WHERE "id" = $idArticulo AND "activo" = true;
          '''),
      );
      logger.finest(
        'Se elimino el articulo con id: $idArticulo',
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `listarArticulosPorMarca` recupera una lista de artículos
  /// basados en un ID de marca determinado.
  ///
  /// Args:
  ///   [session] ([Session]): El parámetro de sesión es de tipo Sesión y es
  ///   obligatorio.
  ///   [idMarca] ([int]): este parametro es un número entero que representa
  ///   el ID de una marca específica.
  Future<List<EntregableArticulo>> listarArticulosPorMarca({
    required Session session,
    required int idMarca,
  }) async {
    try {
      return await ejecutarOperacionOrm(
        session,
        (Session session) {
          logger.info(
            'Buscando los articulos segun marca con id: $idMarca',
          );
          return EntregableArticulo.find(
            session,
            where: (t) => t.idMarca.equals(idMarca),
            orderBy: EntregableArticuloTable().ultimaModificacion,
            orderDescending: true,
          );
        },
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Recupera los 3 ultimos articulos de la [Marca]. Ordenados del modificado en
  /// fecha mas reciente a mas antigua.
  ///
  /// Args:
  ///   [session] ([Session]): El parámetro de sesión es de tipo Sesión y es
  ///   obligatorio.
  ///   [idMarca] ([int]): este parametro es un número entero que representa
  ///   el ID de una marca específica.
  Future<List<EntregableArticulo>> listarUltimosTresArticulosPorMarca(
    Session session, {
    required int idMarca,
  }) async {
    return await ejecutarOperacionOrm(
      session,
      (session) => EntregableArticulo.find(
        session,
        where: (t) =>
            (t.idMarca.equals(idMarca)) & (t.fechaEliminacion.equals(null)),
        orderBy: EntregableArticuloTable().ultimaModificacion,
        orderDescending: true,
        limit: 3,
      ),
    );
  }

  /// La función [actualizarArticulo] actualiza un artículo con la sesión
  /// proporcionada y el objeto de artículo, y devuelve un booleano que indica
  /// si la actualización fue exitosa o no.
  ///
  /// Args:
  ///   [session] ([Session]): El parámetro de sesión es de tipo Sesión y es
  /// obligatorio.
  ///   [articulo] ([EntregableArticulo]): El parámetro "articulo" es un objeto de tipo
  /// "Articulo" que representa un artículo. Es necesario para la función y
  /// contiene la información del artículo que necesita ser actualizado.
  Future<bool> actualizarArticulo({
    required Session session,
    required EntregableArticulo articulo,
  }) async {
    try {
      logger.info(
        'Se va a actualizar el articulo en la BD con id ${articulo.id}...',
      );
      await ejecutarOperacionOrm(
        session,
        (Session session) => EntregableArticulo.update(
          session,
          articulo,
        ),
      );
      logger.finest(
        'Articulo ${articulo.id} actualizado en la BD',
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Cuenta los artículos pertenecientes a una [Marca].
  ///
  /// Args:
  ///   [session] ([Session]): El parámetro de sesión es de tipo Sesión y es
  ///   obligatorio.
  ///   [idMarca] ([int]): este parametro es un número entero que representa
  ///   el ID de una marca específica.
  Future<int> contarArticulosDeMarca(
    Session session, {
    required int idMarca,
  }) async {
    return await ejecutarOperacionOrm(
      session,
      (session) => EntregableArticulo.count(
        session,
        where: (t) =>
            (t.idMarca.equals(idMarca)) & (t.fechaEliminacion.equals(null)),
      ),
    );
  }

  /// La función `traerArticulosPorUsuario` recupera una lista de artículos pertenecientes a un usuario
  /// específico de una base de datos usando un ORM.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. Representa la
  /// sesión de usuario actual o la sesión de autenticación.
  ///
  /// Returns:
  ///   un `Futuro` que se resuelve en una `Lista` de objetos `EntregableArticulo`.
  Future<List<EntregableArticulo>> traerArticulosPorUsuario(
      {required Session session}) async {
    return ejecutarOperacionOrm(session, (session) async {
      logger.finer('buscando en la db los articulos del usuario');
      final idAutor = await session.auth.authenticatedUserId;
      final articulos = await EntregableArticulo.find(session,
          where: (t) =>
              t.idAutor.equals(idAutor) & t.fechaEliminacion.equals(null));
      logger.fine('articulos encontrados: ${articulos.length}');
      return articulos;
    });
  }

  /// La función `traerArticuloPorSlug` recupera un objeto `EntregableArticulo` de la base de datos en
  /// función de un slug determinado.
  ///
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión, que representa la sesión o conexión
  /// actual a la base de datos.
  ///   slug (String): El slug es un identificador único de un artículo. Por lo general, es una versión
  /// compatible con URL del título del artículo, que se utiliza para crear una URL limpia y legible.
  ///
  /// Returns:
  ///   un `Futuro` que se resuelve en un objeto `EntregableArticulo` o `null` (`EntregableArticulo?`).
  Future<EntregableArticulo?> traerArticuloPorSlug({
    required Session session,
    required String slug,
  }) async {
    return ejecutarOperacionOrm(session, (session) async {
      logger.finer('buscando en la db el articulo con slug: $slug');
      final articulo = await EntregableArticulo.findSingleRow(
        session,
        where: (t) => t.slug.equals(slug),
      );
      logger.fine('articulo encontrado');
      return articulo;
    });
  }

  /// La función `traerEntregableporFiltro` recupera una lista de objetos `EntregableArticulo` de una
  /// base de datos basada en un `idStatus` dado y la devuelve como un `Futuro`.
  ///
  /// Args:
  ///   session (Session): Un objeto de sesión necesario para realizar operaciones de base de datos.
  ///   idStatus (int): El parámetro idStatus es un número entero que representa el estado de los
  /// artículos que se recuperarán.
  ///
  /// Returns:
  ///   un `Futuro` que se resuelve en una `Lista` de objetos `EntregableArticulo`.
  @deprecated
  Future<List<EntregableArticulo>> traerEntregableporFiltro(
      {required Session session,
      required List<int> status,
      required int idAutor}) async {
    return ejecutarOperacionOrm(session, (session) async {
      List articulos = [];
      for (var i = 0; i < status.length; i++) {
        logger.finer('buscando en la db los articulos con status: $status');
        final articulo = await EntregableArticulo.find(session,
            where: (t) =>
                t.idStatus.equals(status[i]) &
                t.fechaEliminacion.equals(null) &
                t.idAutor.equals(idAutor));
        articulos.addAll(articulo);
        logger.fine('articulos encontrados: ${articulos.length}');
      }
      articulos.sort((a, b) => b.fechaCreacion.compareTo(a.fechaCreacion));
      final articulosFiltrados =
          articulos.where((articulo) => articulo.idAutor == idAutor).toList();

      return await Future.value(articulosFiltrados.cast<EntregableArticulo>());
    });
  }

  /// La función `traerEntregableporUsuarioyStatus` recupera una lista de objetos `EntregableArticulo`
  /// de una base de datos basada en una sesión determinada y un ID de marca.
  Future<List<EntregableArticulo>> listarEntregableporUsuarioyStatus(
    Session session,
    String texto, {
    required List<int> listaIdEstados,
  }) async {
    final idAutor = await session.auth.authenticatedUserId;
    logger.finer(
      '''buscando buscando todos los articulos de todas las marcas del autor $idAutor''',
    );
    return await EntregableArticulo.find(
      session,
      where: (t) =>
          t.idAutor.equals(idAutor) &
          t.fechaEliminacion.equals(null) &
          t.idStatus.contains(listaIdEstados),
    );
  }

  // si el texto no es vacio, se buscan los articulos por texto
  // y por idStatus
  Future<List<EntregableArticulo>> listarEntregableporTextoyMarca(
    Session session, {
    required String texto,
    required int idMarca,
    required List<int> idStatus,
  }) async {
    try {
      final articulos = <EntregableArticulo>[];
      if (idStatus.first == 0) {
        logger.finer('buscando en la db los articulos por texto: $texto');
        final articulo = await EntregableArticulo.find(
          session,
          where: (t) =>
              t.fechaEliminacion.equals(null) &
              t.titulo.like('%$texto%') &
              t.idMarca.equals(idMarca),
        );
        articulos.addAll(articulo);
        logger.fine('articulos encontrados: ${articulos.length}');
        return articulos.cast<EntregableArticulo>();
      }

      logger.finer('buscando en la db los articulos por texto: $texto');
      return await EntregableArticulo.find(
        session,
        where: (t) =>
            t.fechaEliminacion.equals(null) &
            t.titulo.like('%$texto%') &
            t.idMarca.equals(idMarca) &
            t.idStatus.contains(idStatus),
      );
    } catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `listarEntregablesporMarcayStatus` recupera una lista de objetos `EntregableArticulo`
  /// según la sesión proporcionada, la lista de ID de estado y la ID de marca.
  ///
  /// Args:
  ///   session (Session): Un objeto de sesión necesario para las operaciones de la base de datos.
  ///   idStatus (List): Una lista de ID de estado por los que filtrar los artículos.
  ///   idMarca (int): El parámetro idMarca es un número entero que representa el ID de una marca.
  ///
  /// Returns:
  ///   un `Futuro<Lista<EntregableArticulo>>`.
  Future<List<EntregableArticulo>> listarEntregablesporMarcayStatus(
    Session session, {
    required List<int> listaIdEstado,
    required int idMarca,
  }) async {
    // sino se buscan los articulos por idStatus
    try {
      logger
          .finer('buscando en la db los articulos con status: $listaIdEstado');
      return await EntregableArticulo.find(
        session,
        where: (t) =>
            t.idStatus.contains(listaIdEstado) &
            t.fechaEliminacion.equals(null) &
            t.idMarca.equals(idMarca),
      );
    } catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `traerEntregableTodosLosStatus` recupera una lista de objetos `EntregableArticulo` de
  /// una base de datos basada en una sesión determinada y un ID de marca.
  ///
  /// Args:
  ///   session (Session): Un objeto de sesión necesario para las operaciones de la base de datos.
  ///   idMarca: El parámetro `idMarca` es el ID de la marca de la que queremos recuperar los artículos
  /// entregables.
  ///
  /// Returns:
  ///   un objeto Futuro que se resuelve en una Lista de objetos EntregableArticulo.
  Future<List<EntregableArticulo>> traerEntregableTodosLosStatus(
    Session session, {
    required idMarca,
  }) async {
    try {
      logger.finer('buscando en la db los articulos con todos los status');
      final entregables = await EntregableArticulo.find(
        session,
        where: (t) =>
            t.idMarca.equals(idMarca) & t.fechaEliminacion.equals(null),
      );
      if (entregables.isEmpty) {
        return [];
      }
      logger.fine('articulos encontrados: ${entregables.length}');
      return entregables;
    } catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `listatEntregablesporUsuarioyTexto` recupera una lista de objetos `EntregableArticulo`
  /// basados en la sesión del usuario, un texto de búsqueda y una lista de ID de estado.
  ///
  /// Args:
  ///   session (Session): Un objeto de sesión que contiene información sobre la sesión del usuario
  /// actual.
  ///   texto (String): Una cadena que representa el texto a buscar en los títulos de los artículos.
  ///   idStatus (List): Una lista de ID de estado que se utilizan para filtrar los resultados de la
  /// búsqueda.
  ///
  /// Returns:
  ///   un `Futuro<Lista<EntregableArticulo>>`.
  Future<List<EntregableArticulo>> listatEntregablesporUsuarioyTexto(
    Session session, {
    required String texto,
    required List<int> listaIdEstado,
  }) async {
    final idAutor = await session.auth.authenticatedUserId;
    try {
      if (listaIdEstado.first == 0) {
        return EntregableArticulo.find(
          session,
          where: (t) =>
              t.fechaEliminacion.equals(null) &
              t.titulo.like('%$texto%') &
              t.idAutor.equals(idAutor),
        );
      }
      logger
          .finer('buscando en la db los articulos con status: $listaIdEstado');
      return await EntregableArticulo.find(
        session,
        where: (t) =>
            t.idStatus.contains(listaIdEstado) &
            t.fechaEliminacion.equals(null) &
            t.titulo.like('%$texto%') &
            t.idAutor.equals(idAutor),
      );
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<List<EntregableArticulo>> listarEntregableporUsuario(
    Session session,
  ) async {
    try {
      final idAutor = await session.auth.authenticatedUserId;
      logger.finer('buscando en la db los articulos del usuario');
      final articulos = await EntregableArticulo.find(
        session,
        where: (t) => t.idAutor.equals(idAutor) & t.fechaEliminacion.equals(null),
      );
      logger.fine('articulos encontrados: ${articulos.length}');
      return articulos;
    } catch (e) {
      throw Exception('$e');
    }
  }
}
