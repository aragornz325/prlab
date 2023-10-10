import 'dart:typed_data';

import 'package:prlab_server/src/servicios/servicio_almacenamiento_archivos_nube.dart';
import 'package:serverpod/server.dart';

/// Endpoints para manejo de archivos con almacenamiento en la nube.
class AlmacenamientoArchivosNubeEndpoint extends Endpoint {
  /// Instancia del servicio.
  final servicio = ServicioAlmacenamientoArchivosNube();

  /// Sube una imagen a la nube. Requiere de la ruta del archivo, el nombre y
  /// la carpeta donde se va a alojar.
  /// Se puede subir por dos vías:
  /// - Mediante la ruta del archivo (parámetro [rutaImagen]). Sólo funciona en 
  /// local.  
  /// - Mediante enviar el archivo como [Uint8List]. Es la forma que funciona 
  /// con el server desplegado.
  Future<String> subirImagen(
    Session session, {
    required String nombreImagen,
    required String directorioNube,
    String? rutaImagen,
    List<int>? bytesImagen,
  }) async {
    return (await servicio.subirImagen(
      session,
      nombreImagen: nombreImagen,
      directorioNube: directorioNube,
      rutaImagen: rutaImagen,
      bytesImagen: bytesImagen,
    ))
        .secureUrl!;
  }

  /// Borra una imagen del alojamiento en la nube. Requiere de su public-id
  /// (<carpeta>/<nombre-del-archivo-sin-extension>) y la url.
  Future<String> borrarImagen(
    Session session, {
    required String publicId,
    required String urlImagen,
  }) async {
    return servicio
        .borrarImagen(
          session,
          publicId: publicId,
          urlImagen: urlImagen,
        )
        .toString();
  }
}
