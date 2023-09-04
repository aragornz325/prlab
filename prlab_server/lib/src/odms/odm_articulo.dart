import 'dart:async';

import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/odm.dart';
import 'package:serverpod/server.dart';

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
      final response = await performOdmOperation(session, (Session session) async {
        logger.info('Creando artículo: ${articulo.titulo}');
        await Articulo.insert(
          session,
          articulo
            ..idAutor = await session.auth.authenticatedUserId ?? 0
            ..fechaCreacion = DateTime.now()
            ..ultimaModificacion = DateTime.now(),
        );
        return await Articulo.findSingleRow(
          session,
          where: (t) => t.idAutor.equals(articulo.idAutor),
          orderBy: ArticuloTable().fechaCreacion,
          orderDescending: true,
        ) as Articulo;
      });
      logger.fine('Artículo ${articulo.titulo} creado exitosamente.');
      return response.id!;
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
      return await performOdmOperation(
        session,
        (Session session) => Articulo.find(session),
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
  Future<Articulo> obtenerArticulo({
    required Session session,
    required int id,
  }) async {
    try {
      logger.info('Obteniendo artículo con id: $id');
      final articulo = await performOdmOperation(
        session,
        (Session session) => Articulo.findById(session, id),
      );
      if (articulo == null) {
        logger.shout('no se encontro el articulo con id: $id');
        throw Exception('No se encontró el artículo con el id: $id');
      }
      logger.fine('Articulo con id: $id encontrado');
      return articulo;
    } on Exception catch (e) {
      throw Exception('$e');
    }
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
      logger.info('se va a eliminar el articulo con id: $id');
      await performOdmOperation(
        session,
        (Session session) => Articulo.delete(
          session,
          where: (t) => t.id.equals(id),
        ),
      );
      logger.fine('se elimino el articulo con id: $id');
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
      return await performOdmOperation(session, (Session session) {
        logger.info('buscando los articulos segun marca con id: $idMarca');
        return Articulo.find(
          session,
          where: (t) => t.idMarca.equals(idMarca),
        );
      });
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `actualizarArticulo` actualiza un artículo con la sesión proporcionada y el objeto de
  /// artículo, y devuelve un booleano que indica si la actualización fue exitosa o no.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio.
  ///   articulo (Articulo): El parámetro "articulo" es un objeto de tipo "Articulo" que representa un
  /// artículo. Es necesario para la función y contiene la información del artículo que necesita ser
  /// actualizado.

  Future<bool> actualizarArticulo({
    required Session session,
    required Articulo articulo,
  }) async {
    try {
      logger.info('se va a actualizar un articulo en la BD');
      await performOdmOperation(
        session,
        (Session session) => Articulo.update(
          session,
          articulo,
        ),
      );
      logger.finest('articulo actualizado en la BD');
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
