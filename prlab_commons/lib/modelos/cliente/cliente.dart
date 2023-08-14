import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

part 'cliente.mapper.dart';

/// Modelo de entidad Cliente (quien posee la Organización).
@MappableClass()
class Cliente extends TableRow with ClienteMappable {
  @MappableConstructor()
  Cliente({
    int? id,
    required this.nombre,
    required this.idOrganizacion,
    required this.contacto,
    required this.fechaCreacion,
  }) : super(id);

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Cliente.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            nombre: json['nombre'],
            idOrganizacion: json['idOrganizacion'],
            contacto: json['contacto'],
            fechaCreacion: json['fechaCreacion']);

  @MappableField(key: 'nombre')
  String? nombre;
  @MappableField(key: 'idOrganizacion')
  int? idOrganizacion;
  @MappableField(key: 'contacto')
  int? contacto;
  @MappableField(key: 'fecha_creacion')
  DateTime? fechaCreacion;

  @override
  String get tableName => 'cliente';

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'nombre':
        nombre = value;
        return;
      case 'idOrganizacion':
        idOrganizacion = value;
        return;
      case 'contacto':
        contacto = value;
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
