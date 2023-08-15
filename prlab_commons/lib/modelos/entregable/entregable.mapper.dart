// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'entregable.dart';

class EntregableMapper extends ClassMapperBase<Entregable> {
  EntregableMapper._();

  static EntregableMapper? _instance;
  static EntregableMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EntregableMapper._());
      BaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Entregable';

  static int? _$id(Entregable v) => v.id;
  static const Field<Entregable, int> _f$id = Field('id', _$id, opt: true);
  static String? _$nombre(Entregable v) => v.nombre;
  static const Field<Entregable, String> _f$nombre = Field('nombre', _$nombre);
  static int? _$idAutor(Entregable v) => v.idAutor;
  static const Field<Entregable, int> _f$idAutor = Field('idAutor', _$idAutor);
  static DateTime? _$fechaInicio(Entregable v) => v.fechaInicio;
  static const Field<Entregable, DateTime> _f$fechaInicio =
      Field('fechaInicio', _$fechaInicio, opt: true);
  static DateTime? _$fechaFin(Entregable v) => v.fechaFin;
  static const Field<Entregable, DateTime> _f$fechaFin =
      Field('fechaFin', _$fechaFin, opt: true);
  static DateTime? _$fechaCreacion(Entregable v) => v.fechaCreacion;
  static const Field<Entregable, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion, opt: true);

  @override
  final Map<Symbol, Field<Entregable, dynamic>> fields = const {
    #id: _f$id,
    #nombre: _f$nombre,
    #idAutor: _f$idAutor,
    #fechaInicio: _f$fechaInicio,
    #fechaFin: _f$fechaFin,
    #fechaCreacion: _f$fechaCreacion,
  };

  static Entregable _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('Entregable');
  }

  @override
  final Function instantiate = _instantiate;

  static Entregable fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Entregable>(map));
  }

  static Entregable fromJson(String json) {
    return _guard((c) => c.fromJson<Entregable>(json));
  }
}

mixin EntregableMappable {
  String toJson();
  Map<String, dynamic> toMap();
  EntregableCopyWith<Entregable, Entregable, Entregable> get copyWith;
}

abstract class EntregableCopyWith<$R, $In extends Entregable, $Out>
    implements BaseCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {int? id,
      String? nombre,
      int? idAutor,
      DateTime? fechaInicio,
      DateTime? fechaFin,
      DateTime? fechaCreacion});
  EntregableCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}
