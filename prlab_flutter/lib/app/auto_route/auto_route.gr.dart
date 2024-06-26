// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:prlab_flutter/features/auth/crear_cuenta_admin/pagina_crear_cuenta_admin.dart'
    as _i5;
import 'package:prlab_flutter/features/auth/kyc/pagina_kyc.dart' as _i11;
import 'package:prlab_flutter/features/auth/login/pagina_login.dart' as _i12;
import 'package:prlab_flutter/features/auth/recuperar_password/pagina_recuperar_password.dart'
    as _i13;
import 'package:prlab_flutter/features/auth/registro/pagina_registro.dart'
    as _i14;
import 'package:prlab_flutter/features/dashboard/administracion_contenido/pagina_administracion_contenido.dart'
    as _i2;
import 'package:prlab_flutter/features/dashboard/administracion_de_una_marca.dart/pagina_administracion_de_una_marca.dart'
    as _i3;
import 'package:prlab_flutter/features/dashboard/administracion_marcas/pagina_administracion_marcas.dart'
    as _i4;
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/pagina_db_medios_de_comunicacion.dart'
    as _i7;
import 'package:prlab_flutter/features/dashboard/editor_contenido/pagina_editor_contenido.dart'
    as _i8;
import 'package:prlab_flutter/features/dashboard/envio_contenido_a_periodistas/escritorio/editor_correo_electronico/editor_correo_electronico.dart'
    as _i1;
import 'package:prlab_flutter/features/dashboard/envio_contenido_a_periodistas/escritorio/selector_de_destinatarios/selector_de_destinatarios.dart'
    as _i15;
import 'package:prlab_flutter/features/dashboard/envio_contenido_a_periodistas/pagina_envio_contenido_a_periodistas.dart'
    as _i9;
import 'package:prlab_flutter/features/dashboard/inicio/pagina_inicio.dart'
    as _i10;
import 'package:prlab_flutter/features/dashboard/pagina_dashboard.dart' as _i6;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    RutaEditorCorreoElectronico.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.EditorCorreoElectronico(),
      );
    },
    RutaAdministracionContenido.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PaginaAdministracionContenido(),
      );
    },
    RutaAdministracionDeUnaMarca.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RutaAdministracionDeUnaMarcaArgs>(
          orElse: () => RutaAdministracionDeUnaMarcaArgs(
              idMarca: pathParams.getInt('idMarca')));
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PaginaAdministracionDeUnaMarca(
          idMarca: args.idMarca,
          key: args.key,
        ),
      );
    },
    RutaAdministracionMarcas.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PaginaAdministracionMarcas(),
      );
    },
    RutaCrearCuenta.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PaginaCrearCuenta(),
      );
    },
    RutaDashboard.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PaginaDashboard(),
      );
    },
    RutaDbMediosDeComunicacion.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PaginaDbMediosDeComunicacion(),
      );
    },
    RutaEditorContenido.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RutaEditorContenidoArgs>(
          orElse: () =>
              RutaEditorContenidoArgs(idArticulo: pathParams.getInt('id')));
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.PaginaEditorContenido(
          idArticulo: args.idArticulo,
          key: args.key,
        ),
      );
    },
    RutaEnvioContenidoAPeriodistas.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PaginaEnvioContenidoAPeriodistas(),
      );
    },
    RutaInicio.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PaginaInicio(),
      );
    },
    RutaKyc.name: (routeData) {
      final args = routeData.argsAs<RutaKycArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.PaginaKyc(
          idUsuario: args.idUsuario,
          key: args.key,
        ),
      );
    },
    RutaLogin.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PaginaLogin(),
      );
    },
    RutaRecuperarPassword.name: (routeData) {
      final args = routeData.argsAs<RutaRecuperarPasswordArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.PaginaRecuperarPassword(
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
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.PaginaRegistro(
          tokenAuth: args.tokenAuth,
          key: args.key,
        ),
      );
    },
    RutaSelectorDeDestinatarios.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SelectorDeDestinatarios(),
      );
    },
  };
}

