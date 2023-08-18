import 'package:auto_route/auto_route.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: PaginaLogin.page,
      path: '/login',
    ),
    AutoRoute(
      page: RegistroRoute.page,
      initial: true,
      path: '/:token',
    ),
    AutoRoute(
      path: '/create-account',
      page: PaginaCrearCuenta.page,
    ),
    AutoRoute(
      path: '/kyc-form',
      page: PaginaKyc.page,
    ),
    AutoRoute(
      path: '/recover-password',
      page: PaginaRecuperarContrasenia.page,
    ),
  ];
}
