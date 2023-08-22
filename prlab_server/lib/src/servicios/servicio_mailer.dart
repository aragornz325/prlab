// ignore_for_file: avoid_dynamic_calls

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:prlab_server/src/odms/auth_repository.dart';
import 'package:prlab_server/utils/config/constants.dart';
import 'package:prlab_server/utils/mailer/mailer.dart';
import 'package:prlab_server/utils/mailer/templates.dart';
import 'package:serverpod/server.dart';

/// Instancia de la clase con las plantillas para mailing.
final PlantillasCorreo plantillasCorreo = PlantillasCorreo();

/// La clase ServicioMailer se utiliza para enviar correos electrónicos.
class ServicioMail {
  /// Instancia de la clase del odm.
  final AuthODM authRepository = AuthODM();

  /// La función `envioMailRegistro` envía un correo electrónico de registro
  /// con un token a la dirección de correo electrónico especificada, guarda el
  /// token en una base de datos y devuelve un valor booleano que indica si el
  /// correo electrónico se envió correctamente.
  ///
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión, que
  /// representa la sesión de usuario actual.
  ///   email (String): El parámetro de correo electrónico es la dirección de
  /// correo electrónico a la que se enviará el correo electrónico de registro.
  ///
  Future<bool> envioMailRegistro({
    required Session session,
    required String email,
    required int tipoInvitacion,
  }) async {
    try {
      final JWT jwt = JWT(
        // ignore: always_specify_types
        {
          'email': email,
          'exp': DateTime.now()
                  .add(const Duration(days: 30))
                  .millisecondsSinceEpoch ~/ //30 dias de validez
              1000,
        },
        issuer: 'prlab',
      );
      final String token = jwt.sign(
        SecretKey(config['jwtSecret']),
      );

      final String? mailURL = config['mail']!['frontendUrl'];

      final String cuerpoMensajeEmailHtml =
          plantillasCorreo.cuerpoRegistro(enlace: '$mailURL/#/register/$token');

      final String cuerpoCompletoEmail =
          plantillasCorreo.mailingGeneral(contenido: cuerpoMensajeEmailHtml);

      await enviarEmail(
        mailDestinatario: email,
        subject: 'registro',
        mailHtml: cuerpoCompletoEmail,
      );

      await authRepository.guardarTokenEnDb(
        session: session,
        token: token,
        email: email,
        tipoInvitacion: tipoInvitacion,
      );

      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
