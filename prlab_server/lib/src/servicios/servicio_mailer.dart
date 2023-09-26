// ignore_for_file: avoid_dynamic_calls

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:prlab_server/src/orms/orm_auth.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:prlab_server/utils/config/constants.dart';
import 'package:prlab_server/utils/mailer/mailer.dart';
import 'package:prlab_server/utils/mailer/templates.dart';
import 'package:serverpod/server.dart';

/// La clase [ServicioMailer] se utiliza para enviar correos electrónicos.
class ServicioMailer extends Servicio<OrmAuth> {

  /// Instancia de la clase del odm.
  final authRepository = OrmAuth();

  /// Instancia de la clase con las plantillas para mailing.
  final plantillasCorreo = PlantillasCorreo();

  /// Envía un correo con el enlace de invitación a registro.
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [email] ([String]): La dirección de correo electrónico a la que se 
  /// enviará el correo electrónico de registro.
  Future<bool> envioMailRegistro(
    Session session,{
    required String email,
    required int tipoDeInvitacion,
  }) async {
    logger.info('Se enviara email de invitacion a $email');
    try {
      final jwt = JWT(
        {
          'email': email,
          'exp': DateTime.now()
                  .add(
                    const Duration(
                      days: ConstantesPrLab.jwtTiempoExpiracionDias,
                    ),
                  )
                  .millisecondsSinceEpoch ~/ //30 dias de validez
              1000,
        },
        issuer: 'prlab',
      );

      logger.finest(
        'JSON Web Token creado',
      );

      final String token = ejecutarOperacionToken(
        () => jwt.sign(
          SecretKey(
            ConstantesPrLab.jwtSecret,
          ),
        ),
      );

      logger.finest(
        'JSON Web Token firmado',
      );

      final String mailURL = '${ConstantesPrLab.frontendUrl}/#/register/$token';

      final String cuerpoMensajeEmailHtml = plantillasCorreo.cuerpoRegistro(
        enlace: mailURL,
      );

      final String cuerpoCompletoEmail = plantillasCorreo.mailingGeneral(
        contenido: cuerpoMensajeEmailHtml,
      );

      logger.finest(
        'Cuerpo del correo electrónico listo para enviar. Enviando...',
      );

      await ejecutarOperacion(
        () => enviarEmail(
          mailDestinatario: email,
          subject: 'You have been invited to PRLab.',
          mailHtml: cuerpoCompletoEmail,
        ),
      );

      logger.finest(
        'Correo enviado a $email. Guardando JSON Web Token en DB...',
      );

      await ejecutarOperacion(
        () => authRepository.guardarTokenEnDb(
          session: session,
          token: token,
          email: email,
          tipoDeInvitacion: tipoDeInvitacion,
        ),
      );

      logger.finest(
        'JSON Web Token guardado en DB.',
      );

      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
