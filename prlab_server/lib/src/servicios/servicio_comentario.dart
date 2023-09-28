import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/orms/orm_comentario.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/serverpod.dart';

class ServicioComentario extends Servicio<OrmComentario> {
  final orm = OrmComentario();

  /// La función "listarComentariosPorArticulo" enumera los comentarios de un artículo determinado
  /// utilizando una sesión y un ID de artículo.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. Representa la
  /// sesión o conexión actual a la base de datos.
  ///   idArticulo (int): La identificación del artículo para el cual desea enumerar los comentarios.
  ///
  /// Returns:
  ///   un objeto `Futuro` que se resuelve en una `Lista` de objetos `Comentario`.
  Future<List<Comentario>> listarComentariosPorArticulo({
    required Session session,
    required int idArticulo,
  }) async {
    logger.finer('Listando Comentarios por Articulo');
    return await ejecutarOperacion(() => orm.listarComentariosPorArticulo(
          session,
          idArticulo: idArticulo,
        ));
  }

  ///servicio que devuelve todos los comentarios en la db
  Future<List<Comentario>> listarTodosComentarios({
    required Session session,
  }) async {
    logger.finer('Listando Todos los Comentarios');
    return await ejecutarOperacion(() => orm.listarTodosComentarios(
          session,
        ));
  }

  /// La función "obtenerCommentario" recupera un comentario con un ID específico de una sesión y lanza
  /// una excepción si no se encuentra el comentario.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. Representa la
  /// sesión o conexión actual a la base de datos.
  ///   idComentario (int): El parámetro "idComentario" es un número entero que representa el
  /// identificador único de un comentario.
  ///
  /// Returns:
  ///   a `Future<Comentario>`.
  Future<Comentario> obtenerComentario({
    required Session session,
    required int idComentario,
  }) async {
    logger.finer('Obteniendo Comentario');
    final comentario = await ejecutarOperacion(() => orm.obtenerComentario(
          session,
          idComentario: idComentario,
        ));
    if (comentario == null) {
      throw Exception('Comentario no encontrado');
    }
    return comentario;
  }

  /// La función `eliminarComentario` es una función de Dart que elimina un comentario usando un ORM y
  /// devuelve un booleano que indica si la operación fue exitosa.
  ///
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión, que representa la sesión actual o la
  /// sesión del usuario.
  ///   idComentario (int): El parámetro "idComentario" es un número entero que representa el
  /// identificador único de un comentario que debe eliminarse.
  ///
  /// Returns:
  ///   un `Futuro<bool>`.
  Future<bool> eliminarComentario({
    required Session session,
    required int idComentario,
  }) async {
    logger.finer('Eliminando Comentario');
    return await ejecutarOperacion(() => orm.eliminarComentario(
          session,
          idComentario,
        ));
  }

  /// La función `crearCommentario` crea un comentario en una sesión usando un ORM.
  ///
  /// Args:
  ///   session (Session): El parámetro `sesión` representa la sesión o conexión actual a la base de
  /// datos. Es de tipo `Session` y es obligatorio.
  ///   comentario (Comentario): El parámetro "comentario" es de tipo "Comentario" y representa el
  /// comentario que necesita ser modificado.
  ///
  /// Returns:
  ///   La función `modificarCommentario` devuelve un `Futuro<bool>`.
  Future<Comentario?> crearComentario({
    required Session session,
    required Comentario comentario,
  }) async {
    logger.finer('Creando Comentario');
    return await ejecutarOperacion(() => orm.crearComentario(
          session,
          comentario: comentario,
        ));
  }

  /// La función `modificarCommentario` modifica un comentario en una sesión usando un ORM.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. Representa la
  /// sesión o conexión actual a la base de datos.
  ///   comentario (Comentario): El parámetro "comentario" es de tipo "Comentario" y es obligatorio.
  /// Representa el comentario que necesita ser modificado.
  ///
  /// Returns:
  ///   un `Futuro<bool>`.
  Future<bool> modificarComentario({
    required Session session,
    required Comentario comentario,
  }) async {
    logger.finer('Modificando Comentario ${comentario.textoComentario}');
    return await ejecutarOperacion(() => orm.modificarComentario(
          session,
          comentario: comentario,
        ));
  }
}
