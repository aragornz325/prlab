import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

part 'entregable.mapper.dart';

/// Modelo de entidad Entregable (Abstracción para heredar a otras clases como Publicacion, curso, etc).
@MappableClass()
abstract class Entregable with EntregableMappable {
  @MappableConstructor()
  Entregable({
    required this.id,
    required this.idProyecto,
    required this.titulo,
    required this.idSubEntregables,
    required this.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Entregable.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            idProyecto: json['idProyecto'],
            titulo: json['titulo'],
            idSubEntregables: json['idSubEntregables'],
            fechaCreacion: json['fechaCreacion']);

  @MappableField(key: 'id')
  int id;
  @MappableField(key: 'idProyecto')
  int idProyecto;
  @MappableField(key: 'titulo')
  String titulo;
  @MappableField(key: 'idSubEntregables')
  List<int> idSubEntregables;
  @MappableField(key: 'fechaCreacion')
  DateTime fechaCreacion;
}
