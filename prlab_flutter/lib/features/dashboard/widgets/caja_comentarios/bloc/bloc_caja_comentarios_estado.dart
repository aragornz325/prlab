part of 'bloc_caja_comentarios.dart';

/// {@template BlocCajaComentariosEstado}
/// maneja los estados de la lista de los comentarios
/// {@endtemplate}
@immutable
abstract class BlocCajaComentariosEstado extends Equatable {
  /// {@macro BlocCajaComentariosEstado}
  @override
  const BlocCajaComentariosEstado._({
    this.comentarios = const [],
    this.desplegarComentario = false,
    this.comentario = '',
  });

  BlocCajaComentariosEstado.desde(
    BlocCajaComentariosEstado otro, {
    List<Comentario>? comentarios,
    bool? desplegarComentario,
    String? comentario,
  }) : this._(
          comentarios: comentarios ?? otro.comentarios,
          desplegarComentario: desplegarComentario ?? otro.desplegarComentario,
          comentario: comentario ?? otro.comentario,
        );

  /// Lista de los comentarios a leer modificar y agregar
  final List<Comentario> comentarios;

  /// Indica si el comentario fue desplegado o no
  final bool desplegarComentario;

  /// comentario a agregar por el usuario
  final String comentario;

  @override
  List<Object> get props => [
        comentarios,
        desplegarComentario,
        comentario,
      ];
}

/// {@template BlocCajaComentariosEstadoInicial}
/// Estado inicial de los comentarios
/// {@endtemplate}
class BlocCajaComentariosEstadoInicial extends BlocCajaComentariosEstado {
  /// {@macro BlocCajaComentariosEstadoInicial}

  const BlocCajaComentariosEstadoInicial() : super._();
}

/// {@template BlocCajaComentariosEstadoCargando}
/// Estado cargando de los comentarios
/// {@endtemplate}
class BlocCajaComentariosEstadoCargando extends BlocCajaComentariosEstado {
  /// {@macro BlocCajaComentariosEstadoCargando}
  BlocCajaComentariosEstadoCargando.desde(super.otro) : super.desde();
}

/// {@template BlocCajaComentariosEstadoExitoso}
/// Estado exitoso de los comentarios
/// {@endtemplate}
class BlocCajaComentariosEstadoExitoso extends BlocCajaComentariosEstado {
  /// {@macro BlocCajaComentariosEstadoExitoso}
  BlocCajaComentariosEstadoExitoso.desde(
    super.otro, {
    super.comentarios,
    super.desplegarComentario,
    super.comentario,
  }) : super.desde();
}

/// {@template BlocCajaComentariosEstadoExitoso}
/// Estado exitoso de los comentarios
/// {@endtemplate}
class BlocCajaComentariosEstadoComentarioCreadoExitosamente
    extends BlocCajaComentariosEstado {
  /// {@macro BlocCajaComentariosEstadoExitoso}
  BlocCajaComentariosEstadoComentarioCreadoExitosamente.desde(super.otro)
      : super.desde();
}

/// {@template BlocCajaComentariosEstadoFallido}
/// Estado fallido de los comentarios que tiene un error a mostrar para saber
/// que tipo de error Ocurrió
/// {@endtemplate}
class BlocCajaComentariosEstadoFallido extends BlocCajaComentariosEstado {
  /// {@macro BlocCajaComentariosEstadoFallido}
  BlocCajaComentariosEstadoFallido.desde(
    super.otro, {
    required this.errorMessage,
  }) : super.desde();

  /// Mensaje que se va a mostrar en caso de que sea error
  /// o de que algo haya salido mal.
  final String errorMessage;
}
