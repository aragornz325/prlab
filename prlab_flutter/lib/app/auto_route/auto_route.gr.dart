// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:prlab_flutter/pages/login/page_login.dart' as _i1;
import 'package:prlab_flutter/paginas/registro/escritorio/vista_registro_escritorio.dart'
    as _i2;
import 'package:prlab_flutter/paginas/registro/mobile/vista_registro_mobile.dart'
    as _i3;
import 'package:prlab_flutter/paginas/registro/registro_page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    RouteLogin.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PageLogin(),
      );
    },
    VistaRegistroEscritorio.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.VistaRegistroEscritorio(),
      );
    },
    RegistroVistaMobile.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.RegistroVistaMobile(),
      );
    },
    RegistroRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RegistroPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.PageLogin]
class RouteLogin extends _i5.PageRouteInfo<void> {
  const RouteLogin({List<_i5.PageRouteInfo>? children})
      : super(
          RouteLogin.name,
          initialChildren: children,
        );

  static const String name = 'RouteLogin';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.VistaRegistroEscritorio]
class VistaRegistroEscritorio extends _i5.PageRouteInfo<void> {
  const VistaRegistroEscritorio({List<_i5.PageRouteInfo>? children})
      : super(
          VistaRegistroEscritorio.name,
          initialChildren: children,
        );

  static const String name = 'VistaRegistroEscritorio';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.RegistroVistaMobile]
class RegistroVistaMobile extends _i5.PageRouteInfo<void> {
  const RegistroVistaMobile({List<_i5.PageRouteInfo>? children})
      : super(
          RegistroVistaMobile.name,
          initialChildren: children,
        );

  static const String name = 'RegistroVistaMobile';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RegistroPage]
class RegistroRoute extends _i5.PageRouteInfo<void> {
  const RegistroRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RegistroRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistroRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
