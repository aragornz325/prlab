part of 'bloc_drawer.dart';

/// {@template BlocDrawerEstado}
/// Maneja los distintos estados y variables guardadas en los mismos
/// {@endtemplate}
class BlocDrawerEstado {
  /// {@macro BlocDrawerEstado}
  const BlocDrawerEstado._({
    this.cerroSesion = false,
  });

  BlocDrawerEstado.desde(
    BlocDrawerEstado otro, {
    bool? cerroSesion,
  }) : this._(
          cerroSesion: cerroSesion ?? otro.cerroSesion,
        );

  /// Indica si se cerro la sesion o no del usuario, se almacena en el bloc
  /// para redirigir a la vista login.
  final bool? cerroSesion;
}

/// {@template BlocAdministracionMarcasEstadoInicial}
/// Estado inicial de los componentes de la pantalla [BlocDrawer]
/// {@endtemplate}
class BlocDrawerEstadoInicial extends BlocDrawerEstado {
  /// {@macro BlocAdministracionMarcasEstadoInicial}
  const BlocDrawerEstadoInicial() : super._();
}

/// {@template BlocAdministracionMarcasEstadoCargando}
/// Estado de cargando de los componentes de la pantalla [BlocDrawer]
/// {@endtemplate}
class BlocDrawerEstadoCargando extends BlocDrawerEstado {
  /// {@macro BlocAdministracionMarcasEstadoCargando}
  BlocDrawerEstadoCargando.desde(
    super.otro,
  ) : super.desde();
}

/// {@template BlocAdministracionMarcasEstadoExitosoGeneral}
/// Estado exitoso general de los componentes de la pantalla [BlocDrawer]
/// {@endtemplate}
class BlocDrawerEstadoExitosoGeneral extends BlocDrawerEstado {
  /// {@macro BlocAdministracionMarcasEstadoExitosoGeneral}
  BlocDrawerEstadoExitosoGeneral.desde(
    super.otro, {
    super.cerroSesion,
  }) : super.desde();
}

/// {@template BlocAdministracionMarcasEstadoError}
/// Estado de error de los componentes de la pantalla [BlocDrawer]
/// {@endtemplate}
class BlocDrawerEstadoError extends BlocDrawerEstado {
  /// {@macro BlocAdministracionMarcasEstadoError}
  BlocDrawerEstadoError.desde(
    super.otro, {
    required this.mensajeDeError,
  }) : super.desde();

  /// Mensaje de error
  final MensajesDeError mensajeDeError;
}

/// Tipos de errores de [BlocDrawer] en caso de que sean necesarios
enum MensajesDeError {
  // TODO(ANYONE): Verificar mensajes de error
  falloCerrarSesion,
}
