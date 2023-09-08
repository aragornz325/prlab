import 'package:cloudinary/cloudinary.dart';
import 'package:prlab_server/src/servicios/servicio_almacenamiento_archivos_nube.dart';
import 'package:serverpod/server.dart';

/// Endpoints para manejo de archivos con almacenamiento en la nube.
class AlmacenamientoArchivosNubeEndpoint extends Endpoint {
  /// Instancia del servicio.
  final servicio = ServicioAlmacenamientoArchivosNube();

  /// Sube una imagen a la nube. Requiere de la ruta del archivo, el nombre y
  /// la carpeta donde se va a alojar.
  Future<String> subirImagen(
    Session session, {
    required String rutaImagen,
    required String nombreImagen,
    required String directorioNube,
  }) async {
    return await servicio.subirImagen(
      session,
      rutaImagen: rutaImagen,
      nombreImagen: nombreImagen,
      directorioNube: directorioNube,
    ).toString();
  }

  /// Borra una imagen del alojamiento en la nube. Requiere de su public-id
  /// (<carpeta>/<nombre-del-archivo-sin-extension>) y la url.
  Future<String> borrarImagen(
    Session session, {
    required String publicId,
    required String urlImagen,
  }) async {
    return await servicio.borrarImagen(
      session,
      publicId: publicId,
      urlImagen: urlImagen,
    ).toString();
  }
}
