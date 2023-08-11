import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

part 'proyecto.mapper.dart';

/// Modelo de entidad Proyecto (que depende de la Organizacion y que contiene entregables).
@MappableClass()
class Proyecto with ProyectoMappable {
  @MappableConstructor()
  Proyecto({
    required this.id,
    required this.idOrganizacion,
    required this.nombre,
    required this.idEntregables,
    required this.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Proyecto.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            idOrganizacion: json['idOrganizacion'],
            nombre: json['nombre'],
            idEntregables: json['idEntregables'],
            fechaCreacion: json['fechaCreacion']);

  @MappableField(key: 'id')
  int id;
  @MappableField(key: 'idOrganizacion')
  int idOrganizacion;
  @MappableField(key: 'nombre')
  String nombre;
  @MappableField(key: 'idEntregables')
  List<int> idEntregables;
  @MappableField(key: 'fechaCreacion')
  DateTime fechaCreacion;
}
