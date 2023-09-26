/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Periodista extends _i1.SerializableEntity {
  Periodista({
    this.id,
    this.urlImagen,
    this.nombreCompleto,
    this.rol,
    this.idRol,
    this.medio,
    this.idMedio,
    this.bio,
    this.temas,
    this.email,
    this.telefono,
    this.ciudad,
    this.idCiudad,
    this.pais,
    this.idPais,
    this.idiomas,
    this.redesSociales,
    this.ultimaModificacion,
    this.activo,
    this.fechaCreacion,
  });

  factory Periodista.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Periodista(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      urlImagen: serializationManager
          .deserialize<String?>(jsonSerialization['urlImagen']),
      nombreCompleto: serializationManager
          .deserialize<String?>(jsonSerialization['nombreCompleto']),
      rol: serializationManager.deserialize<String?>(jsonSerialization['rol']),
      idRol: serializationManager.deserialize<int?>(jsonSerialization['idRol']),
      medio:
          serializationManager.deserialize<String?>(jsonSerialization['medio']),
      idMedio:
          serializationManager.deserialize<int?>(jsonSerialization['idMedio']),
      bio: serializationManager.deserialize<String?>(jsonSerialization['bio']),
      temas: serializationManager
          .deserialize<List<String>?>(jsonSerialization['temas']),
      email:
          serializationManager.deserialize<String?>(jsonSerialization['email']),
      telefono: serializationManager
          .deserialize<String?>(jsonSerialization['telefono']),
      ciudad: serializationManager
          .deserialize<String?>(jsonSerialization['ciudad']),
      idCiudad:
          serializationManager.deserialize<int?>(jsonSerialization['idCiudad']),
      pais:
          serializationManager.deserialize<String?>(jsonSerialization['pais']),
      idPais:
          serializationManager.deserialize<int?>(jsonSerialization['idPais']),
      idiomas: serializationManager
          .deserialize<List<String>?>(jsonSerialization['idiomas']),
      redesSociales: serializationManager
          .deserialize<String?>(jsonSerialization['redesSociales']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['ultimaModificacion']),
      activo:
          serializationManager.deserialize<bool?>(jsonSerialization['activo']),
      fechaCreacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? urlImagen;

  String? nombreCompleto;

  String? rol;

  int? idRol;

  String? medio;

  int? idMedio;

  String? bio;

  List<String>? temas;

  String? email;

  String? telefono;

  String? ciudad;

  int? idCiudad;

  String? pais;

  int? idPais;

  List<String>? idiomas;

  String? redesSociales;

  DateTime? ultimaModificacion;

  bool? activo;

  DateTime? fechaCreacion;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'urlImagen': urlImagen,
      'nombreCompleto': nombreCompleto,
      'rol': rol,
      'idRol': idRol,
      'medio': medio,
      'idMedio': idMedio,
      'bio': bio,
      'temas': temas,
      'email': email,
      'telefono': telefono,
      'ciudad': ciudad,
      'idCiudad': idCiudad,
      'pais': pais,
      'idPais': idPais,
      'idiomas': idiomas,
      'redesSociales': redesSociales,
      'ultimaModificacion': ultimaModificacion,
      'activo': activo,
      'fechaCreacion': fechaCreacion,
    };
  }
}
