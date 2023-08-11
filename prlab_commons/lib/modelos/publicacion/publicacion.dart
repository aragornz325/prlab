import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/entregable/entregable.dart';
import 'package:serverpod/serverpod.dart';

part 'publicacion.mapper.dart';

/// Modelo de entidad Publicacion (un tipo de Entregable).
@MappableClass()
class Publicacion extends Entregable with PublicacionMappable {
  
  @MappableConstructor()
  Publicacion({
    required super.id,
    required super.idProyecto,
    required super.titulo,
    required this.contenido,
    required this.idAutor,
    required this.idImagenes,
    required this.idImagenDestacada,
    required this.resumen,
    required this.idTags,
    required this.idStatus,
    required this.idCategorias,
    required this.idPadres,
    required this.idComentarios,
    required super.idSubEntregables,
    required super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Publicacion.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            idProyecto: json['idProyecto'],
            titulo: json['titulo'],
            contenido: json['contenido'],
            idAutor: json['idAutor'],
            idImagenes: json['idImagenes'],
            idImagenDestacada: json['idImagenDestacada'],
            resumen: json['resumen'],
            idTags: json['idTags'],
            idStatus: json['idStatus'],
            idCategorias: json['idCategorias'],
            idPadres: json['idPadres'],
            idComentarios: json['idComentarios'],
            idSubEntregables: json['idSubEntregables'],
            fechaCreacion: json['fechaCreacion']);
  
  @MappableField(key: 'contenido')
  String contenido;
  @MappableField(key: 'idAutor')
  int idAutor;
  @MappableField(key: 'idImagenes')
  List<int> idImagenes;
  @MappableField(key: 'imagenDestacada')
  int idImagenDestacada;
  @MappableField(key: 'resumen')
  String resumen;
  @MappableField(key: 'idTags')
  List<int> idTags;
  @MappableField(key: 'idStatus')
  int idStatus;
  @MappableField(key: 'idCategorias')
  List<int> idCategorias;
  @MappableField(key: 'idPadres')
  int idPadres;
  @MappableField(key: 'idComentarios')
  int idComentarios;


}
