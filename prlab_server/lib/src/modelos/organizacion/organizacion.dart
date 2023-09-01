// import 'dart:convert';

// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:prlab_server/src/modelos/base/base.dart';
// import 'package:serverpod/serverpod.dart';

// part 'organizacion.mapper.dart';

// /// Modelo de entidad Organizacion (entidad desde la que el Cliente administra los Proyectos).
// @MappableClass(ignoreNull: true)
// class Organizacion extends ModeloBase with OrganizacionMappable {
//   @MappableConstructor()
//   Organizacion({
//     super.id,
//     required this.nombre,
//     required this.tipo,
//     required this.contacto,
//     super.fechaCreacion,
//   });

//   /// Constructor requerido por Serverpod para la serialización de la clase y su insercion
//   /// en la Base de datos.
//   @MappableConstructor()
//   Organizacion.fromJson(
//     Map<String, dynamic> jsonSerialization,
//     SerializationManager serializationManager,
//   ) : this(
//             id: serializationManager.deserialize<int?>(jsonSerialization['id']),
//             nombre: serializationManager.deserialize<String?>(jsonSerialization['nombre']),
//             tipo: serializationManager.deserialize<int?>(jsonSerialization['tipo']),
//             contacto: serializationManager.deserialize<int?>(jsonSerialization['contacto']),
//             fechaCreacion: serializationManager.deserialize<DateTime?>(jsonSerialization['fechaCreacion']),);

//   /// Nombre de la Organizacion.
//   String? nombre;

//   /// Tipo de la Organizacion (Persona Fisica, Juridica, etc).
//   int? tipo;

//   /// ID de los datos de Contacto de la Organizacion.
//   int? contacto;

//   /// Getter requerido por Serverpod con el nombre de la tabla correspondiente a la entidad.
//   /// Extiende de la clase `TableRow` para manipular conexion con la Base de Datos.
//   @override
//   String get tableName => 'organizacion';

//   /// Metodo requerido por Serverpod de la clase `TableRow` para modificar los datos dentro
//   /// del objeto.
//   @override
//   void setColumn(String columnName, value) {
//     switch (columnName) {
//       case 'nombre':
//         nombre = value;
//         return;
//       case 'tipo':
//         tipo = value;
//         return;
//       case 'contacto':
//         contacto = value;
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
