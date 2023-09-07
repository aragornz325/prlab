import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:logging/logging.dart';
import 'package:prlab_server/src/cloudinary.dart';
import 'package:prlab_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

/// Odm para manejar archivos con el servicio de alojamiento Cloudinary.
class OdmManejoArchivosCloudinary extends OdmCloudinary {
  
  /// la funcion [guardarRegistroimagen] guarda un registro de la imagen en la
  /// base de datos.
  /// Args:
  ///  [session] ([Session]): Un objeto de sesión que contiene información sobre
  /// la conexión.
  /// [nombre] ([String]): El nombre de la imagen.
  /// [publicId] ([String]): El publicId de la imagen.
  /// [url] ([String]): La url de la imagen.
  /// [idArticulo] ([int]): El id del articulo al que pertenece la imagen.
  Future<bool> guardarRegistroimagen(
    Session session, {
    required String nombre,
    required String publicId,
    required String url,
    required int idArticulo,
  }) async {
    final imagen = ImagenArticulo(
      url: url,
      nombreImagen: nombre,
      publicId: publicId,
      ultimaModificacion: DateTime.now(),
      fechaCreacion: DateTime.now(),
    );
    await ImagenArticulo.insert(session, imagen);
    return true;
  }

  /// Borra una imagen del alojamiento en la nube. Requiere de su public-id
  /// (<carpeta>/<nombre-del-archivo-sin-extension>) y la url.
  Future<bool> borrarImagen(
    Session session,
    String publicId,
    String url,
  ) async {
    try {
      final response = await ejecutarOperacionOdm(
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
    } catch (e) {
      throw Exception(e);
    }
  }
}
