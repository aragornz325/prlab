import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/base/base.dart';
import 'package:prlab_commons/modelos/entregable/entregable.dart';
import 'package:serverpod/serverpod.dart';

part 'proyecto.mapper.dart';

/// Modelo de entidad Proyecto (que depende de la Organizacion y que contiene entregables).
@MappableClass()
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
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            idOrganizacion: json['id_organizacion'],
            nombre: json['nombre'],
            idAutor: json['id_autor'],
            fechaInicio: json['fecha_inicio'],
            fechaFin: json['fecha_fin'],
            fechaCreacion: json['fecha_creacion']);

  @MappableField(key: 'id_organizacion')
  int idOrganizacion;

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
