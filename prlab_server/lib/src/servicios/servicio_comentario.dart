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




}
