import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

part 'organizacion.mapper.dart';

/// Modelo de entidad Organizacion (que posee los proyectos).
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

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Organizacion.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            nombre: json['nombre'],
            tipo: json['tipo'],
            contacto: json['contacto'],
            idMiembros: json['idMiembros'],
            idProyectos: json['idProyectos'],
            fechaCreacion: json['fechaCreacion']);

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
