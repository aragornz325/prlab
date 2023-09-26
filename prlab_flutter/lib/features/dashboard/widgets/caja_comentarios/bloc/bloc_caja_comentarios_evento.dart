part of 'bloc_caja_comentarios.dart';

/// {@template BlocCajaComentariosEvento}
/// Maneja los eventos de la lista de los comentarios
/// {@endtemplate}
@immutable
abstract class BlocCajaComentariosEvento extends Equatable {
  /// {@macro BlocCajaComentariosEvento}
  const BlocCajaComentariosEvento();

  @override
  List<Object> get props => [];
}

/// {@template BlocCajaComentariosEventoDesplegarComentario}
/// Despliega dicho comentario para que el usuario pueda escribir/agregar un
/// nuevo comentario
/// {@endtemplate}
class BlocCajaComentariosEventoDesplegarComentario
    extends BlocCajaComentariosEvento {
  /// {@macro BlocCajaComentariosEventoDesplegarComentario}
  @override
  const BlocCajaComentariosEventoDesplegarComentario({
    required this.deplegarComentario,
  });

  /// Indica si el comentario esta desplegado o no
  final bool deplegarComentario;
}

/// {@template BlocCajaComentariosEventoCrearComentario}
/// Llama a la función de crear un nuevo comentario para un articulo
/// {@endtemplate}
class BlocCajaComentariosEventoCrearComentario
    extends BlocCajaComentariosEvento {
  /// {@macro BlocCajaComentariosEventoCrearComentario}
  @override
  const BlocCajaComentariosEventoCrearComentario({required this.idArticulo});

  /// id del articulo al cual agregar el comentario
  final int idArticulo;
}

/// {@template BlocCajaComentariosEventoCrearComentario}
/// Llama a la función de crear un nuevo comentario para un articulo
/// {@endtemplate}
class BlocCajaComentariosEventoAgregarTextoDeComentario
    extends BlocCajaComentariosEvento {
  /// {@macro BlocCajaComentariosEventoCrearComentario}
  @override
  const BlocCajaComentariosEventoAgregarTextoDeComentario({
    required this.comentario,
  });

  /// Comentario/texto a agregar
  final String? comentario;
}

/// {@template BlocCajaComentariosEventoEliminarComentario}
/// Elimina de la lista de comentario el seleccionado
/// {@endtemplate}
class BlocCajaComentariosEventoEliminarComentario
    extends BlocCajaComentariosEvento {
  /// {@macro BlocCajaComentariosEventoEliminarComentario}
  @override
  const BlocCajaComentariosEventoEliminarComentario({
    required this.idComentario,
  });

  /// Id del comentario a eliminar.
  final int idComentario;
}

/// {@template BlocCajaComentariosEventoAprobarComentario}
/// El usuario del articulo puede aprobar dicho comentario para hacerle saber a
/// otro que se aprobó su comentario
/// {@endtemplate}
class BlocCajaComentariosEventoAlternarAprobacionComentario
    extends BlocCajaComentariosEvento {
  /// {@macro BlocCajaComentariosEventoAprobarComentario}
  @override
  const BlocCajaComentariosEventoAlternarAprobacionComentario({
    required this.idComentario,
  });

  /// Id del comentario a aprobar o desaprobar
  final int idComentario;
}

/// {@template BlocCajaComentariosEventoTraerComentarios}
/// Trae todos los comentarios de un articulo por el id del articulo
/// {@endtemplate}
class BlocCajaComentariosEventoTraerComentarios
    extends BlocCajaComentariosEvento {
  /// {@macro BlocCajaComentariosEventoTraerComentarios}
  @override
  const BlocCajaComentariosEventoTraerComentarios({required this.idArticulo});

  /// id del articulo del cual obtener todos los articulos
  final int idArticulo;
}
