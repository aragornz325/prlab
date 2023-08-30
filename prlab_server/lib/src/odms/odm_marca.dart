import 'package:prlab_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

import '../odm.dart';

/// La clase `OdmMarca` es una clase Dart que proporciona funciones para crear
/// borrar, modificar y listar objetos `Marca` usando una operación ODM.
class OdmMarca extends ODM {
  /// La función `crearMarca` es una función de Dart que crea un nuevo objeto
  /// `Marca` en una base de datos mediante una operación ODM.

  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es
  /// obligatorio. Representa lasesión de la base de datos que se utilizará para
  /// la operación.  payload (Marca): El parámetro `payload` es de tipo `Marca`,
  /// que es un objeto que representa los datos a insertar en la base de datos.
  Future<bool> crearMarca({
    required Session session,
    required Marca payload,
  }) async {
    try {
      await performOdmOperation(
          session, (Session session) => Marca.insert(session, payload));
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `listarMarcas` recupera una lista de objetos `Marca` usando
  /// una operación ODM y una sesión proporcionada.
  Future<List<Marca>> listarMarcas({
    required Session session,
  }) async {
    try {
      return await performOdmOperation(
          session, (Session session) => Marca.find(session));
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  Future<List<dynamic>> listarMarcasDeUsuario(
    Session session, {
    required int idUsuario,
  }) async =>
      await performOdmOperation(
        session,
        (session) => session.db.query('SELECT * FROM marcas WHERE EXISTS (SELECT 1 FROM json_array_elements_text(staff) AS element WHERE CAST(element AS INTEGER) = $idUsuario);'),);

  /// La función `eliminarMarca` elimina un registro de la base de datos según
  /// el ID proporcionado.
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es
  /// obligatorio. Representa la sesión de la base de datos que se utilizará
  /// para la operación. id (int): El parámetro "id" es un número entero que
  ///  representa el identificador único de la marca que debe eliminarse.

  Future<bool> eliminarMarca({
    required Session session,
    required int id,
  }) async {
    try {
      await obtenerMarca(session: session, id: id);
      await performOdmOperation(
        session,
        (Session session) => Marca.delete(
          session,
          where: (t) => t.id.equals(id),
        ),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  Future<Marca> obtenerMarca({
    required Session session,
    required int id,
  }) async {
    try {
      final marca = await performOdmOperation(
        session,
        (Session session) => Marca.findById(session, id),
      );
      if (marca == null) {
        throw Exception('No se encontró la marca con el id: $id');
      }
      return marca;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
