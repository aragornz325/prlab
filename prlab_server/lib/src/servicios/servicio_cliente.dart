import 'package:prlab_server/src/generated/cliente.dart';
import 'package:prlab_server/src/odms/odm_cliente.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/server.dart';

/// Servicio para administrar Datos de Cliente.
class ServicioCliente extends Servicio<OdmCliente> {
  @override
  final odm = OdmCliente();

  /// Guarda los datos personales del cliente insertados en el formulario de
  /// registro.
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
      rethrow;
    }
  }
}
