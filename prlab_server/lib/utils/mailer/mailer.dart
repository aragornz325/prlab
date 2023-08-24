// ignore_for_file: always_specify_types

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

/// Esta funcion envia el mail. Crea la conexion con el servidor de correo
/// electrónico.
/// Requiere el [mailDestinatario], el asunto [subject] y el cuerpo del mail
/// [mailHtml].
Future<Map<String, String>> enviarEmail({
  required String mailDestinatario,
  required String subject,
  required String mailHtml,
}) async {
  // final smtpServer = SmtpServer(
  //   config['mailer']['hostSMTPnidus'],
  //   port: config['mailer']['portSMTPnidus'],
  //   username: config['mailer']['nidusMail'],
  //   password: config['mailer']['nidusMailPassword'],
  //   ssl: true,
  // );

  List<String> destinatarios = [];
  if (mailDestinatario.contains(',')) {
    final List<String> mailSpliteado = mailDestinatario.split(',');
    for (final String element in mailSpliteado) {
      destinatarios.add(element.trim());
    }
  } else {
    destinatarios.add(mailDestinatario.trim());
  }

  final SmtpServer smtpServer =
      gmail('nidus.escuelas@gmail.com', 'zhnseceijaxirwgo');
  //final finalccRecipients = ccRecipient ?? 'nidus.escuelas@gmail.com';
  final Message message = Message()
    ..from = const Address('supportprlab@nidus.dev', 'PRLab')
    //..recipients.addAll(['no-responder.escuelas@nidus.dev'])
    ..recipients.addAll(destinatarios)
    // ..bccRecipients.addAll(['${config['mailer']['nidusMail']}'])
    ..subject = subject
    ..html = mailHtml;

  // ..attachments = [
  //   FileAttachment(File(''))
  //     ..location = Location.inline
  //     ..cid = '<myimg@3.141>'
  // ];
  const Duration duration = Duration(seconds: 30);

  bool errorFlag = false;

  try {
    final SendReport sendReport = await send(
      message,
      smtpServer,
      timeout: duration,
    );
    print(' Message sent: $sendReport');
  } on MailerException catch (e, st) {
    errorFlag = true;
    print(' Message not sent. $e + $st');
  }

  PersistentConnection connection = PersistentConnection(smtpServer);

  // Send the first message
  //await connection.send(message);

  // close the connection
  await connection.close();

  if (errorFlag) {
    return {'status': 'error'};
  }
  return {'status': 'ok'};
}
