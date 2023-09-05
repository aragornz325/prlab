import 'dart:async';

import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/odm.dart';
import 'package:prlab_server/utils/manejo_de_errores/manejo_de_errores.dart';
import 'package:serverpod/server.dart';

/// ODM para administracion de articulos.
class OdmArticulo extends ODM {
  /// La función `crearArticulo` crea un nuevo artículo insertándolo en una base
  ///  de datos mediante una operación ODM.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es
  ///   obligatorio.
  ///   payload (Articulo): El parámetro payload es de tipo Articulo, que
  ///   representa los datos del artículo que se debe crear.
  Future<int> crearArticulo({
    required Session session,
    required Articulo articulo,
  }) async {
    try {
      return await ejecutarOperacionOdm(
        session,
        (session) => session.db.transaction(
          (transaction) async {
            logger.info(
              'Creando artículo: "${articulo.titulo}"...',
            );
            await Articulo.insert(
              session,
              articulo
                ..idAutor = await session.auth.authenticatedUserId ?? 0
                ..fechaCreacion = DateTime.now()
                ..ultimaModificacion = DateTime.now(),
            );
            final response = (await Articulo.findSingleRow(
              session,
              where: (t) => t.idAutor.equals(articulo.idAutor),
              orderBy: ArticuloTable().fechaCreacion,
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

  /// La función `listarArticulos` recupera una lista de artículos usando una
  /// sesión y una operación ODM.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es
  ///   obligatorio.
  Future<List<Articulo>> listarArticulos({
    required Session session,
  }) async {
    try {
      logger.info('Listando artículos');
      return await ejecutarOperacionOdm(
        session,
        Articulo.find,
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `obtenerArticulo` recupera un artículo por su ID usando una
  /// operación ODM y lo devuelve, o lanza una excepción si no se encuentra
  /// el artículo.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es
  ///   obligatorio.
  ///   id (int): El parámetro "id" es un número entero que representa el
  ///   identificador único del artículo que debe recuperarse.
  Future<Articulo> obtenerArticuloPorId({
    required Session session,
    required int id,
  }) async {
    logger.info(
      'Obteniendo artículo con id: $id',
    );
    final articulo = await ejecutarOperacionOdm(
      session,
      (Session session) => Articulo.findById(
        session,
        id,
      ),
    );
    if (articulo == null) {
      const error = ErrorPrLab.errorElementoNoEncontrado;
      throw ExceptionPrLab(
        mensaje: error.mensaje,
        errorType: error,
      );
    }
    logger.finest(
      'Articulo con id: $id encontrado',
    );
    return articulo;
  }

  /// La función `eliminarArticulo` elimina un artículo de una sesión usando su
  /// ID.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es
  ///   obligatorio.
  ///   id (int): El parámetro "id" es un número entero que representa el
  ///   identificador único del artículo que debe eliminarse.
  Future<bool> eliminarArticulo({
    required Session session,
    required int id,
  }) async {
    try {
      logger.info('Se va a eliminar el articulo con id: $id');
      await ejecutarOperacionOdm(
        session,
        (Session session) => Articulo.delete(
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

  /// La función `listarArticulosPorMarca` recupera una lista de artículos
  /// basados en un ID de marca determinado.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es
  ///   obligatorio.
  ///   idMarca (int): El parámetro `idMarca` es un número entero que representa
  ///   el ID de una marca específica.
  Future<List<Articulo>> listarArticulosPorMarca({
    required Session session,
    required int idMarca,
  }) async {
    try {
      return await ejecutarOperacionOdm(
        session,
        (Session session) {
          logger.info(
            'Buscando los articulos segun marca con id: $idMarca',
          );
          return Articulo.find(
            session,
            where: (t) => t.idMarca.equals(idMarca),
            orderBy: ArticuloTable().ultimaModificacion,
            orderDescending: true,
          );
        },
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Recupera los 3 ultimos articulos de la marca. Ordenados del modificado en 
  /// fecha mas reciente a mas antigua.
  Future<List<Articulo>> listarUltimosTresArticulosPorMarca(
    Session session, {
    required int idMarca,
  }) async {
    return await ejecutarOperacionOdm(
      session,
      (session) => Articulo.find(
        session,
        where: (t) => t.idMarca.equals(idMarca),
        orderBy: ArticuloTable().ultimaModificacion,
        orderDescending: true,
        limit: 3,
      ),
    );
  }

  /// La función `actualizarArticulo` actualiza un artículo con la sesión
  /// proporcionada y el objeto de artículo, y devuelve un booleano que indica
  /// si la actualización fue exitosa o no.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es
  /// obligatorio.
  ///   articulo (Articulo): El parámetro "articulo" es un objeto de tipo
  /// "Articulo" que representa un artículo. Es necesario para la función y
  /// contiene la información del artículo que necesita ser actualizado.
  Future<bool> actualizarArticulo({
    required Session session,
    required Articulo articulo,
  }) async {
    try {
      logger.info(
        'Se va a actualizar el articulo en la BD con id ${articulo.id}...',
      );
      await ejecutarOperacionOdm(
        session,
        (Session session) => Articulo.update(
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
}
