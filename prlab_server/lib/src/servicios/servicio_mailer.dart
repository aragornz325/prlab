import 'package:prlab_server/utils/mailer/mailer.dart';
import 'package:prlab_server/utils/mailer/templates.dart';
import 'package:serverpod/server.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

final plantillasCorreo = PlantillasCorreo();

class ServicioMailer {
  Future<bool> envioMailRegistro(
      {required Session session, required String email}) async {
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

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
