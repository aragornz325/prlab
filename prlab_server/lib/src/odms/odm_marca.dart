import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/odm.dart';
import 'package:serverpod/server.dart';

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
        session,
        (Session session) {
          logger.info('Creando marca: ${payload.nombre}');
          return Marca.insert(session, payload);
        },
      );
      logger.fine('Marca ${payload.nombre} creada exitosamente.');
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
        session,
        Marca.find,
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `listarMarcasDeUsuario` recupera una lista de marcas asociadas
  ///  con un ID de usuario específico de una base de datos mediante una
  /// operación ODM.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión, que
  ///   representa una sesión de base de datos.
  ///   idUsuario (int): La identificación del usuario para el cual queremos
  ///   enumerar las marcas.
  Future<List<dynamic>> listarMarcasDeUsuario(
    Session session, {
    required int idUsuario,
  }) async =>
      performOdmOperation(
        session,
        (session) => session.db.query(
          'SELECT * FROM marcas WHERE EXISTS (SELECT 1 FROM json_array_elements_text(staff) AS element WHERE CAST(element AS INTEGER) = $idUsuario);',
        ),
      );

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

  /// La función `obtenerMarca` recupera una marca por su ID usando una
  ///  operación ODM y la devuelve, o lanza una excepción si no se encuentra la
  ///  marca.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es
  ///   obligatorio. Representa la sesión o conexión actual a la base de datos.
  ///   id (int): El parámetro `id` es un número entero que representa el
  ///   identificador único de la marca que queremos recuperar.
  ///
  /// Returns:
  ///   La función `obtenerMarca` devuelve un `Futuro<Marca>`.
  Future<Marca> obtenerMarca({
    required Session session,
    required int id,
  }) async {
    try {
      final marca = await performOdmOperation(
        session,
        (Session session) {
          logger.info('Buscando marca con id: $id');
          return Marca.findById(session, id);
        },
      );
      if (marca == null) {
        logger.shout('No se encontró la marca con id: $id');
        throw Exception('No se encontró la marca con el id: $id');
      }
      logger.fine('Marca con id: $id encontrada');
      return marca;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
