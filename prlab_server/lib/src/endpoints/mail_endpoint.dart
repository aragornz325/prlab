import 'package:prlab_server/src/servicios/servicio_mailer.dart';
import 'package:serverpod/serverpod.dart';

final servicioMail = ServicioMail();

class MailEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<bool> envioMailRegistro(
    Session session,
    String email,
    int tipoInvitacion,
  ) async {
    try {
      return servicioMail.envioMailRegistro(
        session: session,
        email: email,
        tipoInvitacion: tipoInvitacion,
      );
    } catch (e) {
      rethrow;
    }
  }
}
