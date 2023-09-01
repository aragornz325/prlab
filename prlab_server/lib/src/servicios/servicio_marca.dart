import 'package:prlab_server/src/generated/marca.dart';
import 'package:prlab_server/src/odms/odm_marca.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/server.dart';

class ServicioMarca extends Servicio<OdmMarca> {
  @override
  final odm = OdmMarca();

  /// La función `crearMarca` crea una nueva marca y devuelve un booleano que
  /// indica si la operación fue exitosa.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es
  /// obligatorio. Se utiliza para especificar la sesión de creación de la
  /// marca.
  ///   payload (Marca): El parámetro `payload` es de tipo `Marca` y es
  /// obligatorio. Representa los datos que se utilizarán para crear una nueva
  /// marca.
  Future<bool> crearMarca({
    required Session session,
    required Marca payload,
  }) async {
    try {
      logger.info('Creando Marca ${payload.nombre}');
      return await performOperation(
        () => odm.crearMarca(
          session: session,
          payload: payload
            ..fechaCreacion = DateTime.now()
            ..ultimaModificacion = DateTime.now(),
        ),
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// La función `listarMarcas` lista todas las marcas usando una sesión
  /// proporcionada.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es
  /// obligatorio.
  ///
  /// Returns:
  ///   El método devuelve un objeto `Futuro` que se resuelve en una
  /// `Lista<Marca>`.
  Future<List<Marca>> listarMarcas({
    required Session session,
  }) async {
    try {
      logger.info('Listando Marcas');
      return await performOperation(
        () => odm.listarMarcas(
          session: session,
        ),
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<Marca> obtenerMarcaPorId(Session session, int idMarca) async {
    return await performOperation(() => odm.obtenerMarcaPorId(session, idMarca));
  }

  // Future<List<dynamic>> listarMarcasDeUsuario(
  //   Session session, {
  //   required int idUsuario,
  // }) async {
  //   return await performOperation(
  //     () => odm.listarMarcasDeUsuario(
  //       session,
  //       idUsuario: idUsuario,
  //     ),
  //   );
  // }

  /// La función `eliminarMarca` se utiliza para eliminar una marca por su ID.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es
  /// obligatorio. Representa el objeto de sesión que se utiliza para la
  /// operación.
  ///   id (int): El parámetro "id" es un número entero que representa el
  /// identificador único de la marca que debe eliminarse.
  Future<bool> eliminarMarca({
    required Session session,
    required int id,
  }) async {
    try {
      logger.info('se va a eliminar la marca con id $id');
      logger.finer('verificando que la marca exista');
      await performOperation(
        () => odm.obtenerMarca(session: session, id: id),
      );
      logger.finer('eliminando marca');
      return await performOperation(
        () => odm.eliminarMarca(
          session: session,
          id: id,
        ),
      );
    } on Exception catch (e) {
      rethrow;
    }
  }
}
