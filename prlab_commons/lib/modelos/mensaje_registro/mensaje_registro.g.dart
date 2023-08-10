// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mensaje_registro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MensajeRegistro _$$_MensajeRegistroFromJson(Map<String, dynamic> json) =>
    _$_MensajeRegistro(
      id: json['id'] as int,
      mensaje: json['mensaje'] as String,
      autor: json['autor'] as int,
      fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
    );

Map<String, dynamic> _$$_MensajeRegistroToJson(_$_MensajeRegistro instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mensaje': instance.mensaje,
      'autor': instance.autor,
      'fechaCreacion': instance.fechaCreacion.toIso8601String(),
    };
