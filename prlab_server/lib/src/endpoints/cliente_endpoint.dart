import 'package:prlab_server/src/generated/cliente.dart';
import 'package:prlab_server/src/servicios/servicio_cliente.dart';
import 'package:serverpod/serverpod.dart';

/// Endpoints de la entidad Cliente.
class ClienteEndpoint extends Endpoint {

  /// Instancia del Servicio para Cliente.
  final ServicioCliente servicioCliente = ServicioCliente();

  /// Guarda los datos personales del cliente insertados en el formulario de
  /// registro.
  Future<bool> completarKyc(
    Session session,
    Cliente datosDelCliente,
  ) async {
    try {
      return await servicioCliente.completarKyc(
        session: session,
        datosDelCliente: datosDelCliente,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }
}
