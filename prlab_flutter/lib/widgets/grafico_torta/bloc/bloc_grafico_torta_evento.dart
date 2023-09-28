part of 'bloc_grafico_torta.dart';

/// {@template BlocGraficoTortaEvento}
/// TODO(mati): documentar
/// {@endtemplate}
@immutable
abstract class BlocGraficoTortaEvento extends Equatable {
  /// {@macro BlocGraficoTortaEvento}
  const BlocGraficoTortaEvento();

  @override
  List<Object> get props => [];
}

/// {@template BlocGraficoTortaTraerDatos}
/// TODO(mati): documentar
/// {@endtemplate}
class BlocGraficoTortaEventoTraerDatos extends BlocGraficoTortaEvento {
  /// {@macro BlocGraficoTortaTraerDatos}
  const BlocGraficoTortaEventoTraerDatos({
    required this.idArticulo,
  });

  /// id del articulo con el cual traer los datos del gráfico torta
  final int idArticulo;
}
