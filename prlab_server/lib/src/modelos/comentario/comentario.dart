import 'package:dart_mappable/dart_mappable.dart';

part 'comentario.mapper.dart';

@MappableClass()
class Comentario with ComentarioMappable {

@MappableConstructor()
  Comentario({
    required this.id,
    required this.idPublicacion,
    required this.offset,
    required this.comentario,
    required this.fechaCreacion,
  });


@MappableField(key: 'id')
int id;
@MappableField(key: 'idPublicacion')
int idPublicacion;
@MappableField(key: 'offset')
int offset;
@MappableField(key: 'comentario')
String comentario;
@MappableField(key: 'fechaCreacion')
DateTime fechaCreacion;


}

