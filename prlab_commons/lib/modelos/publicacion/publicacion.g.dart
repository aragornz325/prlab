// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publicacion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Publicacion _$$_PublicacionFromJson(Map<String, dynamic> json) =>
    _$_Publicacion(
      contenido: json['contenido'] as String,
      autor: json['autor'] as int,
      imagenes:
          (json['imagenes'] as List<dynamic>).map((e) => e as int).toList(),
      imagenDestacada: json['imagenDestacada'] as int,
      resumen: json['resumen'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as int).toList(),
      status: json['status'] as int,
      idCategorias:
          (json['idCategorias'] as List<dynamic>).map((e) => e as int).toList(),
      parents: (json['parents'] as List<dynamic>).map((e) => e as int).toList(),
      comentarios:
          (json['comentarios'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'] as int,
      idProyecto: json['idProyecto'] as int,
      titulo: json['titulo'] as String,
      idSubEntregables: (json['idSubEntregables'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
    );

Map<String, dynamic> _$$_PublicacionToJson(_$_Publicacion instance) =>
    <String, dynamic>{
      'contenido': instance.contenido,
      'autor': instance.autor,
      'imagenes': instance.imagenes,
      'imagenDestacada': instance.imagenDestacada,
      'resumen': instance.resumen,
      'tags': instance.tags,
      'status': instance.status,
      'idCategorias': instance.idCategorias,
      'parents': instance.parents,
      'comentarios': instance.comentarios,
      'id': instance.id,
      'idProyecto': instance.idProyecto,
      'titulo': instance.titulo,
      'idSubEntregables': instance.idSubEntregables,
      'fechaCreacion': instance.fechaCreacion.toIso8601String(),
    };
