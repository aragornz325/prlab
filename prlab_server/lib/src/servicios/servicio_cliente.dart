import 'package:prlab_server/src/generated/cliente.dart';
import 'package:prlab_server/src/generated/informacion_de_contacto.dart';
import 'package:prlab_server/src/odms/odm_cliente.dart';
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
      logger.info('Completando KYC para ${datosDelCliente.nombre}');
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
