import 'package:prlab_server/src/generated/cliente.dart';
import 'package:prlab_server/src/servicios/servicio_cliente.dart';
import 'package:serverpod/serverpod.dart';

/// Endpoints de la entidad Cliente.
class ClienteEndpoint extends Endpoint {

  /// Instancia del Servicio para Cliente.
  final servicioCliente = ServicioCliente();

  /// Guarda los datos personales del cliente insertados en el formulario de
  /// registro.
  Future<bool> completarKyc(
    Session session,
    Cliente datosDelCliente,
  ) async {
    try {
      return await servicioCliente.completarKyc(
        session,
        datosDelCliente: datosDelCliente,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// Comprueba si un usuario completó la fase de registro.
  Future<bool> comprobarKyc(Session session, int idUsuario) async {
    return await servicioCliente.comprobarKyc(session, idUsuario: idUsuario);
  }

  /// Obtiene los usuarios asignados a una marca.
  Future<List> listarUsuariosPorMarca(
    Session session, {
    required int idMarca,
  }) async {
    return await servicioCliente.listarUsuariosPorMarca(
      session,
      idMarca: idMarca,
    );
  }
}
