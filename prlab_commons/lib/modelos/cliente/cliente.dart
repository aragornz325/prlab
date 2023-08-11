import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

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

  @MappableConstructor()
  Cliente.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            nombre: json['nombre'],
            idOrganizacion: json['idOrganizacion'],
            contacto: json['contacto'],
            fechaCreacion: json['fechaCreacion']);

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
