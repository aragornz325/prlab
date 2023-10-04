/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class CategoriaFiltro extends _i1.SerializableEntity {
  CategoriaFiltro({
    required this.id,
    required this.nombre,
    required this.recuento,
  });

  factory CategoriaFiltro.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return CategoriaFiltro(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
      nombre:
          serializationManager.deserialize<String>(jsonSerialization['nombre']),
      recuento:
          serializationManager.deserialize<int>(jsonSerialization['recuento']),
    );
  }

  int id;

  String nombre;

  int recuento;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'recuento': recuento,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'nombre': nombre,
      'recuento': recuento,
    };
  }
}
