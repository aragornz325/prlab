/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Articulo extends _i1.SerializableEntity {
  Articulo({
    this.id,
    required this.titulo,
    this.contenido,
    this.idProyecto,
    this.idAutor,
    this.idStatus,
    required this.ultimaModificacion,
    required this.fechaCreacion,
  });

  factory Articulo.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Articulo(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      titulo:
          serializationManager.deserialize<String>(jsonSerialization['titulo']),
      contenido: serializationManager
          .deserialize<String?>(jsonSerialization['contenido']),
      idProyecto: serializationManager
          .deserialize<int?>(jsonSerialization['idProyecto']),
      idAutor:
          serializationManager.deserialize<int?>(jsonSerialization['idAutor']),
      idStatus:
          serializationManager.deserialize<int?>(jsonSerialization['idStatus']),
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

  String? contenido;

  int? idProyecto;

  int? idAutor;

  int? idStatus;

  DateTime ultimaModificacion;

  DateTime fechaCreacion;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'contenido': contenido,
      'idProyecto': idProyecto,
      'idAutor': idAutor,
      'idStatus': idStatus,
      'ultimaModificacion': ultimaModificacion,
      'fechaCreacion': fechaCreacion,
    };
  }
}
