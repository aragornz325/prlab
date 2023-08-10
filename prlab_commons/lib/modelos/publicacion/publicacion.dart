import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/entregable/entregable.dart';

part 'publicacion.mapper.dart';

@MappableClass()
class Publicacion extends Entregable with PublicacionMappable {
  
  @MappableConstructor()
  Publicacion({
    required this.contenido,
    required this.autor,
    required this.imagenes,
    required this.imagenDestacada,
    required this.resumen,
    required this.tags,
    required this.status,
    required this.idCategorias,
    required this.parents,
    required this.comentarios,
    required super.id,
    required super.idProyecto,
    required super.titulo,
    required super.idSubEntregables,
    required super.fechaCreacion,
  });
  
  @MappableField(key: 'contenido')
  String contenido;
  @MappableField(key: 'autor')
  int autor;
  @MappableField(key: 'imagenes')
  List<String> imagenes;
  @MappableField(key: 'imagenDestacada')
  String imagenDestacada;
  @MappableField(key: 'resumen')
  String resumen;
  @MappableField(key: 'tags')
  List<String> tags;
  @MappableField(key: 'status')
  int status;
  @MappableField(key: 'categoria')
  List<int> idCategorias;
  @MappableField(key: 'padres')
  int parents;
  @MappableField(key: 'comentarios')
  int comentarios;


}
