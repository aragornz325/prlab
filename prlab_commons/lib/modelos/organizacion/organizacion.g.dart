// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizacion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Organizacion _$$_OrganizacionFromJson(Map<String, dynamic> json) =>
    _$_Organizacion(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      tipo: json['tipo'] as int,
      contacto: json['contacto'] as int,
      idMiembros:
          (json['idMiembros'] as List<dynamic>).map((e) => e as int).toList(),
      idProyectos:
          (json['idProyectos'] as List<dynamic>).map((e) => e as int).toList(),
      fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
    );

Map<String, dynamic> _$$_OrganizacionToJson(_$_Organizacion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'tipo': instance.tipo,
      'contacto': instance.contacto,
      'idMiembros': instance.idMiembros,
      'idProyectos': instance.idProyectos,
      'fechaCreacion': instance.fechaCreacion.toIso8601String(),
    };
