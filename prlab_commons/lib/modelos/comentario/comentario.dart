import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/base/base.dart';
import 'package:serverpod/serverpod.dart';

part 'comentario.mapper.dart';

/// Modelo de entidad Comentario (dentro de publicaciones u otros entregables).
@MappableClass(ignoreNull: true)
class Comentario extends Base with ComentarioMappable {
  @MappableConstructor()
  Comentario({
    super.id,
    required this.idEntregable,
    // required this.offset,
    required this.textoComentario,
    super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Comentario.fromJson(
    Map<String, dynamic> jsonSerialization,
    SerializationManager serializationManager,
  ) : this(
          id: serializationManager.deserialize<int?>(jsonSerialization['id']),
          idEntregable: serializationManager
              .deserialize<int?>(jsonSerialization['idEntregable']),
          // offset: serializationManager.deserialize<Set<double>?>(jsonSerialization['offset']),
          textoComentario: serializationManager
              .deserialize<String?>(jsonSerialization['textoComentario']),
          fechaCreacion: serializationManager
              .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
        );

  int? idEntregable;
  // Set<double>? offset;
  String? textoComentario;

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
      // case 'offset':
      //   offset = value;
      //   return;
      case 'textoComentario':
        textoComentario = value;
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
