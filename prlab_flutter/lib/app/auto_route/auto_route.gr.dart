// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:prlab_flutter/login.dart' as _i1;
import 'package:prlab_flutter/paginas/crear_cuenta_admin/pagina_crear_cuenta_admin.dart'
    as _i2;
import 'package:prlab_flutter/paginas/login/pagina_login.dart' as _i3;
import 'package:prlab_flutter/paginas/registro/escritorio/vista_registro_escritorio.dart'
    as _i4;
import 'package:prlab_flutter/paginas/registro/mobile/vista_registro_mobile.dart'
    as _i5;
import 'package:prlab_flutter/paginas/registro/registro_page.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    PaginaCrearCuenta.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PaginaCrearCuenta(),
      );
    },
    PaginaLogin.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PaginaLogin(),
      );
    },
    VistaRegistroEscritorio.name: (routeData) {
      final args = routeData.argsAs<VistaRegistroEscritorioArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.VistaRegistroEscritorio(
          email: args.email,
          key: args.key,
        ),
      );
    },
    VistaRegistroMobile.name: (routeData) {
      final args = routeData.argsAs<VistaRegistroMobileArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.VistaRegistroMobile(
          email: args.email,
          key: args.key,
        ),
      );
    },
    RegistroRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RegistroRouteArgs>(
          orElse: () =>
              RegistroRouteArgs(tokenAuth: pathParams.getString('token')));
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.RegistroPage(
          tokenAuth: args.tokenAuth,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PaginaCrearCuenta]
class PaginaCrearCuenta extends _i7.PageRouteInfo<void> {
  const PaginaCrearCuenta({List<_i7.PageRouteInfo>? children})
      : super(
          PaginaCrearCuenta.name,
          initialChildren: children,
        );

  static const String name = 'PaginaCrearCuenta';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PaginaLogin]
class PaginaLogin extends _i7.PageRouteInfo<void> {
  const PaginaLogin({List<_i7.PageRouteInfo>? children})
      : super(
          PaginaLogin.name,
          initialChildren: children,
        );

  static const String name = 'PaginaLogin';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.VistaRegistroEscritorio]
class VistaRegistroEscritorio
    extends _i7.PageRouteInfo<VistaRegistroEscritorioArgs> {
  VistaRegistroEscritorio({
    required String email,
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          VistaRegistroEscritorio.name,
          args: VistaRegistroEscritorioArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VistaRegistroEscritorio';

  static const _i7.PageInfo<VistaRegistroEscritorioArgs> page =
      _i7.PageInfo<VistaRegistroEscritorioArgs>(name);
}

class VistaRegistroEscritorioArgs {
  const VistaRegistroEscritorioArgs({
    required this.email,
    this.key,
  });

  final String email;

  final _i8.Key? key;

  @override
  String toString() {
    return 'VistaRegistroEscritorioArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [_i5.VistaRegistroMobile]
class VistaRegistroMobile extends _i7.PageRouteInfo<VistaRegistroMobileArgs> {
  VistaRegistroMobile({
    required String email,
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          VistaRegistroMobile.name,
          args: VistaRegistroMobileArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VistaRegistroMobile';

  static const _i7.PageInfo<VistaRegistroMobileArgs> page =
      _i7.PageInfo<VistaRegistroMobileArgs>(name);
}

class VistaRegistroMobileArgs {
  const VistaRegistroMobileArgs({
    required this.email,
    this.key,
  });

  final String email;

  final _i8.Key? key;

  @override
  String toString() {
    return 'VistaRegistroMobileArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [_i6.RegistroPage]
class RegistroRoute extends _i7.PageRouteInfo<RegistroRouteArgs> {
  RegistroRoute({
    required String tokenAuth,
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
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

  static const _i7.PageInfo<RegistroRouteArgs> page =
      _i7.PageInfo<RegistroRouteArgs>(name);
}

class RegistroRouteArgs {
  const RegistroRouteArgs({
    required this.tokenAuth,
    this.key,
  });

  final String tokenAuth;

  final _i8.Key? key;

  @override
  String toString() {
    return 'RegistroRouteArgs{tokenAuth: $tokenAuth, key: $key}';
  }
}
