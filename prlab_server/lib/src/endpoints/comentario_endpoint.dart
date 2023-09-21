import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/servicios/servicio_comentario.dart';
import 'package:prlab_server/src/servicios/servicio_marca.dart';
import 'package:serverpod/serverpod.dart';

class ComentarioEndpoint extends Endpoint {
  final servicioComentario = ServicioComentario();

  Future<List<Comentario>> listarComentariosPorArticulo(
    Session session, {
    required int idArticulo,
  }) async {
    try {
      return servicioComentario.listarComentariosPorArticulo(
        session: session,
        idArticulo: idArticulo,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> eliminarComentario(
    Session session, {
    required int idArticulo,
  }) async {
    try {
      return servicioComentario.eliminarComentario(
        session: session,
        idArticulo: idArticulo,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> crearComentario(
    Session session, {
    required Comentario comentario,
  }) async {
    try {
      return servicioComentario.crearComentario(
        session: session,
        comentario: comentario,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> modificarComentario(
    Session session, {
    required Comentario comentario,
  }) async {
    try {
      return servicioComentario.modificarComentario(
        session: session,
        comentario: comentario,
      );
    } catch (e) {
      rethrow;
    }
  }
}
