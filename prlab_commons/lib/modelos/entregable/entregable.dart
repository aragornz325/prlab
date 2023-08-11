import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

part 'entregable.mapper.dart';

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
