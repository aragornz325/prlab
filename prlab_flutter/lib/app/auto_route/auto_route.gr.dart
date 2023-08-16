// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:prlab_flutter/paginas/crear_cuenta_admin/pagina_crear_cuenta_admin.dart'
    as _i1;
import 'package:prlab_flutter/paginas/kyc/pagina_kyc.dart' as _i4;
import 'package:prlab_flutter/paginas/login/pagina_login.dart' as _i2;
import 'package:prlab_flutter/paginas/registro/registro_page.dart' as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    PaginaCrearCuenta.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PaginaCrearCuenta(),
      );
    },
    PaginaLogin.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PaginaLogin(),
      );
    },
    RegistroRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RegistroRouteArgs>(
          orElse: () =>
              RegistroRouteArgs(tokenAuth: pathParams.getString('token')));
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.RegistroPage(
          tokenAuth: args.tokenAuth,
          key: args.key,
        ),
      );
    },
    PaginaKyc.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PaginaKyc(),
      );
    },
  };
}

/// generated route for
/// [_i1.PaginaCrearCuenta]
class PaginaCrearCuenta extends _i5.PageRouteInfo<void> {
  const PaginaCrearCuenta({List<_i5.PageRouteInfo>? children})
      : super(
          PaginaCrearCuenta.name,
          initialChildren: children,
        );

  static const String name = 'PaginaCrearCuenta';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PaginaLogin]
class PaginaLogin extends _i5.PageRouteInfo<void> {
  const PaginaLogin({List<_i5.PageRouteInfo>? children})
      : super(
          PaginaLogin.name,
          initialChildren: children,
        );

  static const String name = 'PaginaLogin';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.RegistroPage]
class RegistroRoute extends _i5.PageRouteInfo<RegistroRouteArgs> {
  RegistroRoute({
    required String tokenAuth,
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          RegistroRoute.name,
          args: RegistroRouteArgs(
            tokenAuth: tokenAuth,
            key: key,
          ),
          rawPathParams: {'token': tokenAuth},
          initialChildren: children,
        );

  static const String name = 'RegistroRoute';

  static const _i5.PageInfo<RegistroRouteArgs> page =
      _i5.PageInfo<RegistroRouteArgs>(name);
}

class RegistroRouteArgs {
  const RegistroRouteArgs({
    required this.tokenAuth,
    this.key,
  });

  final String tokenAuth;

  final _i6.Key? key;

  @override
  String toString() {
    return 'RegistroRouteArgs{tokenAuth: $tokenAuth, key: $key}';
  }
}

/// generated route for
/// [_i4.PaginaKyc]
class PaginaKyc extends _i5.PageRouteInfo<void> {
  const PaginaKyc({List<_i5.PageRouteInfo>? children})
      : super(
          PaginaKyc.name,
          initialChildren: children,
        );

  static const String name = 'PaginaKyc';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
