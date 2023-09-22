part of 'bloc_caja_comentarios.dart';

/// {@template BlocCajaComentariosEvento}
///
/// {@endtemplate}
@immutable
abstract class BlocCajaComentariosEvento extends Equatable {
  /// {@macro BlocCajaComentariosEvento}
  const BlocCajaComentariosEvento();

  @override
  List<Object> get props => [];
}

/// {@template BlocCajaComentariosEventoDesplegarComentario}
///
/// {@endtemplate}
class BlocCajaComentariosEventoDesplegarComentario
    extends BlocCajaComentariosEvento {
  /// {@macro BlocCajaComentariosEventoDesplegarComentario}
  @override
  const BlocCajaComentariosEventoDesplegarComentario();
}

/// {@template BlocCajaComentariosEventoCrearComentario}
///
/// {@endtemplate}
class BlocCajaComentariosEventoCrearComentario
    extends BlocCajaComentariosEvento {
  /// {@macro BlocCajaComentariosEventoCrearComentario}
  @override
  const BlocCajaComentariosEventoCrearComentario();
}

/// {@template BlocCajaComentariosEventoEliminarComentario}
///
/// {@endtemplate}
class BlocCajaComentariosEventoEliminarComentario
    extends BlocCajaComentariosEvento {
  /// {@macro BlocCajaComentariosEventoEliminarComentario}
  @override
  const BlocCajaComentariosEventoEliminarComentario();
}

/// {@template BlocCajaComentariosEventoAprobarComentario}
///
/// {@endtemplate}
class BlocCajaComentariosEventoAprobarComentario
    extends BlocCajaComentariosEvento {
  /// {@macro BlocCajaComentariosEventoAprobarComentario}
  @override
  const BlocCajaComentariosEventoAprobarComentario();
}
