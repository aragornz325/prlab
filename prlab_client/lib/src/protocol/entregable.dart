/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Entregable extends _i1.SerializableEntity {
  Entregable({
    this.id,
    required this.nombre,
    this.idAutor,
    required this.fechaInicio,
    required this.fechaFin,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  });

  factory Entregable.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Entregable(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      nombre:
          serializationManager.deserialize<String>(jsonSerialization['nombre']),
      idAutor:
          serializationManager.deserialize<int?>(jsonSerialization['idAutor']),
      fechaInicio: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaInicio']),
      fechaFin: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaFin']),
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

  int? idAutor;

  DateTime fechaInicio;

  DateTime fechaFin;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'idAutor': idAutor,
      'fechaInicio': fechaInicio,
      'fechaFin': fechaFin,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }
}
