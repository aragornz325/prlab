part of 'bloc_inicio.dart';

/// {@template BlocInicioEstado}
/// Maneja los distintos estados y variables guardadas en los mismos
/// {@endtemplate}
class BlocInicioEstado extends Equatable {
  /// {@macro BlocInicioEstado}
  const BlocInicioEstado._({
    this.listaArticulos = const [],
  });

  BlocInicioEstado.desde(
    BlocInicioEstado otro, {
    List<Articulo>? listaArticulos,
  }) : this._(
          listaArticulos: listaArticulos ?? otro.listaArticulos,
        );

  /// Lista de articulos a mostrar bajo el encabezado del inicio
  final List<Articulo> listaArticulos;

  @override
  List<Object> get props => [
        listaArticulos,
      ];

  bool get estaEnEstadoCargando => this is BlocInicioEstadoCargando;
}

/// {@template BlocInicioEstadoInicial}
/// Estado inicial de los componentes de la pantalla 'Inicio'
/// {@endtemplate}
class BlocInicioEstadoInicial extends BlocInicioEstado {
  /// {@macro BlocInicioEstadoInicial}
  const BlocInicioEstadoInicial() : super._();
}

/// {@template BlocInicioEstadoCargando}
/// Estado de cargando de los componentes de la pantalla 'Inicio'
/// {@endtemplate}
class BlocInicioEstadoCargando extends BlocInicioEstado {
  /// {@macro BlocInicioEstadoCargando}
  BlocInicioEstadoCargando.desde(
    super.otro,
  ) : super.desde();
}

/// {@template BlocInicioEstadoExitosoGeneral}
/// Estado exitoso general de los componentes de la pantalla 'Inicio'
/// {@endtemplate}
class BlocInicioEstadoExitosoGeneral extends BlocInicioEstado {
  /// {@macro BlocInicioEstadoExitosoGeneral}
  BlocInicioEstadoExitosoGeneral.desde(
    super.otro, {
    required super.listaArticulos,
  }) : super.desde();
}

/// {@template BlocInicioEstadoError}
/// Estado de error de los componentes de la pantalla 'Inicio'
/// {@endtemplate}
class BlocInicioEstadoError extends BlocInicioEstado {
  /// {@macro BlocInicioEstadoError}
  BlocInicioEstadoError.desde(
    super.otro, {
    required this.mensajeDeError,
  }) : super.desde();

  /// Mensaje de error
  final MensajesDeErrorInicio mensajeDeError;
}

/// Tipos de errores de 'Inicio' en caso de que sean necesarios
enum MensajesDeErrorInicio {
  unknown;
}
