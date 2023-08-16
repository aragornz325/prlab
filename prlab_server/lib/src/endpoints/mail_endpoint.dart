import 'package:prlab_server/src/servicios/servicio_mailer.dart';
import 'package:serverpod/serverpod.dart';

final servicioMail = ServicioMail();

class MailEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<bool> envioMailRegistro(
    Session session,
    String email,
    int tipo_de_invitacion,
  ) async {
    try {
      return servicioMail.envioMailRegistro(
        session: session,
        email: email,
        tipo_de_invitacion: tipo_de_invitacion,
      );
    } catch (e) {
      rethrow;
    }
  }
}
