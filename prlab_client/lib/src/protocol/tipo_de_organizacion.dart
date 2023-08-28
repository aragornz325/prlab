/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class TipoDeOrganizacion extends _i1.SerializableEntity {
  TipoDeOrganizacion({
    this.id,
    required this.tipo,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  });

  factory TipoDeOrganizacion.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return TipoDeOrganizacion(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      tipo: serializationManager.deserialize<String>(jsonSerialization['tipo']),
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

  String tipo;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tipo': tipo,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }
}