/// generated route for
/// [_i1.EditorCorreoElectronico]
class RutaEditorCorreoElectronico extends _i16.PageRouteInfo<void> {
  const RutaEditorCorreoElectronico({List<_i16.PageRouteInfo>? children})
      : super(
          RutaEditorCorreoElectronico.name,
          initialChildren: children,
        );

  static const String name = 'RutaEditorCorreoElectronico';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PaginaAdministracionContenido]
class RutaAdministracionContenido extends _i16.PageRouteInfo<void> {
  const RutaAdministracionContenido({List<_i16.PageRouteInfo>? children})
      : super(
          RutaAdministracionContenido.name,
          initialChildren: children,
        );

  static const String name = 'RutaAdministracionContenido';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PaginaAdministracionDeUnaMarca]
class RutaAdministracionDeUnaMarca
    extends _i16.PageRouteInfo<RutaAdministracionDeUnaMarcaArgs> {
  RutaAdministracionDeUnaMarca({
    required int idMarca,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          RutaAdministracionDeUnaMarca.name,
          args: RutaAdministracionDeUnaMarcaArgs(
            idMarca: idMarca,
            key: key,
          ),
          rawPathParams: {'idMarca': idMarca},
          initialChildren: children,
        );

  static const String name = 'RutaAdministracionDeUnaMarca';

  static const _i16.PageInfo<RutaAdministracionDeUnaMarcaArgs> page =
      _i16.PageInfo<RutaAdministracionDeUnaMarcaArgs>(name);
}

class RutaAdministracionDeUnaMarcaArgs {
  const RutaAdministracionDeUnaMarcaArgs({
    required this.idMarca,
    this.key,
  });

  final int idMarca;

  final _i17.Key? key;

  @override
  String toString() {
    return 'RutaAdministracionDeUnaMarcaArgs{idMarca: $idMarca, key: $key}';
  }
}

/// generated route for
/// [_i4.PaginaAdministracionMarcas]
class RutaAdministracionMarcas extends _i16.PageRouteInfo<void> {
  const RutaAdministracionMarcas({List<_i16.PageRouteInfo>? children})
      : super(
          RutaAdministracionMarcas.name,
          initialChildren: children,
        );

  static const String name = 'RutaAdministracionMarcas';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PaginaCrearCuenta]
class RutaCrearCuenta extends _i16.PageRouteInfo<void> {
  const RutaCrearCuenta({List<_i16.PageRouteInfo>? children})
      : super(
          RutaCrearCuenta.name,
          initialChildren: children,
        );

  static const String name = 'RutaCrearCuenta';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.PaginaDashboard]
class RutaDashboard extends _i16.PageRouteInfo<void> {
  const RutaDashboard({List<_i16.PageRouteInfo>? children})
      : super(
          RutaDashboard.name,
          initialChildren: children,
        );

  static const String name = 'RutaDashboard';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PaginaDbMediosDeComunicacion]
class RutaDbMediosDeComunicacion extends _i16.PageRouteInfo<void> {
  const RutaDbMediosDeComunicacion({List<_i16.PageRouteInfo>? children})
      : super(
          RutaDbMediosDeComunicacion.name,
          initialChildren: children,
        );

  static const String name = 'RutaDbMediosDeComunicacion';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PaginaEditorContenido]
class RutaEditorContenido extends _i16.PageRouteInfo<RutaEditorContenidoArgs> {
  RutaEditorContenido({
    required int idArticulo,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          RutaEditorContenido.name,
          args: RutaEditorContenidoArgs(
            idArticulo: idArticulo,
            key: key,
          ),
          rawPathParams: {'id': idArticulo},
          initialChildren: children,
        );

  static const String name = 'RutaEditorContenido';

  static const _i16.PageInfo<RutaEditorContenidoArgs> page =
      _i16.PageInfo<RutaEditorContenidoArgs>(name);
}

class RutaEditorContenidoArgs {
  const RutaEditorContenidoArgs({
    required this.idArticulo,
    this.key,
  });

  final int idArticulo;

  final _i17.Key? key;

  @override
  String toString() {
    return 'RutaEditorContenidoArgs{idArticulo: $idArticulo, key: $key}';
  }
}

/// generated route for
/// [_i9.PaginaEnvioContenidoAPeriodistas]
class RutaEnvioContenidoAPeriodistas extends _i16.PageRouteInfo<void> {
  const RutaEnvioContenidoAPeriodistas({List<_i16.PageRouteInfo>? children})
      : super(
          RutaEnvioContenidoAPeriodistas.name,
          initialChildren: children,
        );

  static const String name = 'RutaEnvioContenidoAPeriodistas';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PaginaInicio]
class RutaInicio extends _i16.PageRouteInfo<void> {
  const RutaInicio({List<_i16.PageRouteInfo>? children})
      : super(
          RutaInicio.name,
          initialChildren: children,
        );

  static const String name = 'RutaInicio';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PaginaKyc]
class RutaKyc extends _i16.PageRouteInfo<RutaKycArgs> {
  RutaKyc({
    required int idUsuario,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          RutaKyc.name,
          args: RutaKycArgs(
            idUsuario: idUsuario,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RutaKyc';

  static const _i16.PageInfo<RutaKycArgs> page =
      _i16.PageInfo<RutaKycArgs>(name);
}

class RutaKycArgs {
  const RutaKycArgs({
    required this.idUsuario,
    this.key,
  });

  final int idUsuario;

  final _i17.Key? key;

  @override
  String toString() {
    return 'RutaKycArgs{idUsuario: $idUsuario, key: $key}';
  }
}

/// generated route for
/// [_i12.PaginaLogin]
class RutaLogin extends _i16.PageRouteInfo<void> {
  const RutaLogin({List<_i16.PageRouteInfo>? children})
      : super(
          RutaLogin.name,
          initialChildren: children,
        );

  static const String name = 'RutaLogin';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.PaginaRecuperarPassword]
class RutaRecuperarPassword
    extends _i16.PageRouteInfo<RutaRecuperarPasswordArgs> {
  RutaRecuperarPassword({
    required String codigoOtp,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          RutaRecuperarPassword.name,
          args: RutaRecuperarPasswordArgs(
            codigoOtp: codigoOtp,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RutaRecuperarPassword';

  static const _i16.PageInfo<RutaRecuperarPasswordArgs> page =
      _i16.PageInfo<RutaRecuperarPasswordArgs>(name);
}

class RutaRecuperarPasswordArgs {
  const RutaRecuperarPasswordArgs({
    required this.codigoOtp,
    this.key,
  });

  final String codigoOtp;

  final _i17.Key? key;

  @override
  String toString() {
    return 'RutaRecuperarPasswordArgs{codigoOtp: $codigoOtp, key: $key}';
  }
}

/// generated route for
/// [_i14.PaginaRegistro]
class RutaRegistro extends _i16.PageRouteInfo<RutaRegistroArgs> {
  RutaRegistro({
    required String tokenAuth,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
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

  static const _i16.PageInfo<RutaRegistroArgs> page =
      _i16.PageInfo<RutaRegistroArgs>(name);
}

class RutaRegistroArgs {
  const RutaRegistroArgs({
    required this.tokenAuth,
    this.key,
  });

  final String tokenAuth;

  final _i17.Key? key;

  @override
  String toString() {
    return 'RutaRegistroArgs{tokenAuth: $tokenAuth, key: $key}';
  }
}

/// generated route for
/// [_i15.SelectorDeDestinatarios]
class RutaSelectorDeDestinatarios extends _i16.PageRouteInfo<void> {
  const RutaSelectorDeDestinatarios({List<_i16.PageRouteInfo>? children})
      : super(
          RutaSelectorDeDestinatarios.name,
          initialChildren: children,
        );

  static const String name = 'RutaSelectorDeDestinatarios';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
