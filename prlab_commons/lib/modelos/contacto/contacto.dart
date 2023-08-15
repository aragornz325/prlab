import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/base/base.dart';
import 'package:serverpod/serverpod.dart';

part 'contacto.mapper.dart';

/// Modelo de entidad Cliente (quien posee la Organización).
@MappableClass()
class Contacto extends Base with ContactoMappable {
  @MappableConstructor()
  Contacto({
    super.id,
    required this.emailPrincipal,
    required this.telefonoPrincipal,
    required this.emailSecundario,
    required this.telefonoSecundario,
    required this.domicilioCalle,
    required this.domicilioNumero,
    required this.domicilioCiudad,
    required this.domicilioCodigoPostal,
    required this.domicilioEstadoProvincia,
    required this.domicilioPais,
    super.fechaCreacion,
  });

  /// Constructor requerido por Serverpod para la serialización de la clase.
  @MappableConstructor()
  Contacto.fromJson(
    Map<String, dynamic> json,
    SerializationManager serializationManager,
  ) : this(
            id: json['id'],
            emailPrincipal: json['email_principal'],
            emailSecundario: json['email_secundario'],
            telefonoPrincipal: json['telefono_principal'],
            telefonoSecundario: json['telefono_secundario'],
            domicilioCalle: json['domicilio_calle'],
            domicilioNumero: json['domicilio_numero'],
            domicilioCiudad: json['domicilio_ciudad'],
            domicilioCodigoPostal: json['domicilio_codigo_postal'],
            domicilioEstadoProvincia: json['domicilio_estado_provincia'],
            domicilioPais: json['domicilio_pais'],
            fechaCreacion: json['fecha_creacion']);

  @MappableField(key: 'email_principal')
  String? emailPrincipal;
  @MappableField(key: 'email_secundario')
  String? emailSecundario;
  @MappableField(key: 'telefono_principal')
  String? telefonoPrincipal;
  @MappableField(key: 'telefono_secundario')
  String? telefonoSecundario;
  @MappableField(key: 'domicilio_calle')
  String? domicilioCalle;
  @MappableField(key: 'domicilio_numero')
  int? domicilioNumero;
  @MappableField(key: 'domicilio_ciudad')
  String? domicilioCiudad;
  @MappableField(key: 'domicilio_codigo_postal')
  String? domicilioCodigoPostal;
  @MappableField(key: 'domicilio_estado_provincia')
  String? domicilioEstadoProvincia;
  @MappableField(key: 'domicilio_pais')
  String? domicilioPais;

  @override
  String get tableName => 'contacto';

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'emailPrincipal':
        emailPrincipal = value;
        return;
      case 'emailSecundario':
        emailSecundario = value;
        return;
      case 'telefonoPrincipal':
        telefonoPrincipal = value;
        return;
      case 'telefonoSecundario':
        telefonoSecundario = value;
        return;
      case 'domicilioCalle':
        domicilioCalle = value;
        return;
      case 'domicilioNumero':
        domicilioNumero = value;
        return;
      case 'domicilioCiudad':
        domicilioCiudad = value;
        return;
      case 'domicilioCodigoPostal':
        domicilioCodigoPostal = value;
        return;
      case 'domicilioEstadoProvincia':
        domicilioEstadoProvincia = value;
        return;
      case 'domicilioPais':
        domicilioPais = value;
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
