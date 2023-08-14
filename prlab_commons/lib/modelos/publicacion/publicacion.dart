import 'dart:convert';

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
  @MappableField(key: 'idImagenDestacada')
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

  @override
  String get tableName => 'publicacion';

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
      case 'contenido':
        contenido = value;
        return;
      case 'idAutor':
        idAutor = value;
        return;
      case 'idImagenes':
        idImagenes = value;
        return;
      case 'idImagenDestacada':
        idImagenDestacada = value;
        return;
      case 'resumen':
        resumen = value;
        return;
      case 'idTags':
        idTags = value;
        return;
      case 'idStatus':
        idStatus = value;
        return;
      case 'idCategorias':
        idCategorias = value;
        return;
      case 'idPadres':
        idPadres = value;
        return;
      case 'idComentarios':
        idComentarios = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return jsonDecode(toJson());
  }
}
