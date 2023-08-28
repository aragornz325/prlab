/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Publicacion extends _i1.SerializableEntity {
  Publicacion({
    this.id,
    required this.titulo,
    this.idProyecto,
    this.idAutor,
    this.idStatus,
    this.fechaEliminacion,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  });

  factory Publicacion.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Publicacion(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      titulo:
          serializationManager.deserialize<String>(jsonSerialization['titulo']),
      idProyecto: serializationManager
          .deserialize<int?>(jsonSerialization['idProyecto']),
      idAutor:
          serializationManager.deserialize<int?>(jsonSerialization['idAutor']),
      idStatus:
          serializationManager.deserialize<int?>(jsonSerialization['idStatus']),
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

  String titulo;

  int? idProyecto;

  int? idAutor;

  int? idStatus;

  DateTime? fechaEliminacion;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'idProyecto': idProyecto,
      'idAutor': idAutor,
      'idStatus': idStatus,
      'fechaEliminacion': fechaEliminacion,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }
}
