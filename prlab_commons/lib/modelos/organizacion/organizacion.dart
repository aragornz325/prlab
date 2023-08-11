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
    required this.idMiembros,
    required this.idProyectos,
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
  @MappableField(key: 'idMiembros')
  List<int> idMiembros;
  @MappableField(key: 'idProyectos')
  List<int> idProyectos;
  @MappableField(key: 'fechaCreacion')
  DateTime fechaCreacion;
}

