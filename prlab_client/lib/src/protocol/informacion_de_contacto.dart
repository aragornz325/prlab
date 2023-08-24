/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class InformacionDeContacto extends _i1.SerializableEntity {
  InformacionDeContacto({
    this.id,
    this.idUsuario,
    this.emailPrincipal,
    this.emailSecundario,
    this.telefonoPrincipal,
    this.telefonoSecundario,
    this.domicilioCalle,
    this.domicilioNumero,
    this.domicilioCiudad,
    this.domicilioCodigoPostal,
    this.domicilioEstadoProvincia,
    this.domicilioPais,
    this.ultimaModificacion,
    this.fechaCreacion,
  });

  factory InformacionDeContacto.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return InformacionDeContacto(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      idUsuario: serializationManager
          .deserialize<int?>(jsonSerialization['idUsuario']),
      emailPrincipal: serializationManager
          .deserialize<String?>(jsonSerialization['emailPrincipal']),
      emailSecundario: serializationManager
          .deserialize<String?>(jsonSerialization['emailSecundario']),
      telefonoPrincipal: serializationManager
          .deserialize<String?>(jsonSerialization['telefonoPrincipal']),
      telefonoSecundario: serializationManager
          .deserialize<String?>(jsonSerialization['telefonoSecundario']),
      domicilioCalle: serializationManager
          .deserialize<String?>(jsonSerialization['domicilioCalle']),
      domicilioNumero: serializationManager
          .deserialize<String?>(jsonSerialization['domicilioNumero']),
      domicilioCiudad: serializationManager
          .deserialize<String?>(jsonSerialization['domicilioCiudad']),
      domicilioCodigoPostal: serializationManager
          .deserialize<String?>(jsonSerialization['domicilioCodigoPostal']),
      domicilioEstadoProvincia: serializationManager
          .deserialize<String?>(jsonSerialization['domicilioEstadoProvincia']),
      domicilioPais: serializationManager
          .deserialize<String?>(jsonSerialization['domicilioPais']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['ultimaModificacion']),
      fechaCreacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? idUsuario;

  String? emailPrincipal;

  String? emailSecundario;

  String? telefonoPrincipal;

  String? telefonoSecundario;

  String? domicilioCalle;

  String? domicilioNumero;

  String? domicilioCiudad;

  String? domicilioCodigoPostal;

  String? domicilioEstadoProvincia;

  String? domicilioPais;

  DateTime? ultimaModificacion;

  DateTime? fechaCreacion;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idUsuario': idUsuario,
      'emailPrincipal': emailPrincipal,
      'emailSecundario': emailSecundario,
      'telefonoPrincipal': telefonoPrincipal,
      'telefonoSecundario': telefonoSecundario,
      'domicilioCalle': domicilioCalle,
      'domicilioNumero': domicilioNumero,
      'domicilioCiudad': domicilioCiudad,
      'domicilioCodigoPostal': domicilioCodigoPostal,
      'domicilioEstadoProvincia': domicilioEstadoProvincia,
      'domicilioPais': domicilioPais,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }
}
