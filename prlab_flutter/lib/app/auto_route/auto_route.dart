import 'package:auto_route/auto_route.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/app/auto_route/router_guards.dart';
import 'package:prlab_flutter/utilidades/utilidades.dart';

@AutoRouterConfig(replaceInRouteName: 'Pagina,Ruta')
class AppRouter extends $AppRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  /// Se encarga de proteger las rutas que requieren
  /// que el usuario este deslogueado, en caso de que
  /// el usuario este logueado y quiera dirigirse a este tipo
  /// de paginas, sera redireccionado a [RutaDashboard]
  InitialGuard get initialGuard => InitialGuard(
        sessionManager: sessionManager,
      );

  /// Se encarga de proteger las rutas que requieren
  /// que el usuario este loggeado, en caso de que
  /// el usuario este deslogueado y quiera dirigirse a este tipo
  /// de paginas, sera redireccionado a [RutaLogin]
  AuthGuard get authGuard => AuthGuard(
        sessionManager: sessionManager,
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: RutaLogin.page,
          path: '/login',
          guards: [initialGuard],
        ),
        AutoRoute(
          page: RutaRegistro.page,

          /// Este token proviene del email del cliente que le indica que va
          /// a crearse la cuenta al clickear el link, este token sirve para
          ///  verificarlo en el evento del BLoC.
          path: '/register/:token',
        ),
        AutoRoute(
          path: '/create-account',
          page: RutaCrearCuenta.page,
          guards: [authGuard],
        ),
        AutoRoute(
          path: '/kyc-form',
          page: RutaKyc.page,
          guards: [authGuard],
        ),
        AutoRoute(
          path: '/recover-password',
          page: RutaRecuperarPassword.page,
          guards: [initialGuard],
        ),
        CustomRoute(
          path: '/dashboard',
          page: RutaDashboard.page,
          guards: [authGuard],
          transitionsBuilder: TransitionsBuilders.noTransition,
          children: [
            CustomRoute(
              path: 'home',
              page: RutaInicio.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              path: 'brands-administration',
              page: RutaAdministracionMarcas.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              path: 'brand-administration/:idMarca',
              page: RutaAdministracionDeUnaMarca.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              path: 'edit-content/:id',
              page: RutaEditorContenido.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: RutaAdministracionContenido.page,
              path: 'content-management',
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: RutaDbMediosDeComunicacion.page,
              path: 'media-database',
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: RutaEnvioContenidoAPeriodistas.page,
              path: 'send-deliverables',
              transitionsBuilder: TransitionsBuilders.noTransition,
              children: [
                CustomRoute(
                  page: RutaSelectorDeDestinatarios.page,
                  path: 'select-recipients',
                  transitionsBuilder: TransitionsBuilders.noTransition,
                ),
                CustomRoute(
                  page: RutaEditorCorreoElectronico.page,
                  path: 'write-email',
                  transitionsBuilder: TransitionsBuilders.noTransition,
                ),
              ],
            ),
          ],
        ),
      ];
}
