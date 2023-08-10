// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cliente _$$_ClienteFromJson(Map<String, dynamic> json) => _$_Cliente(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      idOrganizacion: json['idOrganizacion'] as int,
      contacto: json['contacto'] as int,
      fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
    );

Map<String, dynamic> _$$_ClienteToJson(_$_Cliente instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'idOrganizacion': instance.idOrganizacion,
      'contacto': instance.contacto,
      'fechaCreacion': instance.fechaCreacion.toIso8601String(),
    };
