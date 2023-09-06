import 'package:prlab_server/src/cloudinary.dart';
import 'package:prlab_server/src/odms/odm_cloudinary.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/serverpod.dart';

/// Servicio para manejo de archivos con almacenamiento en la nube.
class ServicioCloudinary extends Servicio<OdmCloudinary> {
  /// Instancia de ODM.
  @override
  final odmCloudinary = OdmManejoArchivosCloudinary();
  final servicioArticulo = ServicioArticulo();

  /// Sube una imagen a la nube. Requiere de la ruta del archivo, el nombre y
  /// la carpeta donde se va a alojar.
  Future<String> subirImagen(
    Session session, {
    required String path,
    required String fileName,
    required String cloudinaryFolder,
  }) async {
    logger.info('Subiendo imagen $fileName a la nube');
    return await performOperation(() => odmCloudinary.subirImagen(
          session,
          path: path,
          fileName: fileName,
          cloudinaryFolder: cloudinaryFolder,
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
    return await performOperation(
      () => odmCloudinary.borrarImagen(
        session,
        publicId,
        url,
      ),
    );
  }

  Future<String> subirImagenArticulo({
    required Session session,
    required String path,
    required int idArticulo,
  }) async {
    logger.info('Subiendo imagen $path a la nube');
    final fileName = path.split('/').last;
    return await performOperation(
      () => odmCloudinary.subirImagen(session,
          path: path,
          fileName: fileName,
          cloudinaryFolder: 'cloudinaryCustomFolder'),
    );
  }


}
