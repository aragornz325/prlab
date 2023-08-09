import 'package:dart_mappable/dart_mappable.dart';

part 'entregable.mapper.dart';

@MappableClass()
abstract class Entregable with EntregableMappable {
  @MappableConstructor()
  Entregable({
    required this.id,
    required this.idProyecto,
    required this.titulo,
    required this.subEntregables,
    required this.fechaCreacion,
  });
  
  @MappableField(key: 'id')
  int id;
  @MappableField(key: 'idProyecto')
  int idProyecto;
  @MappableField(key: 'titulo')
  String titulo;
  @MappableField(key: 'subEntregables')
  List<int> subEntregables;
  @MappableField(key: 'fechaCreacion')
  DateTime fechaCreacion;
}
