import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

part 'comentario.mapper.dart';

/// Modelo de entidad Comentario (dentro de publicaciones u otros entregables).
@MappableClass()
class Comentario extends TableRow with ComentarioMappable {
  @MappableConstructor()
  Comentario({
    int? id,
    required this.idPublicacion,
    required this.offset,
    required this.comentario,
    required this.fechaCreacion,
  }) : super(id);

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Comentario.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            idPublicacion: json['idPublicacion'],
            offset: json['offset'],
            comentario: json['comentario'],
            fechaCreacion: json['fechaCreacion']);

  @MappableField(key: 'idPublicacion')
  int idPublicacion;
  @MappableField(key: 'offset')
  Set<double> offset;
  @MappableField(key: 'comentario')
  String comentario;
  @MappableField(key: 'fecha_creacion')
  DateTime fechaCreacion;

  @override
  String get tableName => 'comentario';

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'idPublicacion':
        idPublicacion = value;
        return;
      case 'offset':
        offset = value;
        return;
      case 'comentario':
        comentario = value;
        return;
      case 'fechaCreacion':
        fechaCreacion = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return jsonDecode(toJson());
  }
}
