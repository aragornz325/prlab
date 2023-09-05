import 'package:prlab_server/src/servicios/servicio_mailer.dart';
import 'package:serverpod/serverpod.dart';

/// Clase con endopoint para envio de email de registro.
class MailEndpoint extends Endpoint {
  // @override
  // bool get requireLogin => true;

  /// Instancia de [ServicioMailer].
  final servicioMailer = ServicioMailer();

  /// La función [envioMailRegistro] envía un correo electrónico de registro
  /// utilizando el servicio `servicioMail`.
  ///
  /// Args:
  ///   [session] ([Session]): Un objeto de sesión que contiene información sobre
  /// la sesión del usuario.
  ///   [email] ([String]): El parámetro de correo electrónico es una cadena que
  /// representa la dirección de correo electrónico del destinatario a quien se
  /// enviará el correo electrónico de registro.
  ///   [tipoInvitacion] ([int]): Este parametro es un número entero
  /// que representa el tipo de invitación. Se utiliza como argumento al llamar
  /// al método [envioMailRegistro] del objeto [servicioMail].
  ///
  /// Returns:
  ///   un `Futuro<bool>`.
  Future<bool> envioMailRegistro(
    Session session,
    String email,
    int tipoDeInvitacion,
  ) async {
    try {
      return servicioMailer.envioMailRegistro(
        session: session,
        email: email,
        tipoDeInvitacion: tipoDeInvitacion,
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
