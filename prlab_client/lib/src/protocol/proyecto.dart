/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Proyecto extends _i1.SerializableEntity {
  Proyecto({
    this.id,
    required this.nombre,
    required this.descripcion,
    this.idOrganizacion,
    required this.fechaInicio,
    required this.fechaFin,
    this.fechaEliminacion,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  });

  factory Proyecto.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Proyecto(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      nombre:
          serializationManager.deserialize<String>(jsonSerialization['nombre']),
      descripcion: serializationManager
          .deserialize<String>(jsonSerialization['descripcion']),
      idOrganizacion: serializationManager
          .deserialize<int?>(jsonSerialization['idOrganizacion']),
      fechaInicio: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaInicio']),
      fechaFin: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaFin']),
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

  String nombre;

  String descripcion;

  int? idOrganizacion;

  DateTime fechaInicio;

  DateTime fechaFin;

  DateTime? fechaEliminacion;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'idOrganizacion': idOrganizacion,
      'fechaInicio': fechaInicio,
      'fechaFin': fechaFin,
      'fechaEliminacion': fechaEliminacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }
}
