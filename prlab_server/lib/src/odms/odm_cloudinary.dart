import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:prlab_server/src/cloudinary.dart';
import 'package:serverpod/server.dart';

/// Odm para manejar archivos con el servicio de alojamiento Cloudinary.
class OdmManejoArchivosCloudinary extends OdmCloudinary {
  /// Sube una imagen a la nube. Requiere de la ruta del archivo, el nombre y
  /// la carpeta donde se va a alojar.
  Future<String> subirImagen(
    Session session, {
    required String path,
    required String fileName,
    required String cloudinaryFolder,
  }) async {
    final file = File(path);

    final response = await performOdmOperation(
      session,
      (session) => cloudinary.upload(
        file: file.path,
        fileBytes: file.readAsBytesSync(),
        resourceType: CloudinaryResourceType.image,
        folder: cloudinaryFolder,
        fileName: fileName,
        progressCallback: (count, total) {
          print('Uploading image from file with progress: $count/$total');
        },
      ),
    );

    if (response.isSuccessful) {
      print('Get your image from with ${response.secureUrl}');
    }

    return response.secureUrl!;
  }

  /// Borra una imagen del alojamiento en la nube. Requiere de su public-id
  /// (<carpeta>/<nombre-del-archivo-sin-extension>) y la url.
  Future<bool> borrarImagen(
    Session session,
    String publicId,
    String url,
  ) async {
    final response = await performOdmOperation(
      session,
      (session) => cloudinary.destroy(
        publicId,
        url: url,
        resourceType: CloudinaryResourceType.image,
        invalidate: false,
      ),
    );

    if (response.isSuccessful) {
      return true;
    } else {
      return false;
    }
  }
}
