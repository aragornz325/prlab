// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:prlab_flutter/paginas/crear_cuenta_admin/pagina_crear_cuenta_admin.dart'
    as _i1;
import 'package:prlab_flutter/paginas/kyc/pagina_kyc.dart' as _i3;
import 'package:prlab_flutter/paginas/login/pagina_login.dart' as _i2;
import 'package:prlab_flutter/paginas/recuperar_password/pagina_recuperar_password.dart'
    as _i5;
import 'package:prlab_flutter/paginas/registro/pagina_registro.dart' as _i4;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    RutaCrearCuenta.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PaginaCrearCuenta(),
      );
    },
    RutaLogin.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PaginaLogin(),
      );
    },
    RutaKyc.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PaginaKyc(),
      );
    },
    RutaRegistro.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RutaRegistroArgs>(
          orElse: () =>
              RutaRegistroArgs(tokenAuth: pathParams.getString('token')));
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.PaginaRegistro(
          tokenAuth: args.tokenAuth,
          key: args.key,
        ),
      );
    },
    RutaRecuperarPassword.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PaginaRecuperarPassword(),
      );
    },
  };
}

/// generated route for
/// [_i1.PaginaCrearCuenta]
class RutaCrearCuenta extends _i6.PageRouteInfo<void> {
  const RutaCrearCuenta({List<_i6.PageRouteInfo>? children})
      : super(
          RutaCrearCuenta.name,
          initialChildren: children,
        );

  static const String name = 'RutaCrearCuenta';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PaginaLogin]
class RutaLogin extends _i6.PageRouteInfo<void> {
  const RutaLogin({List<_i6.PageRouteInfo>? children})
      : super(
          RutaLogin.name,
          initialChildren: children,
        );

  static const String name = 'RutaLogin';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PaginaKyc]
class RutaKyc extends _i6.PageRouteInfo<void> {
  const RutaKyc({List<_i6.PageRouteInfo>? children})
      : super(
          RutaKyc.name,
          initialChildren: children,
        );

  static const String name = 'RutaKyc';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PaginaRegistro]
class RutaRegistro extends _i6.PageRouteInfo<RutaRegistroArgs> {
  RutaRegistro({
    required String tokenAuth,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          RutaRegistro.name,
          args: RutaRegistroArgs(
            tokenAuth: tokenAuth,
            key: key,
          ),
          rawPathParams: {'token': tokenAuth},
          initialChildren: children,
        );

  static const String name = 'RutaRegistro';

  static const _i6.PageInfo<RutaRegistroArgs> page =
      _i6.PageInfo<RutaRegistroArgs>(name);
}

class RutaRegistroArgs {
  const RutaRegistroArgs({
    required this.tokenAuth,
    this.key,
  });

  final String tokenAuth;

  final _i7.Key? key;

  @override
  String toString() {
    return 'RutaRegistroArgs{tokenAuth: $tokenAuth, key: $key}';
  }
}

/// generated route for
/// [_i5.PaginaRecuperarPassword]
class RutaRecuperarPassword extends _i6.PageRouteInfo<void> {
  const RutaRecuperarPassword({List<_i6.PageRouteInfo>? children})
      : super(
          RutaRecuperarPassword.name,
          initialChildren: children,
        );

  static const String name = 'RutaRecuperarPassword';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
