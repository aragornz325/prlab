import 'package:prlab_server/src/servicios/servicio_mailer.dart';
import 'package:serverpod/serverpod.dart';

/// Instancia de `ServicioMail`.
final ServicioMail servicioMail = ServicioMail();

/// Clase con endopoint para envio de email de registro.
class MailEndpoint extends Endpoint {
  // @override
  // bool get requireLogin => true;


  /// La función `envioMailRegistro` envía un correo electrónico de registro 
  /// utilizando el servicio `servicioMail`.
  /// 
  /// Args:
  ///   session (Session): Un objeto de sesión que contiene información sobre 
  /// la sesión del usuario.
  ///   email (String): El parámetro de correo electrónico es una cadena que 
  /// representa la dirección de correo electrónico del destinatario a quien se 
  /// enviará el correo electrónico de registro.
  ///   tipoInvitacion (int): El parámetro "tipoInvitacion" es un número entero 
  /// que representa el tipo de invitación. Se utiliza como argumento al llamar 
  /// al método "envioMailRegistro" del objeto "servicioMail".
  /// 
  /// Returns:
  ///   un `Futuro<bool>`.
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
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
