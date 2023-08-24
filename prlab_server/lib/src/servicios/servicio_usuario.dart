import 'package:prlab_server/src/generated/cliente.dart';
import 'package:prlab_server/src/generated/informacion_de_contacto.dart';
import 'package:prlab_server/src/odms/odm_usuario.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/server.dart';

class ServicioCliente extends Servicio<OdmCliente> {
  @override
  final OdmCliente odm = OdmCliente();

  Future<bool> completarKyc({
    required Session session,
    required Cliente datosDelCliente,
  }) async {
    try {
      print('Hola2');
      return await performOperation(
        () => odm.completarKyc(
          session: session,
          datosDelCliente: datosDelCliente,
        ),
      );
    } on Exception catch (e) {
      print('Error2 $e');
      rethrow;
    }
  }
}
