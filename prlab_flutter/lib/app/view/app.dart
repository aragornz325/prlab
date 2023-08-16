import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_app.g.dart';
import 'package:prlab_flutter/theming/temas/tema_por_default_light_prlab.dart';
import 'package:prlab_flutter/utilidades/email_auth_controller_custom_prlab.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return FullResponsiveApp(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<EmailAuthController>(
            create: (BuildContext context) =>
                EmailAuthController(client.modules.auth),
          ),
          RepositoryProvider<EmailAuthControllerCustomPRLab>(
            create: (BuildContext context) => EmailAuthControllerCustomPRLab(
              client.modules.auth,
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => BlocLogin(
                emailAuth: EmailAuthController(client.modules.auth),
                emailAuthControllerCustomPRLab: EmailAuthControllerCustomPRLab(
                  client.modules.auth,
                ),
              ),
            ),
          ],
          child: const AppView(),
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late AppRouter appRouter;

  @override
  void initState() {
    appRouter = AppRouter();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: temaPorDefectoPRLab,
      builder: (context, child) => ScrollConfiguration(
        behavior: NoGlowBehavior(),
        child: child!,
      ),
      routerDelegate: AutoRouterDelegate(appRouter),
      routeInformationParser: appRouter.defaultRouteParser(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

/// {@template no_glow_behavior}
/// sirve para sacar el efecto de la ola azul del inico y final
/// en los scrollView
/// {@endtemplate}
class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
