/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class Marca extends _i1.SerializableEntity {
  Marca({
    this.id,
    required this.nombre,
    required this.sitioWeb,
    this.staff,
    this.ultimosArticulos,
    this.cantidadArticulos,
    this.cantidadClippings,
  });

  factory Marca.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Marca(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      nombre:
          serializationManager.deserialize<String>(jsonSerialization['nombre']),
      sitioWeb: serializationManager
          .deserialize<String>(jsonSerialization['sitioWeb']),
      staff: serializationManager
          .deserialize<List<_i2.Cliente>?>(jsonSerialization['staff']),
      ultimosArticulos:
          serializationManager.deserialize<List<_i2.EntregableArticulo>?>(
              jsonSerialization['ultimosArticulos']),
      cantidadArticulos: serializationManager
          .deserialize<int?>(jsonSerialization['cantidadArticulos']),
      cantidadClippings: serializationManager
          .deserialize<int?>(jsonSerialization['cantidadClippings']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String nombre;

  String sitioWeb;

  List<_i2.Cliente>? staff;

  List<_i2.EntregableArticulo>? ultimosArticulos;

  int? cantidadArticulos;

  int? cantidadClippings;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'sitioWeb': sitioWeb,
      'staff': staff,
      'ultimosArticulos': ultimosArticulos,
      'cantidadArticulos': cantidadArticulos,
      'cantidadClippings': cantidadClippings,
    };
  }
}
