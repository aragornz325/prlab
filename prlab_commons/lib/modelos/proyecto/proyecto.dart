import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/entregable/entregable.dart';
import 'package:serverpod/serverpod.dart';

part 'proyecto.mapper.dart';

/// Modelo de entidad Proyecto (que depende de la Organizacion y que contiene entregables).
@MappableClass(ignoreNull: true)
class Proyecto extends Entregable with ProyectoMappable {
  @MappableConstructor()
  Proyecto({
    super.id,
    required this.idOrganizacion,
    required super.nombre,
    required super.idAutor,
    super.fechaInicio,
    super.fechaFin,
    super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Proyecto.fromJson(
    Map<String, dynamic> jsonSerialization,
    SerializationManager serializationManager,
  ) : this(
          id: serializationManager.deserialize<int?>(jsonSerialization['id']),
          idOrganizacion: serializationManager
              .deserialize<int?>(jsonSerialization['idOrganizacion']),
          nombre: serializationManager
              .deserialize<String?>(jsonSerialization['nombre']),
          idAutor: serializationManager
              .deserialize<int?>(jsonSerialization['idAutor']),
          fechaInicio: serializationManager
              .deserialize<DateTime?>(jsonSerialization['fechaInicio']),
          fechaFin: serializationManager
              .deserialize<DateTime?>(jsonSerialization['fechaFin']),
          fechaCreacion: serializationManager
              .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
        );

  int? idOrganizacion;

  @override
  String get tableName => 'proyecto';

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'idOrganizacion':
        idOrganizacion = value;
        return;
      case 'nombre':
        nombre = value;
        return;
      case 'idAutor':
        idAutor = value;
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
