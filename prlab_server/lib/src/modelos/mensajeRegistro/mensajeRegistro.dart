import 'package:dart_mappable/dart_mappable.dart';

part 'mensajeRegistro.mapper.dart';

@MappableClass()
class MensajeRegistro with MensajeRegistroMappable {
  
  @MappableConstructor()
  MensajeRegistro({
    required this.id,
    required this.mensaje,
    required this.autor,
    required this.fechaCreacion,
  });
  
  @MappableField(key: 'id')
  int id;
  @MappableField(key: 'mensaje')
  String mensaje;
  @MappableField(key: 'autor')
  int autor;
  @MappableField(key: 'fechaCreacion')
  DateTime fechaCreacion;

  
}
