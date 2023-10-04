/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class CategoriasFiltro extends _i1.SerializableEntity {
  CategoriasFiltro({
    required this.paises,
    required this.ciudades,
    required this.idiomas,
    required this.temas,
    required this.tiposDeMedio,
    required this.puestos,
  });

  factory CategoriasFiltro.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return CategoriasFiltro(
      paises: serializationManager
          .deserialize<List<_i2.CategoriaFiltro>>(jsonSerialization['paises']),
      ciudades: serializationManager.deserialize<List<_i2.CategoriaFiltro>>(
          jsonSerialization['ciudades']),
      idiomas: serializationManager
          .deserialize<List<_i2.CategoriaFiltro>>(jsonSerialization['idiomas']),
      temas: serializationManager
          .deserialize<List<_i2.CategoriaFiltro>>(jsonSerialization['temas']),
      tiposDeMedio: serializationManager.deserialize<List<_i2.CategoriaFiltro>>(
          jsonSerialization['tiposDeMedio']),
      puestos: serializationManager
          .deserialize<List<_i2.CategoriaFiltro>>(jsonSerialization['puestos']),
    );
  }

  List<_i2.CategoriaFiltro> paises;

  List<_i2.CategoriaFiltro> ciudades;

  List<_i2.CategoriaFiltro> idiomas;

  List<_i2.CategoriaFiltro> temas;

  List<_i2.CategoriaFiltro> tiposDeMedio;

  List<_i2.CategoriaFiltro> puestos;

  @override
  Map<String, dynamic> toJson() {
    return {
      'paises': paises,
      'ciudades': ciudades,
      'idiomas': idiomas,
      'temas': temas,
      'tiposDeMedio': tiposDeMedio,
      'puestos': puestos,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'paises': paises,
      'ciudades': ciudades,
      'idiomas': idiomas,
      'temas': temas,
      'tiposDeMedio': tiposDeMedio,
      'puestos': puestos,
    };
  }
}
