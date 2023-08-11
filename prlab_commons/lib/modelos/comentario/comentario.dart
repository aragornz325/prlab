import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

part 'comentario.mapper.dart';

/// Modelo de entidad Comentario (dentro de publicaciones u otros entregables).
@MappableClass()
class Comentario with ComentarioMappable {
  @MappableConstructor()
  Comentario({
    required this.id,
    required this.idPublicacion,
    required this.offset,
    required this.comentario,
    required this.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Comentario.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            idPublicacion: json['idPublicacion'],
            offset: json['offset'],
            comentario: json['comentario'],
            fechaCreacion: json['fechaCreacion']);

  @MappableField(key: 'id')
  int id;
  @MappableField(key: 'idPublicacion')
  int idPublicacion;
  @MappableField(key: 'offset')
  Set<double> offset;
  @MappableField(key: 'comentario')
  String comentario;
  @MappableField(key: 'fechaCreacion')
  DateTime fechaCreacion;
}
