import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_server/src/modelos/entregable/entregable.dart';

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
    required this.categoria,
    required this.parents,
    required this.comentarios,
    required int id,
    required int idProyecto,
    required String titulo,
    required List<int> subEntregables,
    required DateTime fechaCreacion,
  }) : super(
          id: id,
          idProyecto: idProyecto,
          titulo: titulo,
          subEntregables: subEntregables,
          fechaCreacion: fechaCreacion,
        );
  
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
  List<int> status;
  @MappableField(key: 'categoria')
  List<int> categoria;
  @MappableField(key: 'padres')
  int parents;
  @MappableField(key: 'comentarios')
  int comentarios;


}
