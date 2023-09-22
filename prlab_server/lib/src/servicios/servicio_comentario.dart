import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/odms/odm_comentario.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/serverpod.dart';

class ServicioComentario extends Servicio<OdmComentario> {
  final odm = OdmComentario();
  Future<List<Comentario>> listarComentariosPorArticulo({
    required Session session,
    required int idArticulo,
  }) async {
    logger.finer('Listando Comentarios por Articulo');
    return await ejecutarOperacion(() => odm.listarComentariosPorArticulo(
          session,
          idArticulo: idArticulo,
        ));
  }

  ///servicio que devuelve todos los comentarios en la db
  Future<List<Comentario>> listarTodosComentarios({
    required Session session,
  }) async {
    logger.finer('Listando Todos los Comentarios');
    return await ejecutarOperacion(() => odm.listarTodosComentarios(
          session,
        ));
  }

  Future<Comentario> obtenerComentario({
    required Session session,
    required int idComentario,
  }) async {
    logger.finer('Obteniendo Comentario');
    final comentario = await ejecutarOperacion(() => odm.obtenerComentario(
          session,
          idComentario: idComentario,
        ));
        if (comentario == null) {
          throw Exception('Comentario no encontrado');
        }
        return comentario;
  }


  Future<bool> eliminarComentario({
    required Session session,
    required int idComentario,
  }) async {
    logger.finer('Eliminando Comentario');
    return await ejecutarOperacion(() => odm.eliminarComentario(
          session,
          idComentario,
        ));
  }

  Future<bool> crearComentario({
    required Session session,
    required Comentario comentario,
  }) async {
    logger.finer('Creando Comentario');
    return await ejecutarOperacion(() => odm.crearComentario(
          session,
          comentario: comentario,
        ));
  }

  Future<bool> modificarComentario({
    required Session session,
    required Comentario comentario,
  }) async {
    logger.finer('Modificando Comentario');
    return await ejecutarOperacion(() => odm.modificarComentario(
          session,
          comentario: comentario,
        ));
  }
}
