import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/odm.dart';
import 'package:prlab_server/utils/serialization.dart';
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
          return Marca.insert(
            session,
            payload
              ..fechaCreacion = DateTime.now()
              ..ultimaModificacion = DateTime.now(),
          );
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

  /// Obtiene el registro de una marca por su id.
  Future<Marca> obtenerMarcaPorId({
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

  Future<bool> actualizarMarca(Session session, {required Marca marca}) async {
    return await performOdmOperation(
      session,
      (session) => Marca.update(
        session,
        marca..ultimaModificacion = DateTime.now(),
      ),
    );
  }

  /// Crea la relación entre una marca y un usuario.
  Future<List<List<dynamic>>> asignarUsuarioAMarca(
    Session session, {
    required int idMarca,
    required int idUsuario,
    required int idRol,
  }) async {
    return await performOdmOperation(
      session,
      (session) => session.db.query('''
      INSERT INTO "marcas_staff" ("idMarca", "idStaff", "idRol") 
      VALUES ($idMarca, $idUsuario, $idRol);
      '''),
    );
  }

  /// Da de baja la relacion entre el usuario y la marca 
  /// en la tabla intermedia.
  Future<List<List<dynamic>>> desvincularUsuarioDeMarca(
    Session session, {
    required int idMarca,
    required int idUsuario,
  }) async {
    return await performOdmOperation(session, (session) => session.db.query('''
      UPDATE "marcas_staff"
      SET "fechaEliminacion" = '${DateTime.now().toIso8601String()}'
      WHERE "idMarca" = $idMarca AND "idStaff" = $idUsuario AND "fechaEliminacion" IS NULL;
      '''),);
  }

  /// Obtiene las marcas a las que se encuentra asignado un usuario.
  Future<List<Marca>> listarMarcasPorUsuario(
    Session session, {
    required int idUsuario,
  }) async {
    final queryListaDeIdMarcas = await performOdmOperation(
      session,
      (session) async {
        final query = await session.db.query(
          'SELECT "idMarca" FROM "marcas_staff" WHERE "idStaff" = $idUsuario;',
        );
        final listaIds = query.map((e) => e.first as int).toList();
        return listaIds;
      },
    );

    if (queryListaDeIdMarcas.isEmpty) {
      return [];
    }

    final responseMaps = await rawQueryOperation(
      session,
      '''
      SELECT "id", "nombre", "sitioWeb", "fechaCreacion", "ultimaModificacion", "fechaEliminacion" FROM "marcas" 
      WHERE "id" IN (${queryListaDeIdMarcas.join(',')});
      ''',
      keysMapaModeloDb:
          Marca(nombre: '', sitioWeb: '').toJsonForDatabase().keys,
    );

    final responseSerializado = responseMaps
        .map(
          (e) => Marca.fromJson(e, AdministradorSerializacion()),
        )
        .toList();
    return responseSerializado;
  }
}
