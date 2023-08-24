part of 'bloc_administracion_marcas.dart';

/// {@template BlocAdministracionMarcasEstado}
/// Maneja los distintos estados y varibles guardadas en los mismos
/// {@endtemplate}
class BlocAdministracionMarcasEstado extends Equatable {
  /// {@macro BlocAdministracionMarcasEstado}
  const BlocAdministracionMarcasEstado._({
    this.example = false,
  });

  BlocAdministracionMarcasEstado.desde(
    BlocAdministracionMarcasEstado otro, {
    bool? example,
  }) : this._(
          example: example ?? otro.example,
        );

  /// Example
  final bool example;

  @override
  List<Object> get props => [
        example,
      ];
}

/// {@template BlocAdministracionMarcasEstadoInicial}
/// Estado inicial de los componentes de la pantalla administracion de marcas
/// {@endtemplate}
class BlocAdministracionMarcasEstadoInicial
    extends BlocAdministracionMarcasEstado {
  /// {@macro BlocAdministracionMarcasEstadoInicial}
  const BlocAdministracionMarcasEstadoInicial() : super._();
}

/// {@template BlocAdminstracionMarcasEstadoCargando}
/// Estado de cargando de los componentes de la pantalla administracion
/// de marcas
/// {@endtemplate}
class BlocAdminstracionMarcasEstadoCargando
    extends BlocAdministracionMarcasEstado {
  /// {@macro BlocAdminstracionMarcasEstadoCargando}
  BlocAdminstracionMarcasEstadoCargando.desde(
    super.otro,
  ) : super.desde();
}

/// {@template BlocAdministracionMarcasEstadoExitosoGeneral}
// TODO(Gon): Documentar

/// {@endtemplate}
class BlocAdministracionMarcasEstadoExitosoGeneral
    extends BlocAdministracionMarcasEstado {
  /// {@macro BlocAdministracionMarcasEstadoExitosoGeneral}
  BlocAdministracionMarcasEstadoExitosoGeneral.desde(super.otro)
      : super.desde();
}

/// {@template BlocAdministracionMarcasEstadoError}
/// Estado de error de los componentes de la pantalla administracion de marcas
/// {@endtemplate}
class BlocAdministracionMarcasEstadoError
    extends BlocAdministracionMarcasEstado {
  /// {@macro BlocAdministracionMarcasEstadoError}
  BlocAdministracionMarcasEstadoError.desde(
    super.otro, {
    required this.mensajeDeError,
  }) : super.desde();

  /// Mensaje de error
  final MensajesDeErrorDeAdministracionMarcas mensajeDeError;
}

// TODO(Gon): Verificar si es necesario y que excepciones pueden llegar a ocurri

/// Tipos de errores de  administracion de marcas a mostrar
enum MensajesDeErrorDeAdministracionMarcas {
  userNotFound,
  invalidCredentials,
  userCreationDenied,
  internalError,
  tooManyFailedAttempts,
  unknown;
}
