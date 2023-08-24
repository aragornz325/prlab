import 'package:serverpod/database.dart';
import 'package:serverpod/server.dart';

import '../odm.dart';

class OdmUsuario extends ODM {
  Future<bool> completarKyc({
    required Session session,
    required Map payload,
  }) async {
    try {
      await performOdmOperation(
          (Session session) => session.db.transaction((Transaction txn) async {
                await session.db.query(
                    "INSERT INTO serverpod_user_info (fullName) VALUES ('${payload['nombre']};${payload['apellido']}') WHERE id = \'$payload[id]\''");

                await session.db.query(
                  "INSERT INTO kyc (id_usuario, fecha_nacimiento, organizacion, direccion, telefono) VALUES ('$payload[id]', '$payload[fechaNacimiento]', '$payload[organizacion]', '$payload[direccion]', '$payload[telefono]') WHERE id = '$payload[id]'",
                );
              }));

      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
