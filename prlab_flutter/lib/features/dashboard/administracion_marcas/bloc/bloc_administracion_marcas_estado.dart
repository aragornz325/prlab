part of 'bloc_administracion_marcas.dart';

/// {@template BlocAdministracionMarcasEstado}
/// Maneja los distintos estados y varibles guardadas en los mismos
/// {@endtemplate}
class BlocAdministracionMarcasEstado extends Equatable {
  /// {@macro BlocAdministracionMarcasEstado}
  const BlocAdministracionMarcasEstado._({
    this.marcas = const [],
  });

  BlocAdministracionMarcasEstado.desde(
    BlocAdministracionMarcasEstado otro, {
    List<Marca>? marcas,
  }) : this._(
          marcas: marcas ?? otro.marcas,
        );

  /// Lista de marcas a renderizar en la vista
  final List<Marca> marcas;

  @override
  List<Object> get props => [
        marcas,
      ];

  /// Indica si el state es cargando
  bool get estaEnEstadoCargando =>
      this is BlocAdministracionMarcasEstadoCargando;

  /// Indica si el state es error
  bool get estaEnEstadoError => this is BlocAdministracionMarcasEstadoError;
}

/// {@template BlocAdministracionMarcasEstadoInicial}
/// Estado inicial de los componentes de la pantalla administración de marcas
/// {@endtemplate}
class BlocAdministracionMarcasEstadoInicial
    extends BlocAdministracionMarcasEstado {
  /// {@macro BlocAdministracionMarcasEstadoInicial}
  const BlocAdministracionMarcasEstadoInicial() : super._();
}

/// {@template BlocAdministracionMarcasEstadoCargando}
/// Estado de cargando de los componentes de la pantalla administración
/// de marcas
/// {@endtemplate}
class BlocAdministracionMarcasEstadoCargando
    extends BlocAdministracionMarcasEstado {
  /// {@macro BlocAdministracionMarcasEstadoCargando}
  BlocAdministracionMarcasEstadoCargando.desde(
    super.otro,
  ) : super.desde();
}

/// {@template BlocAdministracionMarcasEstadoExitosoGeneral}
/// Estado exitoso general de los componentes de la pantalla
/// administración de marcas
/// {@endtemplate}
class BlocAdministracionMarcasEstadoExitosoGeneral
    extends BlocAdministracionMarcasEstado {
  /// {@macro BlocAdministracionMarcasEstadoExitosoGeneral}
  BlocAdministracionMarcasEstadoExitosoGeneral.desde(
    super.otro, {
    required super.marcas,
  }) : super.desde();
}

/// {@template BlocAdministracionMarcasEstadoError}
/// Estado de error de los componentes de la pantalla administración de marcas
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

// TODO(anyone): Verificar si es necesario y que excepciones pueden
// manejo de errores
// llegar a ocurrir

/// Tipos de errores de  administración de marcas a mostrar
enum MensajesDeErrorDeAdministracionMarcas {
  userNotFound,
  invalidCredentials,
  userCreationDenied,
  internalError,
  tooManyFailedAttempts,
  unknown;
}
