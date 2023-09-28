part of 'bloc_grafico_torta.dart';

/// {@template BlocGraficoTortaEstado}
/// TODO(mati): documentar
/// {@endtemplate}
@immutable
abstract class BlocGraficoTortaEstado extends Equatable {
  /// {@macro BlocGraficoTortaEstado}
  const BlocGraficoTortaEstado._({
    this.porcentajes = const [],
  });

  BlocGraficoTortaEstado.desde(
    BlocGraficoTortaEstado otro, {
    List<double>? porcentajes,
  }) : this._(
          porcentajes: porcentajes ?? otro.porcentajes,
        );

  /// Lista de porcentajes para usar en los menu torta
  final List<double> porcentajes;

  @override
  List<Object> get props => [
        porcentajes,
      ];
}

/// {@template BlocGraficoTortaEstadoInicial}
/// TODO(mati): documentar
/// {@endtemplate}
final class BlocGraficoTortaEstadoInicial extends BlocGraficoTortaEstado {
  /// {@macro BlocGraficoTortaEstadoInicial}
  const BlocGraficoTortaEstadoInicial() : super._();
}

/// {@template BlocGraficoTortaEstadoCargando}
/// TODO(mati): documentar
/// {@endtemplate}
class BlocGraficoTortaEstadoCargando extends BlocGraficoTortaEstado {
  /// {@macro BlocGraficoTortaEstadoCargando}
  BlocGraficoTortaEstadoCargando.desde(
    super.otro,
  ) : super.desde();
}

/// {@template BlocGraficoTortaEstadoExitoso}
/// TODO(mati): documentar
/// {@endtemplate}
class BlocGraficoTortaEstadoExitoso extends BlocGraficoTortaEstado {
  /// {@macro BlocGraficoTortaEstadoExitoso}
  BlocGraficoTortaEstadoExitoso.desde(
    super.otro, {
    super.porcentajes,
  }) : super.desde();
}

/// {@template BlocGraficoTortaEstadoFallido}
/// TODO(mati): documentar
/// {@endtemplate}
class BlocGraficoTortaEstadoFallido extends BlocGraficoTortaEstado {
  /// {@macro BlocGraficoTortaEstadoFallido}
  BlocGraficoTortaEstadoFallido.desde(
    super.otro, {
    required this.mensajeDeError,
  }) : super.desde();

  /// Mensaje de error
  final String mensajeDeError;
}
