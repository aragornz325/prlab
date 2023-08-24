// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:prlab_flutter/features/auth/login/pagina_login.dart' as _i1;
import 'package:prlab_flutter/features/auth/recuperar_password/pagina_recuperar_password.dart'
    as _i2;
import 'package:prlab_flutter/features/auth/registro/pagina_registro.dart'
    as _i3;
import 'package:prlab_flutter/features/crear_cuenta_admin/pagina_crear_cuenta_admin.dart'
    as _i4;
import 'package:prlab_flutter/features/dashboard/pagina_dashboard.dart' as _i5;
import 'package:prlab_flutter/features/kyc/pagina_kyc.dart' as _i6;
import 'package:prlab_flutter/features/editor_contenido/pagina_editor_contenido.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    RutaLogin.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PaginaLogin(),
      );
    },
    RutaRecuperarPassword.name: (routeData) {
      final args = routeData.argsAs<RutaRecuperarPasswordArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.PaginaRecuperarPassword(
          codigoOtp: args.codigoOtp,
          key: args.key,
        ),
      );
    },
    RutaRegistro.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RutaRegistroArgs>(
          orElse: () =>
              RutaRegistroArgs(tokenAuth: pathParams.getString('token')));
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PaginaRegistro(
          tokenAuth: args.tokenAuth,
          key: args.key,
        ),
      );
    },
    RutaCrearCuenta.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PaginaCrearCuenta(),
      );
    },
    RutaDashboard.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PaginaDashboard(),
      );
    },
    RutaKyc.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PaginaKyc(),
      );
    },
    RutaRedaccionEdicionContenido.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PaginaRedaccionEdicionContenido(),
      );
    },
  };
}

/// generated route for
/// [_i1.PaginaLogin]
class RutaLogin extends _i8.PageRouteInfo<void> {
  const RutaLogin({List<_i8.PageRouteInfo>? children})
      : super(
          RutaLogin.name,
          initialChildren: children,
        );

  static const String name = 'RutaLogin';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PaginaRecuperarPassword]
class RutaRecuperarPassword
    extends _i8.PageRouteInfo<RutaRecuperarPasswordArgs> {
  RutaRecuperarPassword({
    required String codigoOtp,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          RutaRecuperarPassword.name,
          args: RutaRecuperarPasswordArgs(
            codigoOtp: codigoOtp,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RutaRecuperarPassword';

  static const _i8.PageInfo<RutaRecuperarPasswordArgs> page =
      _i8.PageInfo<RutaRecuperarPasswordArgs>(name);
}

class RutaRecuperarPasswordArgs {
  const RutaRecuperarPasswordArgs({
    required this.codigoOtp,
    this.key,
  });

  final String codigoOtp;

  final _i9.Key? key;

  @override
  String toString() {
    return 'RutaRecuperarPasswordArgs{codigoOtp: $codigoOtp, key: $key}';
  }
}

/// generated route for
/// [_i3.PaginaRegistro]
class RutaRegistro extends _i8.PageRouteInfo<RutaRegistroArgs> {
  RutaRegistro({
    required String tokenAuth,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
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

  static const _i8.PageInfo<RutaRegistroArgs> page =
      _i8.PageInfo<RutaRegistroArgs>(name);
}

class RutaRegistroArgs {
  const RutaRegistroArgs({
    required this.tokenAuth,
    this.key,
  });

  final String tokenAuth;

  final _i9.Key? key;

  @override
  String toString() {
    return 'RutaRegistroArgs{tokenAuth: $tokenAuth, key: $key}';
  }
}

/// generated route for
/// [_i4.PaginaCrearCuenta]
class RutaCrearCuenta extends _i8.PageRouteInfo<void> {
  const RutaCrearCuenta({List<_i8.PageRouteInfo>? children})
      : super(
          RutaCrearCuenta.name,
          initialChildren: children,
        );

  static const String name = 'RutaCrearCuenta';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PaginaDashboard]
class RutaDashboard extends _i8.PageRouteInfo<void> {
  const RutaDashboard({List<_i8.PageRouteInfo>? children})
      : super(
          RutaDashboard.name,
          initialChildren: children,
        );

  static const String name = 'RutaDashboard';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.PaginaKyc]
class RutaKyc extends _i8.PageRouteInfo<void> {
  const RutaKyc({List<_i8.PageRouteInfo>? children})
      : super(
          RutaKyc.name,
          initialChildren: children,
        );

  static const String name = 'RutaKyc';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PaginaRedaccionEdicionContenido]
class RutaRedaccionEdicionContenido extends _i8.PageRouteInfo<void> {
  const RutaRedaccionEdicionContenido({List<_i8.PageRouteInfo>? children})
      : super(
          RutaRedaccionEdicionContenido.name,
          initialChildren: children,
        );

  static const String name = 'RutaRedaccionEdicionContenido';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
