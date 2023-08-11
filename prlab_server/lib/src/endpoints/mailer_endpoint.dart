import 'package:prlab_server/src/servicios/servicio_mailer.dart';
import 'package:serverpod/serverpod.dart';

final servicioMailer = ServicioMailer();

class MailerEndpoint extends Endpoint {
  Future<bool> envioMailRegistro(Session session, String email) async {
    try {
      return servicioMailer.envioMailRegistro(session: session, email: email);
    } catch (e) {
      rethrow;
    }
  }
}
