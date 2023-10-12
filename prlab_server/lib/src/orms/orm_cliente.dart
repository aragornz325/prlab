import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/orm.dart';
import 'package:serverpod/database.dart';
import 'package:serverpod/server.dart';

/// ODM para manejo de información de Usuario.
class OrmCliente extends ORM {
  /// Guarda los datos personales del cliente insertados en el formulario de
  /// registro.
  Future<bool> completarKyc({
    required Session session,
    required Cliente datosDelCliente,
  }) async {
    try {
      await ejecutarOperacionOrm(
        session,
        (Session session) =>
            session.db.transaction((Transaction transaction) async {
          await session.db.query(
            '''
              UPDATE serverpod_user_info 
              SET "fullName" = '${datosDelCliente.nombre};${datosDelCliente.apellido}' 
              WHERE "id" = ${datosDelCliente.idUsuario};
              ''',
          );
          await session.db.insert(
            datosDelCliente
              ..fechaCreacion = DateTime.now()
              ..ultimaModificacion = DateTime.now()
              ..activo = true,
          );
        }),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Comprueba si un usuario completó la fase de registro.
  Future<bool> comprobarKyc(Session session, {required int idUsuario}) async {
    final query = await ejecutarOperacionOrm(
      session,
      (session) => Cliente.findSingleRow(
        session,
        where: (t) => t.idUsuario.equals(idUsuario),
      ),
    );

    return query != null;
  }

  /// Obtiene los usuarios asignados a una marca.
  Future<List<Cliente>> listarUsuariosPorMarca(
    Session session, {
    required int idMarca,
  }) async {
    final queryListaDeIdUsuarios = await ejecutarOperacionOrm(
      session,
      (session) async {
        final query = await session.db.query(
          '''
            SELECT "idStaff" FROM marcas_staff 
            WHERE "idMarca" = $idMarca AND "fechaEliminacion" IS NULL;
          ''',
        );
        final listaIds = query.map((e) => e.first as int).toList();
        return listaIds;
      },
    );

    if (queryListaDeIdUsuarios.isEmpty) {
      return [];
    }

    final responseMaps = await ejecutarConsultaSql(
      session,
      '''
          SELECT "id", "nombre", "apellido", "fechaDeNacimiento", "nombreDeOrganizacion", "domicilio", "telefono", "idUsuario", "idOrganizacion", "contacto", "ultimaModificacion", "fechaCreacion" FROM "clientes" 
          WHERE "idUsuario" IN (${queryListaDeIdUsuarios.join(',')});
        ''',
      clavesMapaModeloDb: (Cliente(
        nombre: 'nombre',
        apellido: 'apellido',
        fechaDeNacimiento: DateTime.now(),
        nombreDeOrganizacion: 'nombreDeOrganizacion',
        ultimaModificacion: DateTime.now(),
        fechaCreacion: DateTime.now(),
      ).toJsonForDatabase()
            ..remove('activo'))
          .keys,
    );

    final responseSerializado = responseMaps
        .map(
          (e) => Cliente.fromJson(
            e
              ..['fechaDeNacimiento'] = e['fechaDeNacimiento'].toString()
              ..['ultimaModificacion'] = e['ultimaModificacion'].toString()
              ..['fechaCreacion'] = e['fechaCreacion'].toString(),
            Protocol(),
          ),
        )
        .toList();

    return responseSerializado;
  }
}
