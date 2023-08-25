import 'package:prlab_server/src/generated/cliente.dart';
import 'package:prlab_server/src/generated/informacion_de_contacto.dart';
import 'package:prlab_server/src/odm.dart';
import 'package:serverpod/database.dart';
import 'package:serverpod/server.dart';

/// ODM para manejo de información de Usuario.
class OdmCliente extends ODM {
  /// Metodo para insertar primeros datos del usuario.
  Future<bool> completarKyc({
    required Session session,
    required Cliente datosDelCliente,
  }) async {
    try {
      super.session = session;
      await performOdmOperation(
        (Session session) => session.db.transaction((transaction) async {
          await session.db.query(
              'INSERT INTO serverpod_user_info (fullName) VALUES (\"${datosDelCliente.nombre};${datosDelCliente.apellido}\")');
          await session.db.insert(datosDelCliente
            ..fechaCreacion = DateTime.now()
            ..ultimaModificacion = DateTime.now());
        }),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
