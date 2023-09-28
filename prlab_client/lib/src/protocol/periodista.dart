/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class Periodista extends _i1.SerializableEntity {
  Periodista({
    this.id,
    required this.urlImagen,
    required this.nombres,
    required this.apellidos,
    required this.puesto,
    required this.medio,
    required this.biografia,
    required this.temas,
    required this.email,
    required this.telefono,
    required this.ciudad,
    required this.pais,
    required this.idiomas,
    required this.redesSociales,
  });

  factory Periodista.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Periodista(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      urlImagen: serializationManager
          .deserialize<String>(jsonSerialization['urlImagen']),
      nombres: serializationManager
          .deserialize<String>(jsonSerialization['nombres']),
      apellidos: serializationManager
          .deserialize<String>(jsonSerialization['apellidos']),
      puesto:
          serializationManager.deserialize<String>(jsonSerialization['puesto']),
      medio:
          serializationManager.deserialize<String>(jsonSerialization['medio']),
      biografia: serializationManager
          .deserialize<String>(jsonSerialization['biografia']),
      temas: serializationManager
          .deserialize<List<String>>(jsonSerialization['temas']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      telefono: serializationManager
          .deserialize<String>(jsonSerialization['telefono']),
      ciudad:
          serializationManager.deserialize<String>(jsonSerialization['ciudad']),
      pais: serializationManager.deserialize<String>(jsonSerialization['pais']),
      idiomas: serializationManager
          .deserialize<List<String>>(jsonSerialization['idiomas']),
      redesSociales: serializationManager
          .deserialize<List<_i2.RedSocial>>(jsonSerialization['redesSociales']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String urlImagen;

  String nombres;

  String apellidos;

  String puesto;

  String medio;

  String biografia;

  List<String> temas;

  String email;

  String telefono;

  String ciudad;

  String pais;

  List<String> idiomas;

  List<_i2.RedSocial> redesSociales;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'urlImagen': urlImagen,
      'nombres': nombres,
      'apellidos': apellidos,
      'puesto': puesto,
      'medio': medio,
      'biografia': biografia,
      'temas': temas,
      'email': email,
      'telefono': telefono,
      'ciudad': ciudad,
      'pais': pais,
      'idiomas': idiomas,
      'redesSociales': redesSociales,
    };
  }
}
