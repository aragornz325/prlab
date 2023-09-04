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
        (Session session) => Marca.find(session),
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

  /// Obtiene las marcas a las que se encuentra asignado un usuario.
  Future<List<Marca>> listarMarcasPorUsuario(
    Session session, {
    required int idUsuario,
  }) async {
    final queryListaDeIdMarcas = await performOdmOperation(
      session,
      (session) async {
        final query = await session.db.query(
          'SELECT "idMarca" FROM marcas_staff WHERE "idStaff" = $idUsuario;',
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
      SELECT "id", "nombre", "sitioWeb", "fechaCreacion", "ultimaModificacion", "fechaEliminacion" FROM marcas 
      WHERE "id" IN (${queryListaDeIdMarcas.join(',')});
      ''',
      keysMapaModeloDb:
          Marca(nombre: '', sitioWeb: '').toJsonForDatabase().keys,
    );

    final listasUsuarios = {};

    for (final marca in queryListaDeIdMarcas) {
      final listaUsuarios =
          await listarUsuariosPorMarca(session, idMarca: marca);
      listasUsuarios[marca] = listaUsuarios;
    }

    final responseSerializado = responseMaps
        .map(
          (e) => Marca.fromJson(e, AdministradorSerializacion())
            ..staffApi = listasUsuarios[e['id']],
        )
        .toList();
    return responseSerializado;
  }

  /// Obtiene los usuarios asignados a una marca.
  Future<List<Cliente>> listarUsuariosPorMarca(
    Session session, {
    required int idMarca,
  }) async {
    final queryListaDeIdUsuarios = await performOdmOperation(
      session,
      (session) async {
        final query = await session.db.query(
          'SELECT "idStaff" FROM marcas_staff WHERE "idMarca" = $idMarca;',
        );
        final listaIds = query.map((e) => e.first as int).toList();
        return listaIds;
      },
    );
    if (queryListaDeIdUsuarios.isEmpty) {
      return [];
    }

    final responseMaps = await rawQueryOperation(
      session,
      '''
          SELECT "id", "nombre", "apellido", "fechaDeNacimiento", "nombreDeOrganizacion", "domicilio", "telefono", "idUsuario", "idOrganizacion", "contacto", "fechaEliminacion", "ultimaModificacion", "fechaCreacion" FROM "clientes" 
          WHERE "idUsuario" IN (${queryListaDeIdUsuarios.join(',')});
        ''',
      keysMapaModeloDb: Cliente(
        nombre: 'nombre',
        apellido: 'apellido',
        fechaDeNacimiento: DateTime.now(),
        nombreDeOrganizacion: 'nombreDeOrganizacion',
        ultimaModificacion: DateTime.now(),
        fechaCreacion: DateTime.now(),
      ).toJsonForDatabase().keys,
    );

    final responseSerializado = responseMaps
        .map(
          (e) => Cliente.fromJson(e, AdministradorSerializacion()),
        )
        .toList();

    return responseSerializado;
  }
}
