import 'package:dart_mappable/dart_mappable.dart';

part 'cliente.mapper.dart';

@MappableClass()
class Cliente with ClienteMappable {
  @MappableConstructor()
  Cliente({
    required this.id,
    required this.nombre,
    required this.idOrganizacion,
    required this.contacto,
    required this.fechaCreacion,
  });

  @MappableField(key: 'id')
  int id;
  @MappableField(key: 'nombre')
  String nombre;
  @MappableField(key: 'idOrganizacion')
  int idOrganizacion;
  @MappableField(key: 'contacto')
  int contacto;
  @MappableField(key: 'fechaCreacion')
  DateTime fechaCreacion;
}
