part of 'bloc_inicio.dart';

/// {@template BlocInicioEvento}
/// Clase padre de los eventos de 'Inicio'
/// {@endtemplate}
abstract class BlocInicioEvento extends Equatable {
  /// {@macro BlocInicioEvento}
  const BlocInicioEvento();

  @override
  List<Object> get props => [];
}

/// {@template BlocInicioEventoInicializar}
/// Inicializa la pagina 'Inicio'
/// {@endtemplate}
class BlocInicioEventoInicializar extends BlocInicioEvento {}
