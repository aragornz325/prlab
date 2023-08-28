import 'package:prlab_server/src/servicios/servicio_cloudinary.dart';
import 'package:serverpod/server.dart';

/// Endpoints para manejo de archivos con almacenamiento en la nube.
class ArchivosEndpoint extends Endpoint {

  /// Instancia del servicio.
  final servicio = ServicioCloudinary();

  /// Sube una imagen a la nube. Requiere de la ruta del archivo, el nombre y
  /// la carpeta donde se va a alojar.
  Future<String> subirImagen(
    Session session, {
    required String path,
    required String fileName,
    required String cloudinaryFolder,
  }) async =>
      await servicio.subirImagen(
        session,
        path: path,
        fileName: fileName,
        cloudinaryFolder: cloudinaryFolder,
      );

  /// Borra una imagen del alojamiento en la nube. Requiere de su public-id
  /// (<carpeta>/<nombre-del-archivo-sin-extension>) y la url.
  Future<bool> borrarImagen(
    Session session,
    String publicId,
    String url,
  ) async =>
      await servicio.borrarImagen(session, publicId, url);
}
