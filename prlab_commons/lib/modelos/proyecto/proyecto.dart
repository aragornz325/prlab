import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/entregable/entregable.dart';
import 'package:serverpod/serverpod.dart';

part 'proyecto.mapper.dart';

/// Modelo de entidad Proyecto (Tipo concreto de Entregable, de mayor nivel).
@MappableClass(ignoreNull: true)
class Proyecto extends Entregable with ProyectoMappable {
  @MappableConstructor()
  Proyecto({
    super.id,
    required this.idOrganizacion,
    required super.nombre,
    required super.idAutor,
    required super.fechaInicio,
    required super.fechaFin,
    super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase y su insercion
  /// en la Base de datos.
  @MappableConstructor()
  Proyecto.fromJson(
    Map<String, dynamic> jsonSerialization,
    SerializationManager serializationManager,
  ) : this(
          id: serializationManager.deserialize<int?>(jsonSerialization['id']),
          idOrganizacion: serializationManager
              .deserialize<int>(jsonSerialization['idOrganizacion']),
          nombre: serializationManager
              .deserialize<String>(jsonSerialization['nombre']),
          idAutor: serializationManager
              .deserialize<int>(jsonSerialization['idAutor']),
          fechaInicio: serializationManager
              .deserialize<DateTime>(jsonSerialization['fechaInicio']),
          fechaFin: serializationManager
              .deserialize<DateTime>(jsonSerialization['fechaFin']),
          fechaCreacion: serializationManager
              .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
        );

  /// ID de la Organizacion a la que pertenece el Proyecto.
  int idOrganizacion;

  /// Getter requerido por Serverpod con el nombre de la tabla correspondiente a la entidad.
  /// Extiende de la clase `TableRow` para manipular conexion con la Base de Datos.
  @override
  String get tableName => 'proyecto';

  /// Metodo requerido por Serverpod de la clase `TableRow` para modificar los datos dentro
  /// del objeto.
  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
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
      default:
        throw UnimplementedError();
    }
  }

  /// Metodo requerido por Serverpod de la clase `TableRow` para convertir el objeto en un `Map` (json), 
  /// para su inserción en la Base de Datos.
  @override
  Map<String, dynamic> toJsonForDatabase() {
    return jsonDecode(toJson());
  }
}
