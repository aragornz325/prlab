// import 'dart:convert';

// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:prlab_server/src/modelos/base/base.dart';
// import 'package:serverpod/serverpod.dart';

// part 'mensaje_registro.mapper.dart';

// /// Modelo de entidad MensajeRegistro (logs/registros de actividad).
// @MappableClass(ignoreNull: true)
// class MensajeRegistro extends ModeloBase with MensajeRegistroMappable {
//   @MappableConstructor()
//   MensajeRegistro(
//       {super.id,
//       required this.mensaje,
//       required this.idUsuario,
//       super.fechaCreacion});

//   /// Constructor requerido por Serverpod para la serialización de la clase y su insercion
//   /// en la Base de datos.
//   @MappableConstructor()
//   MensajeRegistro.fromJson(
//     Map<String, dynamic> jsonSerialization,
//     SerializationManager serializationManager,
//   ) : this(
//             id: serializationManager.deserialize<int?>(jsonSerialization['id']),
//             mensaje: serializationManager
//                 .deserialize<String>(jsonSerialization['mensaje']),
//             idUsuario: serializationManager
//                 .deserialize<int>(jsonSerialization['idUsuario']),
//             fechaCreacion: serializationManager
//                 .deserialize<DateTime?>(jsonSerialization['fechaCreacion']));

//   /// Mensaje contenido en el registro.
//   String mensaje;

//   /// ID del Usuario que ha realizado la operacion que genero el Mensaje.
//   int idUsuario;

//   /// Getter requerido por Serverpod con el nombre de la tabla correspondiente a la entidad.
//   /// Extiende de la clase `TableRow` para manipular conexion con la Base de Datos.
//   @override
//   String get tableName => 'mensaje_registro';

//   @override
//   void setColumn(String columnName, value) {
//     switch (columnName) {
//       case 'mensaje':
//         mensaje = value;
//         return;
//       case 'idUsuario':
//         idUsuario = value;
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
