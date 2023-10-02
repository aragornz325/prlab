/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class RedSocial extends _i1.SerializableEntity {
  RedSocial({
    this.id,
    required this.redSocial,
    required this.urlIcono,
    required this.nombreDeUsuario,
    required this.urlPerfil,
  });

  factory RedSocial.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return RedSocial(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      redSocial: serializationManager
          .deserialize<String>(jsonSerialization['redSocial']),
      urlIcono: serializationManager
          .deserialize<String>(jsonSerialization['urlIcono']),
      nombreDeUsuario: serializationManager
          .deserialize<String>(jsonSerialization['nombreDeUsuario']),
      urlPerfil: serializationManager
          .deserialize<String>(jsonSerialization['urlPerfil']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String redSocial;

  String urlIcono;

  String nombreDeUsuario;

  String urlPerfil;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'redSocial': redSocial,
      'urlIcono': urlIcono,
      'nombreDeUsuario': nombreDeUsuario,
      'urlPerfil': urlPerfil,
    };
  }
}
