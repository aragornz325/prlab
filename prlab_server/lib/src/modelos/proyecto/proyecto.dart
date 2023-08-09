import 'package:dart_mappable/dart_mappable.dart';

part 'proyecto.mapper.dart';

@MappableClass()
class Proyecto with ProyectoMappable {
  @MappableConstructor()
  Proyecto({
    required this.id,
    required this.idOrganizacion,
    required this.nombre,
    required this.entregables,
    required this.fechaCreacion,
  });

  @MappableField(key: 'id')
  int id;
  @MappableField(key: 'idOrganizacion')
  int idOrganizacion;
  @MappableField(key: 'nombre')
  String nombre;
  @MappableField(key: 'entregables')
  List<int> entregables;
  @MappableField(key: 'fechaCreacion')
  final DateTime fechaCreacion;
}
