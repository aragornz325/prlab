// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'base.dart';

class BaseMapper extends ClassMapperBase<Base> {
  BaseMapper._();

  static BaseMapper? _instance;
  static BaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BaseMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Base';

  static int? _$id(Base v) => v.id;
  static const Field<Base, int> _f$id = Field('id', _$id, opt: true);
  static DateTime? _$fechaCreacion(Base v) => v.fechaCreacion;
  static const Field<Base, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion, opt: true);

  @override
  final Map<Symbol, Field<Base, dynamic>> fields = const {
    #id: _f$id,
    #fechaCreacion: _f$fechaCreacion,
  };

  static Base _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('Base');
  }

  @override
  final Function instantiate = _instantiate;

  static Base fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Base>(map));
  }

  static Base fromJson(String json) {
    return _guard((c) => c.fromJson<Base>(json));
  }
}

mixin BaseMappable {
  String toJson();
  Map<String, dynamic> toMap();
  BaseCopyWith<Base, Base, Base> get copyWith;
}

abstract class BaseCopyWith<$R, $In extends Base, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, DateTime? fechaCreacion});
  BaseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}
