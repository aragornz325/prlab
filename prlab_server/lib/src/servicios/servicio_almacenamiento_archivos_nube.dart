import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:prlab_server/src/cloudinary.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/serverpod.dart';

/// Servicio para manejo de archivos con almacenamiento en la nube.
class ServicioAlmacenamientoArchivosNube extends Servicio<OdmCloudinary> {
  /// Sube una imagen a la nube. Requiere de la ruta del archivo, el nombre y
  /// la carpeta donde se va a alojar.
  Future<CloudinaryResponse> subirImagen(
    Session session, {
    required String rutaImagen,
    required String nombreImagen,
    required String directorioNube,
  }) async {
    final archivo = File(rutaImagen);
    return await ejecutarOperacion(
      () => almacenamientoNube.upload(
        file: archivo.path,
        fileBytes: archivo.readAsBytesSync(),
        resourceType: CloudinaryResourceType.image,
        folder: directorioNube,
        fileName: nombreImagen,
        progressCallback: (count, total) {
          print('Uploading image from file with progress: $count/$total');
        },
      ),
    );
  }

  /// Borra una imagen del alojamiento en la nube. Requiere de su public-id
  /// (<carpeta>/<nombre-del-archivo-sin-extension>) y la url.
  Future<CloudinaryResponse> borrarImagen(
    Session session, {
    required String publicId,
    required String urlImagen,
  }) async {
    logger.info('Borrando imagen con publicId: $publicId');
    return await ejecutarOperacion(
      () => almacenamientoNube.destroy(
        publicId,
        url: urlImagen,
        resourceType: CloudinaryResourceType.image,
        invalidate: false,
      ),
    );
  }
}
