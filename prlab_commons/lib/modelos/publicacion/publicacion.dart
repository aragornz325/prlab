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
    required this.idProyecto,
    required super.nombre,
    required this.contenido,
    required super.idAutor,
    required this.idImagenes,
    required this.idImagenDestacada,
    required this.resumen,
    required this.idTags,
    required this.idStatus,
    required this.idCategorias,
    required this.idPadres,
    required super.fechaInicio,
    required super.fechaFin,
    required super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Publicacion.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            idProyecto: json['id_proyecto'],
            nombre: json['nombre'],
            contenido: json['contenido'],
            idAutor: json['id_autor'],
            idImagenes: json['id_imagenes'],
            idImagenDestacada: json['id_imagen_destacada'],
            resumen: json['resumen'],
            idTags: json['id_tags'],
            idStatus: json['id_status'],
            idCategorias: json['id_categorias'],
            idPadres: json['id_padres'],
            fechaInicio: json['fecha_inicio'],
            fechaFin: json['fecha_fin'],
            fechaCreacion: json['fecha_creacion']);
  
  @MappableField(key: 'id_proyecto')
  int idProyecto;
  @MappableField(key: 'contenido')
  String contenido;
  @MappableField(key: 'id_imagenes')
  List<int> idImagenes;
  @MappableField(key: 'id_imagen_destacada')
  int idImagenDestacada;
  @MappableField(key: 'resumen')
  String resumen;
  @MappableField(key: 'id_tags')
  List<int> idTags;
  @MappableField(key: 'id_status')
  int idStatus;
  @MappableField(key: 'id_categorias')
  List<int> idCategorias;
  @MappableField(key: 'id_padres')
  int idPadres;

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
      case 'nombre':
        nombre = value;
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
      case 'fechaInicio':
        fechaInicio = value;
        return;
      case 'fechaFin':
        fechaFin = value;
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
    return jsonDecode(toJson());
  }
}
