import 'package:prlab_server/src/generated/endpoints.dart';
import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/web/routes/root.dart';
import 'package:prlab_server/utils/config/rewrite_yaml.dart';
import 'package:prlab_server/utils/logger.dart';
import 'package:prlab_server/utils/mailer/mailer.dart';
import 'package:prlab_server/utils/mailer/templates.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart' as auth;

/// This is the starting point of your Serverpod server. In most cases, you will
/// only need to make additions to this file if you add future calls,  are
/// configuring Relic (Serverpod's web-server), or need custom setup work.
Future<void> run(List<String> args) async {
  rewriteConfigYaml('staging');
  inicializarLogger();
  // Initialize Serverpod and connect it with your generated code.
  final Serverpod pod = Serverpod(
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

  auth.AuthConfig.set(
    auth.AuthConfig(
      passwordResetExpirationTime: const Duration(minutes: 30),
      sendValidationEmail: (
        Session session,
        String email,
        String validationCode,
      ) async {
        try {
          final String cuerpoCorreo =
              PlantillasCorreo().cuerpoVerificacion(codigo: validationCode);
          final String correo = PlantillasCorreo().mailingGeneral(
            contenido: cuerpoCorreo,
          );
          await enviarEmail(
            mailDestinatario: email,
            subject: 'Email validation.',
            mailHtml: correo,
          );
          return true;
        } on Exception {
          rethrow;
        }
      },
      sendPasswordResetEmail: (
        Session session,
        auth.UserInfo userInfo,
        String validationCode,
      ) async {
        try {
          final String cuerpoCorreo = PlantillasCorreo().cuerpoVerificacion(
            codigo: validationCode,
          );
          final String correo = PlantillasCorreo().mailingGeneral(
            contenido: cuerpoCorreo,
          );
          await enviarEmail(
            mailDestinatario: userInfo.email ?? '',
            subject: 'Password reset validation.',
            mailHtml: correo,
          );
          return true;
        } on Exception {
          rethrow;
        }
      },
    ),
  );

  // Start the server.
  await pod.start();
}
