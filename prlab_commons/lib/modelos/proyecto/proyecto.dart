import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

part 'proyecto.mapper.dart';

/// Modelo de entidad Proyecto (que depende de la Organizacion y que contiene entregables).
@MappableClass()
class Proyecto extends TableRow with ProyectoMappable {
  @MappableConstructor()
  Proyecto({
    int? id,
    required this.idOrganizacion,
    required this.nombre,
    required this.idEntregables,
    required this.fechaCreacion,
  }) : super(id);

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

  @MappableField(key: 'idOrganizacion')
  int idOrganizacion;
  @MappableField(key: 'nombre')
  String nombre;
  @MappableField(key: 'idEntregables')
  List<int> idEntregables;
  @MappableField(key: 'fecha_creacion')
  DateTime fechaCreacion;

  @override
  String get tableName => 'proyecto';

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'idOrganizacion':
        idOrganizacion = value;
        return;
      case 'nombre':
        nombre = value;
        return;
      case 'idEntregables':
        idEntregables = value;
        return;
      case 'fechaCreacion':
        fechaCreacion = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'idOrganizacion': idOrganizacion,
      'nombre': nombre,
      'idEntregables': idEntregables,
      'fechaCreacion': fechaCreacion,
    };
  }
}
