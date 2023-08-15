import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/base/base.dart';
import 'package:prlab_commons/prlab_commons.dart';
import 'package:serverpod/serverpod.dart';

part 'organizacion.mapper.dart';

/// Modelo de entidad Organizacion (que posee los proyectos).
@MappableClass(ignoreNull: true)
class Organizacion extends Cliente with OrganizacionMappable {
  @MappableConstructor()
  Organizacion({
    super.id,
    required super.nombre,
    required this.tipo,
    required super.contacto,
    super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Organizacion.fromJson(
    Map<String, dynamic> jsonSerialization,
    SerializationManager serializationManager,
  ) : this(
            id: serializationManager.deserialize<int?>(jsonSerialization['id']),
            nombre: serializationManager.deserialize<String?>(jsonSerialization['nombre']),
            tipo: serializationManager.deserialize<int?>(jsonSerialization['tipo']),
            contacto: serializationManager.deserialize<int?>(jsonSerialization['contacto']),
            fechaCreacion: serializationManager.deserialize<DateTime?>(jsonSerialization['fecha_creacion']),);

  @MappableField(key: 'tipo')
  int? tipo;

  @override
  String get tableName => 'organizacion';

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'nombre':
        nombre = value;
        return;
      case 'tipo':
        tipo = value;
        return;
      case 'contacto':
        contacto = value;
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