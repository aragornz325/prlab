import 'package:dart_mappable/dart_mappable.dart';

part 'organizacion.mapper.dart';

@MappableClass()
class Organizacion with OrganizacionMappable {
  @MappableConstructor()
  Organizacion({
    required this.id,
    required this.nombre,
    required this.tipo,
    required this.contacto,
    required this.miembros,
    required this.proyectos,
    required this.fechaCreacion,
  });

  @MappableField(key: 'id')
  int id;
  @MappableField(key: 'nombre')
  String nombre;
  @MappableField(key: 'tipo')
  int tipo;
  @MappableField(key: 'contacto')
  int contacto;
  @MappableField(key: 'miembros')
  List<int> miembros;
  @MappableField(key: 'proyectos')
  List<int> proyectos;
  @MappableField(key: 'fechaCreacion')
  DateTime fechaCreacion;
}
