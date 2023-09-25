import 'dart:async';

import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/orm.dart';
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
            await EntregableArticulo.insert(
              session,
              articulo
                ..idAutor = await session.auth.authenticatedUserId ?? 0
                ..fechaCreacion = DateTime.now()
                ..ultimaModificacion = DateTime.now()
                ..activo = true,
            );
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
          where: (t) => t.activo.equals(true),
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
            (t.idMarca.equals(idMarca)) & (t.activo.equals(true)),
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
          articulo..ultimaModificacion = DateTime.now(),
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
        where: (t) => (t.idMarca.equals(idMarca)) & (t.activo.equals(true)),
      ),
    );
  }

  Future<List<EntregableArticulo>> traerArticulosPorUsuario(
      {required Session session}) async {
    return ejecutarOperacionOrm(session, (session) async {
      logger.finer('buscando en la db los articulos del usuario');
      final idAutor = await session.auth.authenticatedUserId;
      final articulos = await EntregableArticulo.find(session,
          where: (t) => t.idAutor.equals(idAutor) & t.activo.equals(true));
      logger.fine('articulos encontrados: ${articulos.length}');
      return articulos;
    });
  }
}