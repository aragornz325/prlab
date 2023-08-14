import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

part 'mensaje_registro.mapper.dart';

/// Modelo de entidad MensajeRegistro (logs de actividad).
@MappableClass()
class MensajeRegistro extends TableRow with MensajeRegistroMappable {
  @MappableConstructor()
  MensajeRegistro({
    int? id,
    required this.mensaje,
    required this.autor,
    required this.fechaCreacion,
  }) : super(id);

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  MensajeRegistro.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            mensaje: json['mensaje'],
            autor: json['autor'],
            fechaCreacion: json['fechaCreacion']);

  @MappableField(key: 'mensaje')
  String mensaje;
  @MappableField(key: 'autor')
  int autor;
  @MappableField(key: 'fechaCreacion')
  DateTime fechaCreacion;

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
      case 'autor':
        autor = value;
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
    return {
      'id': id,
      'mensaje': mensaje,
      'autor': autor,
      'fechaCreacion': fechaCreacion,
    };
  }
}
