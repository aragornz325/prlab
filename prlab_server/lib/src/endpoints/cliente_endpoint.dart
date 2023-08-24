import 'package:prlab_server/src/generated/cliente.dart';
import 'package:prlab_server/src/generated/informacion_de_contacto.dart';
import 'package:prlab_server/src/servicios/servicio_usuario.dart';
import 'package:serverpod/serverpod.dart';

class ClienteEndpoint extends Endpoint {
  final ServicioCliente servicioUsuario = ServicioCliente();

  Future<bool> completarKyc(
    Session session,
    Cliente datosDelCliente,
  ) async {
    try {
      print('Hola1');
      return await servicioUsuario.completarKyc(
        session: session,
        datosDelCliente: datosDelCliente,
      );
    } on Exception catch (e) {
      print('Error1 $e');
      rethrow;
    }
  }
}
