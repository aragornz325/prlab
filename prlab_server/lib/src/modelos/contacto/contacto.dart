// import 'dart:convert';

// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:prlab_server/src/modelos/base/base.dart';
// import 'package:serverpod/serverpod.dart';

// part 'contacto.mapper.dart';

// /// Modelo de entidad Contacto (Contiene datos de contacto, ya sea de un Cliente, una Organizacion, etc).
// @MappableClass(ignoreNull: true)
// class Contacto extends ModeloBase with ContactoMappable {
//   @MappableConstructor()
//   Contacto({
//     super.id,
//     required this.emailPrincipal,
//     required this.telefonoPrincipal,
//     required this.emailSecundario,
//     required this.telefonoSecundario,
//     required this.domicilioCalle,
//     required this.domicilioNumero,
//     required this.domicilioCiudad,
//     required this.domicilioCodigoPostal,
//     required this.domicilioEstadoProvincia,
//     required this.domicilioPais,
//     super.fechaCreacion,
//   });

//   /// Constructor requerido por Serverpod para la serialización de la clase y su insercion
//   /// en la Base de datos.
//   @MappableConstructor()
//   Contacto.fromJson(
//     Map<String, dynamic> jsonSerialization,
//     SerializationManager serializationManager,
//   ) : this(
//           id: serializationManager.deserialize<int?>(jsonSerialization['id']),
//           emailPrincipal: serializationManager
//               .deserialize<String?>(jsonSerialization['emailPrincipal']),
//           emailSecundario: serializationManager
//               .deserialize<String?>(jsonSerialization['emailSecundario']),
//           telefonoPrincipal: serializationManager
//               .deserialize<String?>(jsonSerialization['telefonoPrincipal']),
//           telefonoSecundario: serializationManager
//               .deserialize<String?>(jsonSerialization['telefonoSecundario']),
//           domicilioCalle: serializationManager
//               .deserialize<String?>(jsonSerialization['domicilioCalle']),
//           domicilioNumero: serializationManager
//               .deserialize<int?>(jsonSerialization['domicilioNumero']),
//           domicilioCiudad: serializationManager
//               .deserialize<String?>(jsonSerialization['domicilioCiudad']),
//           domicilioCodigoPostal: serializationManager
//               .deserialize<String?>(jsonSerialization['domicilioCodigoPostal']),
//           domicilioEstadoProvincia: serializationManager.deserialize<String?>(
//               jsonSerialization['domicilioEstadoProvincia']),
//           domicilioPais: serializationManager
//               .deserialize<String?>(jsonSerialization['domicilioPais']),
//           fechaCreacion: serializationManager
//               .deserialize<DateTime?>(jsonSerialization['fechaCreacion']),
//         );

//   String? emailPrincipal;
//   String? emailSecundario;
//   String? telefonoPrincipal;
//   String? telefonoSecundario;
//   String? domicilioCalle;
//   int? domicilioNumero;
//   String? domicilioCiudad;
//   String? domicilioCodigoPostal;
//   String? domicilioEstadoProvincia;
//   String? domicilioPais;

//   /// Getter requerido por Serverpod con el nombre de la tabla correspondiente a la entidad.
//   /// Extiende de la clase `TableRow` para manipular conexion con la Base de Datos.
//   @override
//   String get tableName => 'contacto';

//   /// Metodo requerido por Serverpod de la clase `TableRow` para modificar los datos dentro
//   /// del objeto.
//   @override
//   void setColumn(String columnName, value) {
//     switch (columnName) {
//       case 'emailPrincipal':
//         emailPrincipal = value;
//         return;
//       case 'emailSecundario':
//         emailSecundario = value;
//         return;
//       case 'telefonoPrincipal':
//         telefonoPrincipal = value;
//         return;
//       case 'telefonoSecundario':
//         telefonoSecundario = value;
//         return;
//       case 'domicilioCalle':
//         domicilioCalle = value;
//         return;
//       case 'domicilioNumero':
//         domicilioNumero = value;
//         return;
//       case 'domicilioCiudad':
//         domicilioCiudad = value;
//         return;
//       case 'domicilioCodigoPostal':
//         domicilioCodigoPostal = value;
//         return;
//       case 'domicilioEstadoProvincia':
//         domicilioEstadoProvincia = value;
//         return;
//       case 'domicilioPais':
//         domicilioPais = value;
//         return;
//       default:
//         throw UnimplementedError();
//     }
//   }

//   /// Metodo requerido por Serverpod de la clase `TableRow` para convertir el objeto en un `Map` (json), 
//   /// para su inserción en la Base de Datos.
//   @override
//   Map<String, dynamic> toJsonForDatabase() {
//     return jsonDecode(toJson());
//   }
  
//   @override
//   allToJson() {
//     return jsonDecode(toJson());
//   }
// }
