// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:prlab_flutter/features/auth/crear_cuenta_admin/pagina_crear_cuenta_admin.dart'
    as _i4;
import 'package:prlab_flutter/features/auth/kyc/pagina_kyc.dart' as _i7;
import 'package:prlab_flutter/features/auth/login/pagina_login.dart' as _i8;
import 'package:prlab_flutter/features/auth/recuperar_password/pagina_recuperar_password.dart'
    as _i9;
import 'package:prlab_flutter/features/auth/registro/pagina_registro.dart'
    as _i10;
import 'package:prlab_flutter/features/dashboard/administracion_contenido/pagina_administracion_contenido.dart'
    as _i1;
import 'package:prlab_flutter/features/dashboard/administracion_de_una_marca.dart/pagina_administracion_de_una_marca.dart'
    as _i2;
import 'package:prlab_flutter/features/dashboard/administracion_marcas/pagina_administracion_marcas.dart'
    as _i3;
import 'package:prlab_flutter/features/dashboard/editor_contenido/pagina_editor_contenido.dart'
    as _i6;
import 'package:prlab_flutter/features/dashboard/pagina_dashboard.dart' as _i5;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    RutaAdministracionContenido.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PaginaAdministracionContenido(),
      );
    },
    RutaAdministracionDeUnaMarca.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RutaAdministracionDeUnaMarcaArgs>(
          orElse: () => RutaAdministracionDeUnaMarcaArgs(
              nombreMarca: pathParams.getString('nombreMarca')));
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.PaginaAdministracionDeUnaMarca(
          nombreMarca: args.nombreMarca,
          key: args.key,
        ),
      );
    },
    RutaAdministracionMarcas.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PaginaAdministracionMarcas(),
      );
    },
    RutaCrearCuenta.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PaginaCrearCuenta(),
      );
    },
    RutaDashboard.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PaginaDashboard(),
      );
    },
    RutaEditorContenido.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PaginaEditorContenido(),
      );
    },
    RutaKyc.name: (routeData) {
      final args = routeData.argsAs<RutaKycArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.PaginaKyc(
          idUsuario: args.idUsuario,
          key: args.key,
        ),
      );
    },
    RutaLogin.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PaginaLogin(),
      );
    },
    RutaRecuperarPassword.name: (routeData) {
      final args = routeData.argsAs<RutaRecuperarPasswordArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.PaginaRecuperarPassword(
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
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.PaginaRegistro(
          tokenAuth: args.tokenAuth,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.PaginaAdministracionContenido]
class RutaAdministracionContenido extends _i11.PageRouteInfo<void> {
  const RutaAdministracionContenido({List<_i11.PageRouteInfo>? children})
      : super(
          RutaAdministracionContenido.name,
          initialChildren: children,
        );

  static const String name = 'RutaAdministracionContenido';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PaginaAdministracionDeUnaMarca]
class RutaAdministracionDeUnaMarca
    extends _i11.PageRouteInfo<RutaAdministracionDeUnaMarcaArgs> {
  RutaAdministracionDeUnaMarca({
    required String nombreMarca,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          RutaAdministracionDeUnaMarca.name,
          args: RutaAdministracionDeUnaMarcaArgs(
            nombreMarca: nombreMarca,
            key: key,
          ),
          rawPathParams: {'nombreMarca': nombreMarca},
          initialChildren: children,
        );

  static const String name = 'RutaAdministracionDeUnaMarca';

  static const _i11.PageInfo<RutaAdministracionDeUnaMarcaArgs> page =
      _i11.PageInfo<RutaAdministracionDeUnaMarcaArgs>(name);
}

class RutaAdministracionDeUnaMarcaArgs {
  const RutaAdministracionDeUnaMarcaArgs({
    required this.nombreMarca,
    this.key,
  });

  final String nombreMarca;

  final _i12.Key? key;

  @override
  String toString() {
    return 'RutaAdministracionDeUnaMarcaArgs{nombreMarca: $nombreMarca, key: $key}';
  }
}

/// generated route for
/// [_i3.PaginaAdministracionMarcas]
class RutaAdministracionMarcas extends _i11.PageRouteInfo<void> {
  const RutaAdministracionMarcas({List<_i11.PageRouteInfo>? children})
      : super(
          RutaAdministracionMarcas.name,
          initialChildren: children,
        );

  static const String name = 'RutaAdministracionMarcas';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PaginaCrearCuenta]
class RutaCrearCuenta extends _i11.PageRouteInfo<void> {
  const RutaCrearCuenta({List<_i11.PageRouteInfo>? children})
      : super(
          RutaCrearCuenta.name,
          initialChildren: children,
        );

  static const String name = 'RutaCrearCuenta';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PaginaDashboard]
class RutaDashboard extends _i11.PageRouteInfo<void> {
  const RutaDashboard({List<_i11.PageRouteInfo>? children})
      : super(
          RutaDashboard.name,
          initialChildren: children,
        );

  static const String name = 'RutaDashboard';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.PaginaEditorContenido]
class RutaEditorContenido extends _i11.PageRouteInfo<void> {
  const RutaEditorContenido({List<_i11.PageRouteInfo>? children})
      : super(
          RutaEditorContenido.name,
          initialChildren: children,
        );

  static const String name = 'RutaEditorContenido';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PaginaKyc]
class RutaKyc extends _i11.PageRouteInfo<RutaKycArgs> {
  RutaKyc({
    required int idUsuario,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          RutaKyc.name,
          args: RutaKycArgs(
            idUsuario: idUsuario,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RutaKyc';

  static const _i11.PageInfo<RutaKycArgs> page =
      _i11.PageInfo<RutaKycArgs>(name);
}

class RutaKycArgs {
  const RutaKycArgs({
    required this.idUsuario,
    this.key,
  });

  final int idUsuario;

  final _i12.Key? key;

  @override
  String toString() {
    return 'RutaKycArgs{idUsuario: $idUsuario, key: $key}';
  }
}

/// generated route for
/// [_i8.PaginaLogin]
class RutaLogin extends _i11.PageRouteInfo<void> {
  const RutaLogin({List<_i11.PageRouteInfo>? children})
      : super(
          RutaLogin.name,
          initialChildren: children,
        );

  static const String name = 'RutaLogin';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PaginaRecuperarPassword]
class RutaRecuperarPassword
    extends _i11.PageRouteInfo<RutaRecuperarPasswordArgs> {
  RutaRecuperarPassword({
    required String codigoOtp,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          RutaRecuperarPassword.name,
          args: RutaRecuperarPasswordArgs(
            codigoOtp: codigoOtp,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RutaRecuperarPassword';

  static const _i11.PageInfo<RutaRecuperarPasswordArgs> page =
      _i11.PageInfo<RutaRecuperarPasswordArgs>(name);
}

class RutaRecuperarPasswordArgs {
  const RutaRecuperarPasswordArgs({
    required this.codigoOtp,
    this.key,
  });

  final String codigoOtp;

  final _i12.Key? key;

  @override
  String toString() {
    return 'RutaRecuperarPasswordArgs{codigoOtp: $codigoOtp, key: $key}';
  }
}

/// generated route for
/// [_i10.PaginaRegistro]
class RutaRegistro extends _i11.PageRouteInfo<RutaRegistroArgs> {
  RutaRegistro({
    required String tokenAuth,
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
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

  static const _i11.PageInfo<RutaRegistroArgs> page =
      _i11.PageInfo<RutaRegistroArgs>(name);
}

class RutaRegistroArgs {
  const RutaRegistroArgs({
    required this.tokenAuth,
    this.key,
  });

  final String tokenAuth;

  final _i12.Key? key;

  @override
  String toString() {
    return 'RutaRegistroArgs{tokenAuth: $tokenAuth, key: $key}';
  }
}
