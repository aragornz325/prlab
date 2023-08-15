import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/entregable/entregable.dart';
import 'package:serverpod/serverpod.dart';

part 'publicacion.mapper.dart';

/// Modelo de entidad Publicacion (un tipo de Entregable).
@MappableClass(ignoreNull: true)
class Publicacion extends Entregable with PublicacionMappable {
  @MappableConstructor()
  Publicacion({
    required super.id,
    required this.idProyecto,
    required super.nombre,
    required this.contenido,
    required super.idAutor,
    required this.resumen,
    required this.idTags,
    required this.idStatus,
    required this.idCategorias,
    required super.fechaInicio,
    required super.fechaFin,
    required super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Publicacion.fromJson(
    Map<String, dynamic> jsonSerialization,
    SerializationManager serializationManager,
  ) : this(
          id: serializationManager.deserialize<int?>(jsonSerialization['id']),
          idProyecto:
              serializationManager.deserialize<int?>(jsonSerialization['idProyecto']),
          nombre:
              serializationManager.deserialize<String?>(jsonSerialization['nombre']),
          contenido:
              serializationManager.deserialize<String?>(jsonSerialization['contenido']),
          idAutor:
              serializationManager.deserialize<int?>(jsonSerialization['idAutor']),
          resumen:
              serializationManager.deserialize<String?>(jsonSerialization['resumen']),
          idTags:
              serializationManager.deserialize<List<int>?>(jsonSerialization['idTags']),
          idStatus:
              serializationManager.deserialize<int?>(jsonSerialization['idStatus']),
          idCategorias:
              serializationManager.deserialize<List<int>?>(jsonSerialization['idCategorias']),
          fechaInicio:
              serializationManager.deserialize<DateTime?>(jsonSerialization['fechaInicio']),
          fechaFin:
              serializationManager.deserialize<DateTime?>(jsonSerialization['fechaFin']),
          fechaCreacion:
              serializationManager.deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
        );

  int? idProyecto;
  String? contenido;
  String? resumen;
  List<int>? idTags;
  int? idStatus;
  List<int>? idCategorias;

  @override
  String get tableName => 'publicacion';

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'idProyecto':
        idProyecto = value;
        return;
      case 'nombre':
        nombre = value;
        return;
      case 'contenido':
        contenido = value;
        return;
      case 'idAutor':
        idAutor = value;
        return;
      case 'resumen':
        resumen = value;
        return;
      case 'idTags':
        idTags = value;
        return;
      case 'idStatus':
        idStatus = value;
        return;
      case 'idCategorias':
        idCategorias = value;
        return;
      case 'fechaInicio':
        fechaInicio = value;
        return;
      case 'fechaFin':
        fechaFin = value;
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
