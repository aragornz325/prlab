// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entregable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Entregable _$$_EntregableFromJson(Map<String, dynamic> json) =>
    _$_Entregable(
      id: json['id'] as int,
      idProyecto: json['idProyecto'] as int,
      titulo: json['titulo'] as String,
      idSubEntregables: (json['idSubEntregables'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
    );

Map<String, dynamic> _$$_EntregableToJson(_$_Entregable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idProyecto': instance.idProyecto,
      'titulo': instance.titulo,
      'idSubEntregables': instance.idSubEntregables,
      'fechaCreacion': instance.fechaCreacion.toIso8601String(),
    };
