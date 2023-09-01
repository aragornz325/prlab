import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/odms/odm_articulo.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/server.dart';

class ServicioArticulo extends Servicio<OdmArticulo> {
  @override
  final odm = OdmArticulo();

  /// La función `crearArticulo` crea un artículo llamando al método
  /// `odm.crearArticulo` y manejando cualquier excepción que ocurra.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es
  /// obligatorio. Representa el objeto de sesión que se utiliza con fines de
  /// autenticación o seguimiento. payload (Articulo): El parámetro "payload" es
  /// un objeto de tipo "Articulo" que contiene los datos necesarios para crear
  /// un artículo.
  Future crearArticulo({
    required Session session,
    required Articulo payload,
  }) async {
    try {
      await performOperation(
        () => odm.crearArticulo(
          session: session,
          payload: payload,
        ),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `listarArticulos` lista todos los artículos usando una sesión
  /// proporcionada.
  ///
  /// Args:
  ///  session (Session): El parámetro "sesión" es de tipo "Sesión" y es
  /// obligatorio.
  Future<List<Articulo>> listarArticulos({
    required Session session,
  }) async {
    try {
      return await performOperation(
        () => odm.listarArticulos(
          session: session,
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `obtenerArticulo` recupera un artículo usando una sesión y un ID, y lanza una excepción
  /// si ocurre un error.
  ///
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión.
  ///   id (int): El parámetro "id" es un número entero que representa el identificador único del
  /// artículo que se debe obtener.

  Future<Articulo> obtenerArticulo({
    required Session session,
    required int id,
  }) async {
    try {
      return await performOperation(
        () => odm.obtenerArticulo(
          session: session,
          id: id,
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `eliminarArticulo` es una función de Dart que intenta eliminar un artículo utilizando
  /// una sesión e ID proporcionados, y devuelve un valor booleano que indica si la operación fue
  /// exitosa o no.
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
      await performOperation(
        () => odm.obtenerArticulo(session: session, id: id),
      );
      await performOperation(
        () => odm.eliminarArticulo(
          session: session,
          id: id,
        ),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `listarArticulosPorMarca` recupera una lista de artículos por marca usando una sesión y
  /// un ID de marca.
  ///
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión.
  ///   idMarca (int): La identificación de la marca para la que desea enumerar los artículos.

  Future<List<Articulo>> listarArticulosPorMarca({
    required Session session,
    required int idMarca,
  }) async {
    try {
      return await performOperation(
        () => odm.listarArticulosPorMarca(
          session: session,
          idMarca: idMarca,
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `actualizarArticulo` actualiza un artículo en una sesión y devuelve un booleano que
  /// indica si la operación fue exitosa.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es obligatorio.
  ///   articulo (Articulo): El parámetro "articulo" es de tipo Articulo y es obligatorio.

  Future<bool> actualizarArticulo({
    required Session session,
    required Articulo articulo,
  }) async {
    try {

      await performOperation(
        () => odm.obtenerArticulo(
          session: session,
          id: articulo.id!,
        ),
      );

    



      await performOperation(
        () {
          logger.info('se va a actualizar el articulo con id: ${articulo.id}');
          return odm.actualizarArticulo(
            session: session,
            articulo: articulo,
          );
        },
      );
      logger.fine('se actualizo el articulo con id: ${articulo.id}');
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
