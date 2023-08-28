import 'package:prlab_server/src/generated/cliente.dart';
import 'package:prlab_server/src/odm.dart';
import 'package:serverpod/database.dart';
import 'package:serverpod/server.dart';

/// ODM para manejo de información de Usuario.
class OdmCliente extends ODM {
  /// Guarda los datos personales del cliente insertados en el formulario de
  /// registro.
  Future<bool> completarKyc({
    required Session session,
    required Cliente datosDelCliente,
  }) async {
    try {
      await performOdmOperation(
        session,
        (Session session) =>
            session.db.transaction((Transaction transaction) async {
          await session.db.query(
              'UPDATE serverpod_user_info SET "fullName" = \'${datosDelCliente.nombre};${datosDelCliente.apellido}\' WHERE \"id\" = ${datosDelCliente.idUsuario};');
          await session.db.insert(
            datosDelCliente
              ..fechaCreacion = DateTime.now()
              ..ultimaModificacion = DateTime.now(),
          );
        }),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
