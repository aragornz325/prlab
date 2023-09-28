/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Comentario extends _i1.SerializableEntity {
  Comentario({
    this.id,
    required this.idEntregable,
    required this.textoComentario,
    required this.idAutor,
    this.nombre,
    this.apellido,
    this.imageUrl,
    required this.completado,
    required this.idAutorCompletado,
    this.fechaCreacion,
    this.ultimaModificacion,
    this.compania,
  });

  factory Comentario.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Comentario(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      idEntregable: serializationManager
          .deserialize<int>(jsonSerialization['idEntregable']),
      textoComentario: serializationManager
          .deserialize<String>(jsonSerialization['textoComentario']),
      idAutor:
          serializationManager.deserialize<int>(jsonSerialization['idAutor']),
      nombre: serializationManager
          .deserialize<String?>(jsonSerialization['nombre']),
      apellido: serializationManager
          .deserialize<String?>(jsonSerialization['apellido']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
      completado: serializationManager
          .deserialize<bool>(jsonSerialization['completado']),
      idAutorCompletado: serializationManager
          .deserialize<int>(jsonSerialization['idAutorCompletado']),
      fechaCreacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['ultimaModificacion']),
      compania: serializationManager
          .deserialize<String?>(jsonSerialization['compania']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int idEntregable;

  String textoComentario;

  int idAutor;

  String? nombre;

  String? apellido;

  String? imageUrl;

  bool completado;

  int idAutorCompletado;

  DateTime? fechaCreacion;

  DateTime? ultimaModificacion;

  String? compania;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idEntregable': idEntregable,
      'textoComentario': textoComentario,
      'idAutor': idAutor,
      'nombre': nombre,
      'apellido': apellido,
      'imageUrl': imageUrl,
      'completado': completado,
      'idAutorCompletado': idAutorCompletado,
      'fechaCreacion': fechaCreacion,
      'ultimaModificacion': ultimaModificacion,
      'compania': compania,
    };
  }
}
