import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

part 'mensaje_registro.mapper.dart';

@MappableClass()
class MensajeRegistro with MensajeRegistroMappable {
  @MappableConstructor()
  MensajeRegistro({
    required this.id,
    required this.mensaje,
    required this.autor,
    required this.fechaCreacion,
  });

  @MappableConstructor()
  MensajeRegistro.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            mensaje: json['mensaje'],
            autor: json['autor'],
            fechaCreacion: json['fechaCreacion']);

  @MappableField(key: 'id')
  int id;
  @MappableField(key: 'mensaje')
  String mensaje;
  @MappableField(key: 'autor')
  int autor;
  @MappableField(key: 'fechaCreacion')
  DateTime fechaCreacion;
}
