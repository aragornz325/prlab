/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Cliente extends _i1.SerializableEntity {
  Cliente({
    this.id,
    required this.nombre,
    required this.apellido,
    required this.fechaDeNacimiento,
    this.idUsuario,
    this.idOrganizacion,
    this.contacto,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  });

  factory Cliente.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Cliente(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      nombre:
          serializationManager.deserialize<String>(jsonSerialization['nombre']),
      apellido: serializationManager
          .deserialize<String>(jsonSerialization['apellido']),
      fechaDeNacimiento: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaDeNacimiento']),
      idUsuario: serializationManager
          .deserialize<int?>(jsonSerialization['idUsuario']),
      idOrganizacion: serializationManager
          .deserialize<int?>(jsonSerialization['idOrganizacion']),
      contacto:
          serializationManager.deserialize<int?>(jsonSerialization['contacto']),
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

  String nombre;

  String apellido;

  DateTime fechaDeNacimiento;

  int? idUsuario;

  int? idOrganizacion;

  int? contacto;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'fechaDeNacimiento': fechaDeNacimiento,
      'idUsuario': idUsuario,
      'idOrganizacion': idOrganizacion,
      'contacto': contacto,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }
}
