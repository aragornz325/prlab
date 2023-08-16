// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:prlab_flutter/paginas/crear_cuenta_admin/pagina_crear_cuenta_admin.dart'
    as _i1;
import 'package:prlab_flutter/paginas/kyc/pagina_kyc.dart' as _i3;
import 'package:prlab_flutter/paginas/login/pagina_login.dart' as _i2;
import 'package:prlab_flutter/paginas/recuperar_contrasenia/pagina_recuparar_contrasenia.dart'
    as _i4;

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
    PaginaKyc.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PaginaKyc(),
      );
    },
    PaginaRecuperarContrasenia.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PaginaRecuperarContrasenia(),
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
/// [_i3.PaginaKyc]
class PaginaKyc extends _i5.PageRouteInfo<void> {
  const PaginaKyc({List<_i5.PageRouteInfo>? children})
      : super(
          PaginaKyc.name,
          initialChildren: children,
        );

  static const String name = 'PaginaKyc';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PaginaRecuperarContrasenia]
class PaginaRecuperarContrasenia extends _i5.PageRouteInfo<void> {
  const PaginaRecuperarContrasenia({List<_i5.PageRouteInfo>? children})
      : super(
          PaginaRecuperarContrasenia.name,
          initialChildren: children,
        );

  static const String name = 'PaginaRecuperarContrasenia';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
