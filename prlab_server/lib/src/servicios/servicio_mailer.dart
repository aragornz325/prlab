import 'package:prlab_server/src/repositories/auth_repository.dart';
import 'package:prlab_server/utils/mailer/mailer.dart';
import 'package:prlab_server/utils/mailer/templates.dart';
import 'package:serverpod/server.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

final plantillasCorreo = PlantillasCorreo();

/// La clase ServicioMailer se utiliza para enviar correos electrónicos.
class ServicioMail {
  final AuthRepository authRepository = AuthRepository();

  /// La función `envioMailRegistro` envía un correo electrónico de registro con un token a la dirección
  /// de correo electrónico especificada, guarda el token en una base de datos y devuelve un valor
  /// booleano que indica si el correo electrónico se envió correctamente.
  ///
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión, que representa la sesión de usuario
  /// actual.
  ///   email (String): El parámetro de correo electrónico es la dirección de correo electrónico a la
  /// que se enviará el correo electrónico de registro.
  ///
  Future<bool> envioMailRegistro(
      {required Session session,
      required String email,
      required int tipoInvitacion}) async {
    try {
      final jwt = JWT(
        {
          "email": email,
          'exp': DateTime.now()
                  .add(Duration(days: 30))
                  .millisecondsSinceEpoch ~/ //30 dias de validez
              1000,
        },
        issuer: "prlab",
      );
      final token = jwt.sign(
          SecretKey('sweetHomeAlabama')); //TODO cambiar por variable de entorno

      final mailHtml = plantillasCorreo.cuerpoRegistro(
          enlace: "http://google.com/token=$token");
      enviarEmail(
          mailDestinatario: email, subject: "registro", mailHtml: mailHtml);

      await authRepository.guardarTokenEnDb(
          session: session,
          token: token,
          email: email,
          tipoInvitacion: tipoInvitacion);

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
