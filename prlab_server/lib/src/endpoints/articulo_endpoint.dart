import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/servicios/servicio_articulo.dart';
import 'package:serverpod/server.dart';

class ArticuloEndpoint extends Endpoint {
  final servicioArticulo = ServicioArticulo();

  /// La función `crearArticulo` es que crea un artículo usando una sesión y un
  /// payload, y devuelve un booleano que indica si la creación fue exitosa.
  ///
  /// Args:
  ///   session (Session): Un objeto de sesión que representa la sesión del
  /// usuario actual. Puede contener información como el token de autenticación
  /// del usuario u otros datos relacionados con la sesión.
  ///   payload (Articulo): El parámetro "payload" es un objeto de tipo
  /// "Articulo" que contiene los datos necesarios para crear un artículo.
  Future<bool> crearArticulo(
    Session session,
    Articulo payload,
  ) async {
    try {
      return await servicioArticulo.crearArticulo(
        session: session,
        payload: payload,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// La función `listarArticulos` recupera una lista de artículos usando un objeto de sesión y un
  /// objeto de servicio.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es obligatorio.

  Future<List<Articulo>> listarArticulos(
    Session session,
  ) async {
    try {
      return await servicioArticulo.listarArticulos(
        session: session,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// La función `obtenerArticulo` es una función asincrónica de Dart que toma un objeto `Session` y un
  /// `id` entero como parámetros, y devuelve un `Future` que se resuelve en un objeto `Articulo`.
  ///
  /// Args:
  ///   session (Session): Un objeto de sesión que contiene información sobre la sesión del usuario.
  ///   id (int): El parámetro "id" es un número entero que representa el identificador único del
  /// artículo que desea obtener.

  Future<Articulo> obtenerArticulo(
    Session session,
    int id,
  ) async {
    try {
      return await servicioArticulo.obtenerArticulo(
        session: session,
        id: id,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// La función `eliminarArticulo` es una función asincrónica de Dart que intenta eliminar un artículo
  /// utilizando una sesión e ID proporcionadas, y devuelve un valor booleano que indica si la
  /// eliminación fue exitosa o no.
  ///
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión.
  ///   id (int): El parámetro "id" es un número entero que representa el identificador único del
  /// artículo que debe eliminarse.

  Future<bool> eliminarArticulo(
    Session session,
    int id,
  ) async {
    try {
      return await servicioArticulo.eliminarArticulo(
        session: session,
        id: id,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }
}
