/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class ImagenArticulo extends _i1.SerializableEntity {
  ImagenArticulo({
    this.id,
    required this.url,
    required this.nombreImagen,
    required this.publicId,
    this.idArticulo,
    this.fechaEliminacion,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  });

  factory ImagenArticulo.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ImagenArticulo(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      url: serializationManager.deserialize<String>(jsonSerialization['url']),
      nombreImagen: serializationManager
          .deserialize<String>(jsonSerialization['nombreImagen']),
      publicId: serializationManager
          .deserialize<String>(jsonSerialization['publicId']),
      idArticulo: serializationManager
          .deserialize<int?>(jsonSerialization['idArticulo']),
      fechaEliminacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaEliminacion']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['ultimaModificacion']),
      fechaCreacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaCreacion']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String url;

  String nombreImagen;

  String publicId;

  int? idArticulo;

  DateTime? fechaEliminacion;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'nombreImagen': nombreImagen,
      'publicId': publicId,
      'idArticulo': idArticulo,
      'fechaEliminacion': fechaEliminacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }
}
