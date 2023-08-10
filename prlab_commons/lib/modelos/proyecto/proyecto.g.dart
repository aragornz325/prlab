// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proyecto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Proyecto _$$_ProyectoFromJson(Map<String, dynamic> json) => _$_Proyecto(
      id: json['id'] as int,
      idOrganizacion: json['idOrganizacion'] as int,
      nombre: json['nombre'] as String,
      idEntregables: (json['idEntregables'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
    );

Map<String, dynamic> _$$_ProyectoToJson(_$_Proyecto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idOrganizacion': instance.idOrganizacion,
      'nombre': instance.nombre,
      'idEntregables': instance.idEntregables,
      'fechaCreacion': instance.fechaCreacion.toIso8601String(),
    };
