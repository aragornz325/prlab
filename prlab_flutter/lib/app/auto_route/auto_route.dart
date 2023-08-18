import 'package:auto_route/auto_route.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Pagina,Ruta')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: RutaLogin.page,
      initial: true,
      path: '/login',
    ),
    AutoRoute(
      page: RutaRegistro.page,
      // TODO(Seba): Agregar docu, que es este token.
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
  ];
}
