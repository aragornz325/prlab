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
      return await ejecutarOperacion(
        () => odm.completarKyc(
          session: session,
          datosDelCliente: datosDelCliente,
        ),
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// Obtiene los usuarios asignados a una marca.
  Future<List<Cliente>> listarUsuariosPorMarca(
    Session session, {
    required int idMarca,
  }) async {
    logger.info('Recuperando usuarios relacionados a la marca $idMarca...');
    return await ejecutarOperacion(
      () => odm.listarUsuariosPorMarca(
        session,
        idMarca: idMarca,
      ),
    );
  }
}
