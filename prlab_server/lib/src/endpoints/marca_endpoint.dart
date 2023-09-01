import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/servicios/servicio_marca.dart';
import 'package:serverpod/serverpod.dart';

class MarcaEndpoint extends Endpoint {
  final servicioMarca = ServicioMarca();

  /// La función `crearMarca` crea una nueva marca llamando al método
  /// `crearMarca` del servicio`servicioMarca` y devuelve un booleano
  /// que indica éxito.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y representa
  ///   la sesión del usuario
  /// actual.
  ///   payload (Marca): El parámetro "payload" es un objeto de tipo "Marca" que
  ///   contiene los datos necesarios para crear una nueva marca..
  Future<bool> crearMarca(
    Session session,
    Marca payload,
  ) async {
    try {
      await servicioMarca.crearMarca(
        session: session,
        payload: payload,
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `eliminarMarca` es una función que toma un objeto `Session` y
  /// un entero `id` como parámetros, e intenta eliminar una marca usando el
  /// método `servicioMarca.eliminarMarca`.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y representa
  ///   la sesión del usuario
  /// actual
  ///   id (int): La identificación de la marca que debe eliminarse.
  Future<bool> eliminarMarca(
    Session session,
    int id,
  ) async {
    try {
      await servicioMarca.eliminarMarca(
        session: session,
        id: id,
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `listarMarcas` recupera una lista de marcas usando un objeto
  /// de sesión y un objeto de servicio.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión". Se utiliza
  ///   para pasar la información de la sesión al método "listarMarcas".

  Future<List<Marca>> listarMarcas(
    Session session,
  ) async {
    try {
      return servicioMarca.listarMarcas(
        session: session,
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  Future<Marca> obtenerMarcaPorId(Session session, int idMarca) async {
    return await servicioMarca.obtenerMarcaPorId(session, idMarca);
  }

  /// La función `listarMarcasDeUsuario` recupera una lista de marcas asociadas
  /// a un usuario.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y se utiliza
  ///   para mantener la información de la sesión del usuario.
  ///   enumerar las marcas.
  Future<List<dynamic>> listarMarcasDeUsuario(
    Session session, {
    required int idUsuario,
  }) async =>
      servicioMarca.listarMarcasDeUsuario(
        session,
        idUsuario: idUsuario,
      );
}
