import 'dart:async';

import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/odm.dart';
import 'package:serverpod/server.dart';

class OdmArticulo extends ODM {
  /// La función `crearArticulo` crea un nuevo artículo insertándolo en una base de datos mediante una
  /// operación ODM.
  /// 
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio.
  ///   payload (Articulo): El parámetro payload es de tipo Articulo, que representa los datos del
  /// artículo que se debe crear.

  Future<bool> crearArticulo({
    required Session session,
    required Articulo payload,
  }) async {
    try {
      await performOdmOperation(
          session,
          (Session session) => Articulo.insert(
                session,
                payload
                  ..fechaCreacion = DateTime.now()
                  ..ultimaModificacion = DateTime.now(),
              ));
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `listarArticulos` recupera una lista de artículos usando una sesión y una operación
  /// ODM.
  /// 
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es obligatorio.
  Future<List<Articulo>> listarArticulos({
    required Session session,
  }) async {
    try {
      return await performOdmOperation(
          session, (Session session) => Articulo.find(session));
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `obtenerArticulo` recupera un artículo por su ID usando una operación ODM y lo
  /// devuelve, o lanza una excepción si no se encuentra el artículo.
  /// 
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. 
  ///   id (int): El parámetro "id" es un número entero que representa el identificador único del
  /// artículo que debe recuperarse.
  Future<Articulo> obtenerArticulo({
    required Session session,
    required int id,
  }) async {
    try {
      final articulo = await performOdmOperation(
          session, (Session session) => Articulo.findById(session, id));
      if (articulo == null) {
        throw Exception('No se encontró el artículo con el id: $id');
      }
      return articulo;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `eliminarArticulo` elimina un artículo de una sesión usando su ID.
  /// 
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es obligatorio.
  ///   id (int): El parámetro "id" es un número entero que representa el identificador único del
  /// artículo que debe eliminarse.
  Future<bool> eliminarArticulo({
    required Session session,
    required int id,
  }) async {
    try {
      await obtenerArticulo(session: session, id: id);
      await performOdmOperation(
        session,
        (Session session) => Articulo.delete(
          session,
          where: (t) => t.id.equals(id),
        ),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
