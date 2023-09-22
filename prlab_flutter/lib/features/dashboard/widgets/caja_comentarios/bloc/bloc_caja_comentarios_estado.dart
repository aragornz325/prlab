part of 'bloc_caja_comentarios.dart';

/// {@template BlocCajaComentariosEstadoInicialEstado}
/// {@endtemplate}
@immutable
abstract class BlocCajaComentariosEstado extends Equatable {
  /// {@macro BlocListaArticulosYRecortesEstado}
  @override
  const BlocCajaComentariosEstado._();

  BlocCajaComentariosEstado.desde(
    BlocCajaComentariosEstado otro,
  ) : this._();

  @override
  List<Object> get props => [];
}

/// {@template BlocCajaComentariosEstadoInicialEstado}
/// {@endtemplate}
class BlocCajaComentariosEstadoInicial extends BlocCajaComentariosEstado {
  /// {@macro BlocCajaComentariosEstadoInicialEstado}

  const BlocCajaComentariosEstadoInicial() : super._();
}

/// {@template BlocCajaComentariosEstadoCargandoEstado}
/// {@endtemplate}
class BlocCajaComentariosEstadoCargando extends BlocCajaComentariosEstado {
  /// {@macro BlocCajaComentariosEstadoCargandoEstado}
  BlocCajaComentariosEstadoCargando.desde(super.otro) : super.desde();
}

/// {@template BlocCajaComentariosEstadoExitosoEstado}
/// {@endtemplate}
class BlocCajaComentariosEstadoExitoso extends BlocCajaComentariosEstado {
  /// {@macro BlocCajaComentariosEstadoExitosoEstado}
  BlocCajaComentariosEstadoExitoso.desde(super.otro) : super.desde();
}

/// {@template BlocCajaComentariosEstadoFallidoEstado}
/// {@endtemplate}
class BlocCajaComentariosEstadoFallido extends BlocCajaComentariosEstado {
  /// {@macro BlocCajaComentariosEstadoFallidoEstado}
  BlocCajaComentariosEstadoFallido.desde(
    super.otro, {
    required this.errorMessage,
  }) : super.desde();

  /// Mensaje que se va a mostrar en caso de que sea error
  /// o de que algo haya salido mal.
  final String errorMessage;
}
