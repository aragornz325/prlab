import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/entregable/entregable.dart';
import 'package:serverpod/serverpod.dart';

part 'publicacion.mapper.dart';

/// Modelo de entidad Publicacion (un tipo concreto de Entregable por dentro de Proyecto).
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
    required this.idStatus,
    required super.fechaInicio,
    required super.fechaFin,
    required super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase y su insercion
  /// en la Base de datos.
  @MappableConstructor()
  Publicacion.fromJson(
    Map<String, dynamic> jsonSerialization,
    SerializationManager serializationManager,
  ) : this(
          id: serializationManager.deserialize<int?>(jsonSerialization['id']),
          idProyecto:
              serializationManager.deserialize<int>(jsonSerialization['idProyecto']),
          nombre:
              serializationManager.deserialize<String>(jsonSerialization['nombre']),
          contenido:
              serializationManager.deserialize<String>(jsonSerialization['contenido']),
          idAutor:
              serializationManager.deserialize<int>(jsonSerialization['idAutor']),
          resumen:
              serializationManager.deserialize<String>(jsonSerialization['resumen']),
          idStatus:
              serializationManager.deserialize<int>(jsonSerialization['idStatus']),
          fechaInicio:
              serializationManager.deserialize<DateTime>(jsonSerialization['fechaInicio']),
          fechaFin:
              serializationManager.deserialize<DateTime>(jsonSerialization['fechaFin']),
          fechaCreacion:
              serializationManager.deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
        );

  /// ID del Proyecto al que corresponde la Publicacion.
  int idProyecto;

  /// Contenido de la Publicacion.
  String contenido;

  /// Texto resumen de la Publicacion.
  String resumen;

  /// Estado de la Publicacion (En proceso, terminada, etc)
  int idStatus;

  /// Getter requerido por Serverpod con el nombre de la tabla correspondiente a la entidad.
  /// Extiende de la clase `TableRow` para manipular conexion con la Base de Datos.
  @override
  String get tableName => 'publicacion';

  /// Metodo requerido por Serverpod de la clase `TableRow` para modificar los datos dentro
  /// del objeto.
  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
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
      case 'idStatus':
        idStatus = value;
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
