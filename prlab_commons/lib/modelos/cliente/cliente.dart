import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/base/base.dart';
import 'package:serverpod/serverpod.dart';

part 'cliente.mapper.dart';

/// Modelo de entidad Cliente (quien posee la Organización).
@MappableClass()
class Cliente extends Base with ClienteMappable {
  @MappableConstructor()
  Cliente({
    super.id,
    required this.nombre,
    required this.contacto,
    super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Cliente.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            nombre: json['nombre'],
            contacto: json['contacto'],
            fechaCreacion: json['fecha_creacion']);

  @MappableField(key: 'nombre')
  String? nombre;
  @MappableField(key: 'contacto')
  int? contacto;

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
