import 'package:auto_route/auto_route.dart';

import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: RouteLogin.page,
      // initial: true,
      path: '/login',
    ),
    AutoRoute(page: RegistroRoute.page, initial: true, path: '/'),
  ];
}
