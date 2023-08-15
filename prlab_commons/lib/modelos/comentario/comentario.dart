import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/base/base.dart';
import 'package:serverpod/serverpod.dart';

part 'comentario.mapper.dart';

/// Modelo de entidad Comentario (dentro de publicaciones u otros entregables).
@MappableClass()
class Comentario extends Base with ComentarioMappable {
  @MappableConstructor()
  Comentario({
    super.id,
    required this.idEntregable,
    required this.offset,
    required this.comentario,
    super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Comentario.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            idEntregable: json['id_entregable'],
            offset: json['offset'],
            comentario: json['comentario'],
            fechaCreacion: json['fecha_creacion']);

  @MappableField(key: 'id_entregable')
  int idEntregable;
  @MappableField(key: 'offset')
  Set<double> offset;
  @MappableField(key: 'comentario')
  String comentario;

  @override
  String get tableName => 'comentario';

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'idEntregable':
        idEntregable = value;
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
