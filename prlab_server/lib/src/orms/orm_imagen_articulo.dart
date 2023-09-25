import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/orm.dart';
import 'package:serverpod/server.dart';

/// Odm para manejar archivos con el servicio de alojamiento Cloudinary.
class OrmImagenArticulo extends ORM {
  /// la funcion [guardarRegistroimagen] guarda un registro de la imagen en la
  /// base de datos.
  /// Args:
  ///  [session] ([Session]): Un objeto de sesión que contiene información sobre
  /// la conexión.
  /// [nombreImagen] ([String]): El nombre de la imagen.
  /// [publicId] ([String]): El publicId de la imagen.
  /// [urlImagen] ([String]): La url de la imagen.
  /// [idArticulo] ([int]): El id del articulo al que pertenece la imagen.
  Future<bool> guardarRegistroimagen(
    Session session, {
    required String nombreImagen,
    required String publicId,
    required String urlImagen,
    required int idArticulo,
  }) async {
    final imagen = ImagenArticulo(
      url: urlImagen,
      nombreImagen: nombreImagen,
      publicId: publicId,
      ultimaModificacion: DateTime.now(),
      fechaCreacion: DateTime.now(),
    );
    await ImagenArticulo.insert(session, imagen);
    return true;
  }

  /// Recupera los registros de todas las imágenes de un artículo.
  Future<List<ImagenArticulo>> obtenerImagenesArticulo(
    Session session, {
    required int idArticulo,
  }) async {
    return await ejecutarOperacionOrm(
      session,
      (session) => ImagenArticulo.find(
        session,
        where: (t) =>
            (t.idArticulo.equals(idArticulo)) &
            (t.fechaEliminacion.equals(null)),
      ),
    );
  }

  /// Borra el registro de una imagen de artículo. BORRADO FÍSICO.
  Future<bool> borrarImagenBorradoFisico(
    Session session, {
    required int idImagenArticulo,
  }) async {
    try {
      await ejecutarOperacionOrm(
        session,
        (session) => ImagenArticulo.delete(
          session,
          where: (t) => t.id.equals(idImagenArticulo),
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Borra el registro de una imagen de artículo.
  Future<bool> borrarImagen(
    Session session, {
    required ImagenArticulo imagenArticulo,
  }) async {
    try {
      await ejecutarOperacionOrm(
        session,
        (session) => ImagenArticulo.update(
          session,
          imagenArticulo..fechaEliminacion = DateTime.now(),
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
