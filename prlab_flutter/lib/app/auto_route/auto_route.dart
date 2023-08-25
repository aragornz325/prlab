import 'package:auto_route/auto_route.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Pagina,Ruta')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      initial: true,
      page: RutaLogin.page,
      path: '/login',
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
    ),
    AutoRoute(
      path: '/kyc-form',
      page: RutaKyc.page,
    ),
    AutoRoute(
      path: '/recover-password',
      page: RutaRecuperarPassword.page,
    ),
    AutoRoute(
      path: '/dashboard',
      page: RutaDashboard.page,
    ),
    AutoRoute(
      page: RutaEditorContenido.page,
      path: '/edit-content',
    ),
    AutoRoute(
      page: RutaAdministracionContenido.page,
      path: '/content-management',
    ),
  ];
}
