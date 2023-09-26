/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class MensajeRegistro extends _i1.SerializableEntity {
  MensajeRegistro({
    this.id,
    required this.mensaje,
    required this.host,
    required this.fechaCreacion,
  });

  factory MensajeRegistro.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return MensajeRegistro(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      mensaje: serializationManager
          .deserialize<String>(jsonSerialization['mensaje']),
      host: serializationManager.deserialize<String>(jsonSerialization['host']),
      fechaCreacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaCreacion']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String mensaje;

  String host;

  DateTime fechaCreacion;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mensaje': mensaje,
      'host': host,
      'fechaCreacion': fechaCreacion,
    };
  }
}
