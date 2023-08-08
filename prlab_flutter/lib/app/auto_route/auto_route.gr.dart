// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:prlab_flutter/login.dart' as _i1;
import 'package:prlab_flutter/paginas/crear_cuenta_admin/pagina_crear_cuenta_admin.dart'
    as _i2;
import 'package:prlab_flutter/paginas/login/pagina_login.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    PaginaCrearCuenta.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PaginaCrearCuenta(),
      );
    },
    RouteLogin.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PageLogin(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PaginaCrearCuenta]
class PaginaCrearCuenta extends _i4.PageRouteInfo<void> {
  const PaginaCrearCuenta({List<_i4.PageRouteInfo>? children})
      : super(
          PaginaCrearCuenta.name,
          initialChildren: children,
        );

  static const String name = 'PaginaCrearCuenta';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PageLogin]
class RouteLogin extends _i4.PageRouteInfo<void> {
  const RouteLogin({List<_i4.PageRouteInfo>? children})
      : super(
          RouteLogin.name,
          initialChildren: children,
        );

  static const String name = 'RouteLogin';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
