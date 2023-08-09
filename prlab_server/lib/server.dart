import 'package:prlab_server/utils/config/rewrite_yaml.dart';
import 'package:prlab_server/utils/mailer/mailer.dart';
import 'package:prlab_server/utils/mailer/templates.dart';
import 'package:serverpod/serverpod.dart';

import 'package:prlab_server/src/web/routes/root.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

import 'package:serverpod_auth_server/module.dart' as auth;

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  rewriteConfigYaml('staging');
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      try {
        final cuerpoCorreo =
            PlantillasCorreo().cuerpoVerificacion(codigo: validationCode);
        final correo = PlantillasCorreo()
            .mailingGeneral(contenido: cuerpoCorreo, nombre: 'nombre');
        await sendMailerFunction(
            mailDestinatario: email.toString().trim(),
            subject: 'Email validation.',
            mailHtml: correo);
        print('Sending validation email to $email with code $validationCode');
        print(validationCode);
        return true;
      } on Exception catch (e, st) {
        print('$e $st');
        rethrow;
      }
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      try {
        final cuerpoCorreo =
            PlantillasCorreo().cuerpoVerificacion(codigo: validationCode);
        final correo = PlantillasCorreo()
            .mailingGeneral(contenido: cuerpoCorreo, nombre: 'nombre');
        await sendMailerFunction(
            mailDestinatario: userInfo.email.toString().trim(),
            subject: 'Password reset validation.',
            mailHtml: correo);
        print('Sending password reset validation email to ${userInfo.email.toString()} with code $validationCode');
        print(validationCode);
        return true;
      } on Exception catch (e, st) {
        print('$e $st');
        rethrow;
      }
    },
  ));

  // Start the server.
  await pod.start();
}
