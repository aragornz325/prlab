import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/base/base.dart';
import 'package:serverpod/serverpod.dart';

part 'mensaje_registro.mapper.dart';

/// Modelo de entidad MensajeRegistro (logs de actividad).
@MappableClass()
class MensajeRegistro extends Base with MensajeRegistroMappable {
  @MappableConstructor()
  MensajeRegistro({
    super.id,
    required this.mensaje,
    required this.idAutor,
    super.fechaCreacion
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  MensajeRegistro.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            mensaje: json['mensaje'],
            idAutor: json['id_autor'],
            fechaCreacion: json['fecha_creacion']);

  @MappableField(key: 'mensaje')
  String mensaje;
  @MappableField(key: 'id_autor')
  int idAutor;

  @override
  String get tableName => 'mensaje_registro';

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'mensaje':
        mensaje = value;
        return;
      case 'idAutor':
        idAutor = value;
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
      'mensaje': mensaje,
      'autor': idAutor,
      'fechaCreacion': fechaCreacion,
    };
  }
}
