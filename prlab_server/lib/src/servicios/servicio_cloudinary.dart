import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:prlab_server/src/cloudinary.dart';
import 'package:prlab_server/src/odms/odm_cloudinary.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:prlab_server/src/servicios/servicio_articulo.dart';
import 'package:serverpod/serverpod.dart';

/// Servicio para manejo de archivos con almacenamiento en la nube.
class ServicioCloudinary extends Servicio<OdmCloudinary> {
  /// Instancia de ODM.
  @override
  final odmCloudinary = OdmManejoArchivosCloudinary();

  /// Sube una imagen a la nube. Requiere de la ruta del archivo, el nombre y
  /// la carpeta donde se va a alojar.
  Future subirImagen(
    Session session, {
    required String path,
    required String fileName,
    required String cloudinaryFolder,
  }) async {
    final file = File(path);
    return await ejecutarOperacion(() => cloudinary.upload(
          file: file.path,
          fileBytes: file.readAsBytesSync(),
          resourceType: CloudinaryResourceType.image,
          folder: cloudinaryFolder,
          fileName: fileName,
          progressCallback: (count, total) {
            print('Uploading image from file with progress: $count/$total');
          },
        ));
  }

  /// Borra una imagen del alojamiento en la nube. Requiere de su public-id
  /// (<carpeta>/<nombre-del-archivo-sin-extension>) y la url.
  Future<bool> borrarImagen(
    Session session,
    String publicId,
    String url,
  ) async {
    logger.info('Borrando imagen con publicId: $publicId');
    return await ejecutarOperacion(
      () => odmCloudinary.borrarImagen(
        session,
        publicId,
        url,
      ),
    );
  }
}
