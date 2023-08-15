import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/base/base.dart';
import 'package:serverpod/serverpod.dart';

part 'entregable.mapper.dart';

/// Modelo de entidad Entregable (Abstracción para heredar a otras clases como Publicacion, curso, etc).
@MappableClass()
abstract class Entregable extends Base with EntregableMappable {
  @MappableConstructor()
  Entregable({
    super.id,
    required this.nombre,
    required this.idAutor,
    this.fechaInicio,
    this.fechaFin,
    super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Entregable.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            nombre: json['nombre'],
            idAutor: json['id_autor'],
            fechaInicio: json['fecha_inicio'],
            fechaFin: json['fecha_fin'],
            fechaCreacion: json['fecha_creacion']);

  @MappableField(key: 'nombre')
  String nombre;
  @MappableField(key: 'id_autor')
  int idAutor;
  @MappableField(key: 'fecha_inicio')
  int? fechaInicio;
  @MappableField(key: 'fecha_fin')
  int? fechaFin;
}
