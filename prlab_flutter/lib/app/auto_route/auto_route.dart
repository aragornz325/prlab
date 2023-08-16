import 'package:auto_route/auto_route.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      initial: true,
      page: PaginaLogin.page,
    ),
    AutoRoute(
      path: '/create-account',
      page: PaginaCrearCuenta.page,
    ),
    AutoRoute(
      path: '/kyc-form',
      page: PaginaKyc.page,
    ),
  ];
}
