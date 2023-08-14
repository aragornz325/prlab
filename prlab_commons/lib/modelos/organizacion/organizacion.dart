import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

part 'organizacion.mapper.dart';

/// Modelo de entidad Organizacion (que posee los proyectos).
@MappableClass(ignoreNull: true)
class Organizacion extends TableRow with OrganizacionMappable {
  @MappableConstructor()
  Organizacion({
    int? id,
    required this.nombre,
    required this.tipo,
    required this.contacto,
    this.fechaCreacion,
  }) : super(id);

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
            fechaCreacion: serializationManager.deserialize<DateTime?>(jsonSerialization['fechaCreacion']),);

  @MappableField(key: 'nombre')
  String? nombre;
  @MappableField(key: 'tipo')
  int? tipo;
  @MappableField(key: 'contacto')
  int? contacto;
  @MappableField(key: 'fecha_creacion')
  DateTime? fechaCreacion;

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