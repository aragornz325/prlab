import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

part 'entregable.mapper.dart';

/// Modelo de entidad Entregable (Abstracción para heredar a otras clases como Publicacion, curso, etc).
@MappableClass()
abstract class Entregable extends TableRow with EntregableMappable {
  @MappableConstructor()
  Entregable({
    int? id,
    required this.idProyecto,
    required this.titulo,
    required this.idSubEntregables,
    required this.fechaCreacion,
  }) : super(id);

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Entregable.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            idProyecto: json['idProyecto'],
            titulo: json['titulo'],
            idSubEntregables: json['idSubEntregables'],
            fechaCreacion: json['fechaCreacion']);

  @MappableField(key: 'idProyecto')
  int idProyecto;
  @MappableField(key: 'titulo')
  String titulo;
  @MappableField(key: 'idSubEntregables')
  List<int> idSubEntregables;
  @MappableField(key: 'fecha_creacion')
  DateTime fechaCreacion;

  @override
  String get tableName => 'entregable';

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'idProyecto':
        idProyecto = value;
        return;
      case 'titulo':
        titulo = value;
        return;
      case 'idSubEntregables':
        idSubEntregables = value;
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
      'idProyecto': idProyecto,
      'titulo': titulo,
      'idSubEntregables': idSubEntregables,
      'fechaCreacion': fechaCreacion,
    };
  }
}
