/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class EntregableArticulo extends _i1.SerializableEntity {
  EntregableArticulo({
    this.id,
    required this.titulo,
    this.contenido,
    this.contenidoHtml,
    this.idProyecto,
    this.idMarca,
    this.idAutor,
    this.idStatus,
    required this.ultimaModificacion,
    required this.fechaLanzamiento,
    this.fechaPublicacion,
    this.idPlataforma,
  });

  factory EntregableArticulo.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EntregableArticulo(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      titulo:
          serializationManager.deserialize<String>(jsonSerialization['titulo']),
      contenido: serializationManager
          .deserialize<String?>(jsonSerialization['contenido']),
      contenidoHtml: serializationManager
          .deserialize<String?>(jsonSerialization['contenidoHtml']),
      idProyecto: serializationManager
          .deserialize<int?>(jsonSerialization['idProyecto']),
      idMarca:
          serializationManager.deserialize<int?>(jsonSerialization['idMarca']),
      idAutor:
          serializationManager.deserialize<int?>(jsonSerialization['idAutor']),
      idStatus:
          serializationManager.deserialize<int?>(jsonSerialization['idStatus']),
      ultimaModificacion: serializationManager
          .deserialize<DateTime>(jsonSerialization['ultimaModificacion']),
      fechaLanzamiento: serializationManager
          .deserialize<DateTime>(jsonSerialization['fechaLanzamiento']),
      fechaPublicacion: serializationManager
          .deserialize<DateTime?>(jsonSerialization['fechaPublicacion']),
      idPlataforma: serializationManager
          .deserialize<int?>(jsonSerialization['idPlataforma']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String titulo;

  String? contenido;

  String? contenidoHtml;

  int? idProyecto;

  int? idMarca;

  int? idAutor;

  int? idStatus;

  DateTime ultimaModificacion;

  DateTime fechaLanzamiento;

  DateTime? fechaPublicacion;

  int? idPlataforma;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'contenido': contenido,
      'contenidoHtml': contenidoHtml,
      'idProyecto': idProyecto,
      'idMarca': idMarca,
      'idAutor': idAutor,
      'idStatus': idStatus,
      'ultimaModificacion': ultimaModificacion,
      'fechaLanzamiento': fechaLanzamiento,
      'fechaPublicacion': fechaPublicacion,
      'idPlataforma': idPlataforma,
    };
  }
}
