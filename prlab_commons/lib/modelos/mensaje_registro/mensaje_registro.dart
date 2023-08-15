import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/base/base.dart';
import 'package:serverpod/serverpod.dart';

part 'mensaje_registro.mapper.dart';

/// Modelo de entidad MensajeRegistro (logs de actividad).
@MappableClass(ignoreNull: true)
class MensajeRegistro extends Base with MensajeRegistroMappable {
  @MappableConstructor()
  MensajeRegistro(
      {super.id,
      required this.mensaje,
      required this.idAutor,
      super.fechaCreacion});

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  MensajeRegistro.fromJson(
    Map<String, dynamic> jsonSerialization,
    SerializationManager serializationManager,
  ) : this(
            id: serializationManager.deserialize<int?>(jsonSerialization['id']),
            mensaje: serializationManager
                .deserialize<String>(jsonSerialization['mensaje']),
            idAutor: serializationManager
                .deserialize<int>(jsonSerialization['idAutor']),
            fechaCreacion: serializationManager
                .deserialize<DateTime?>(jsonSerialization['fechaCreacion']));

  String mensaje;
  int idAutor;

  @override
  String get tableName => 'mensaje_registro';

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'mensaje':
        mensaje = value;
        return;
      case 'idAutor':
        idAutor = value;
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
