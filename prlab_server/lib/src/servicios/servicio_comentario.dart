import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/odms/odm_comentario.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/serverpod.dart';

class ServicioComentario extends Servicio<OdmComentario> {
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

  Future<bool> eliminarComentario({
    required Session session,
    required int idArticulo,
  }) async {
    logger.finer('Eliminando Comentario');
    return await ejecutarOperacion(() => odm.eliminarComentario(
          session,
          idArticulo,
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
