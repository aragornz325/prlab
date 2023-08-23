import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_server/src/modelos/base/base.dart';
import 'package:serverpod/serverpod.dart';

part 'comentario.mapper.dart';

/// Modelo de entidad Comentario (realizado dentro de un Entregable).
@MappableClass(ignoreNull: true)
class Comentario extends ModeloBase with ComentarioMappable {
  @MappableConstructor()
  Comentario({
    super.id,
    required this.idEntregable,
    required this.textoComentario,
    required this.idAutor,
    super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase y su insercion
  /// en la Base de datos.
  @MappableConstructor()
  Comentario.fromJson(
    Map<String, dynamic> jsonSerialization,
    SerializationManager serializationManager,
  ) : this(
          id: serializationManager.deserialize<int?>(jsonSerialization['id']),
          idEntregable: serializationManager
              .deserialize<int?>(jsonSerialization['idEntregable']),
          textoComentario: serializationManager
              .deserialize<String?>(jsonSerialization['textoComentario']),
          idAutor: serializationManager
              .deserialize<int?>(jsonSerialization['idAutor']),
          fechaCreacion: serializationManager
              .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
        );

  /// ID del Entregable al que corresponde el Comentario.
  int? idEntregable;

  /// Texto contenido en el Comentario.
  String? textoComentario;

  /// ID del Usuario que crea el comentario.
  int? idAutor;

  /// Getter requerido por Serverpod con el nombre de la tabla correspondiente a la entidad.
  /// Extiende de la clase `TableRow` para manipular conexion con la Base de Datos.
  @override
  String get tableName => 'comentario';

  /// Metodo requerido por Serverpod de la clase `TableRow` para modificar los datos dentro
  /// del objeto.
  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'idEntregable':
        idEntregable = value;
        return;
      case 'textoComentario':
        textoComentario = value;
        return;
      case 'idAutor':
        idAutor = value;
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

  @override
  allToJson() {
    return jsonDecode(toJson());
  }
  
  

}
