// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comentario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comentario _$$_ComentarioFromJson(Map<String, dynamic> json) =>
    _$_Comentario(
      id: json['id'] as int,
      idPublicacion: json['idPublicacion'] as int,
      offset: (json['offset'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      comentario: json['comentario'] as String,
      fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
    );

Map<String, dynamic> _$$_ComentarioToJson(_$_Comentario instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idPublicacion': instance.idPublicacion,
      'offset': instance.offset,
      'comentario': instance.comentario,
      'fechaCreacion': instance.fechaCreacion.toIso8601String(),
    };
