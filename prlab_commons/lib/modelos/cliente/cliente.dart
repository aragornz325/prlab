import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/base/base.dart';
import 'package:serverpod/serverpod.dart';

part 'cliente.mapper.dart';

/// Modelo de entidad Cliente (cliente de la empresa, quien posee una Organizacion).
@MappableClass(ignoreNull: true)
class Cliente extends Base with ClienteMappable {
  @MappableConstructor()
  Cliente({
    super.id,
    required this.nombre,
    required this.apellido,
    required this.fechaDeNacimiento,
    required this.idOrganizacion,
    required this.contacto,
    super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase y su insercion
  /// en la Base de datos.
  @MappableConstructor()
  Cliente.fromJson(
    Map<String, dynamic> jsonSerialization,
    SerializationManager serializationManager,
  ) : this(
          id: serializationManager.deserialize<int?>(jsonSerialization['id']),
          nombre: serializationManager
              .deserialize<String>(jsonSerialization['nombre']),
          apellido: serializationManager
              .deserialize<String>(jsonSerialization['apellido']),
          fechaDeNacimiento: serializationManager
              .deserialize<DateTime>(jsonSerialization['fechaDeNacimiento']),
          idOrganizacion: serializationManager
              .deserialize<int>(jsonSerialization['idOrganizacion']),
          contacto: serializationManager
              .deserialize<int>(jsonSerialization['contacto']),
          fechaCreacion: serializationManager
              .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
        );

  /// Nombre/s del Cliente.
  String nombre;

  /// Apellido/s del Cliente.
  String apellido;

  /// Fecha de nacimiento del Cliente.
  DateTime fechaDeNacimiento;

  /// ID del registro de la Organizacion del Cliente.
  int idOrganizacion;

  /// ID de los datos de Contacto del Cliente.
  int contacto;

  /// Getter requerido por Serverpod con el nombre de la tabla correspondiente a la entidad.
  /// Extiende de la clase `TableRow` para manipular conexion con la Base de Datos.
  @override
  String get tableName => 'cliente';

  /// Metodo requerido por Serverpod de la clase `TableRow` para modificar los datos dentro
  /// del objeto.
  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'nombre':
        nombre = value;
        return;
      case 'apellido':
        apellido = value;
        return;
      case 'fechaDeNacimiento':
        fechaDeNacimiento = value;
        return;
      case 'idOrganizacion':
        idOrganizacion = value;
        return;
      case 'contacto':
        contacto = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  /// Metodo requerido por Serverpod de la clase `TableRow` para convertir el objeto en un `Map` (json), 
  /// para su inserción en la Base de Datos.
  @override
  Map<String, dynamic> toJsonForDatabase() {
    return jsonDecode(toJson());
  }
}
