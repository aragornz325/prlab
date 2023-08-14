// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'organizacion.dart';

class OrganizacionMapper extends ClassMapperBase<Organizacion> {
  OrganizacionMapper._();

  static OrganizacionMapper? _instance;
  static OrganizacionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrganizacionMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Organizacion';

  static int? _$id(Organizacion v) => v.id;
  static const Field<Organizacion, int> _f$id = Field('id', _$id, opt: true);
  static String? _$nombre(Organizacion v) => v.nombre;
  static const Field<Organizacion, String> _f$nombre =
      Field('nombre', _$nombre);
  static int? _$tipo(Organizacion v) => v.tipo;
  static const Field<Organizacion, int> _f$tipo = Field('tipo', _$tipo);
  static int? _$contacto(Organizacion v) => v.contacto;
  static const Field<Organizacion, int> _f$contacto =
      Field('contacto', _$contacto);
  static DateTime? _$fechaCreacion(Organizacion v) => v.fechaCreacion;
  static const Field<Organizacion, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion, key: 'fecha_creacion', opt: true);

  @override
  final Map<Symbol, Field<Organizacion, dynamic>> fields = const {
    #id: _f$id,
    #nombre: _f$nombre,
    #tipo: _f$tipo,
    #contacto: _f$contacto,
    #fechaCreacion: _f$fechaCreacion,
  };
  @override
  final bool ignoreNull = true;

  static Organizacion _instantiate(DecodingData data) {
    return Organizacion(
        id: data.dec(_f$id),
        nombre: data.dec(_f$nombre),
        tipo: data.dec(_f$tipo),
        contacto: data.dec(_f$contacto),
        fechaCreacion: data.dec(_f$fechaCreacion));
  }

  @override
  final Function instantiate = _instantiate;

  static Organizacion fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Organizacion>(map));
  }

  static Organizacion fromJson(String json) {
    return _guard((c) => c.fromJson<Organizacion>(json));
  }
}

mixin OrganizacionMappable {
  String toJson() {
    return OrganizacionMapper._guard((c) => c.toJson(this as Organizacion));
  }

  Map<String, dynamic> toMap() {
    return OrganizacionMapper._guard((c) => c.toMap(this as Organizacion));
  }

  OrganizacionCopyWith<Organizacion, Organizacion, Organizacion> get copyWith =>
      _OrganizacionCopyWithImpl(this as Organizacion, $identity, $identity);
  @override
  String toString() {
    return OrganizacionMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OrganizacionMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return OrganizacionMapper._guard((c) => c.hash(this));
  }
}

extension OrganizacionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Organizacion, $Out> {
  OrganizacionCopyWith<$R, Organizacion, $Out> get $asOrganizacion =>
      $base.as((v, t, t2) => _OrganizacionCopyWithImpl(v, t, t2));
}

abstract class OrganizacionCopyWith<$R, $In extends Organizacion, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? nombre,
      int? tipo,
      int? contacto,
      DateTime? fechaCreacion});
  OrganizacionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OrganizacionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Organizacion, $Out>
    implements OrganizacionCopyWith<$R, Organizacion, $Out> {
  _OrganizacionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Organizacion> $mapper =
      OrganizacionMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? nombre = $none,
          Object? tipo = $none,
          Object? contacto = $none,
          Object? fechaCreacion = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (nombre != $none) #nombre: nombre,
        if (tipo != $none) #tipo: tipo,
        if (contacto != $none) #contacto: contacto,
        if (fechaCreacion != $none) #fechaCreacion: fechaCreacion
      }));
  @override
  Organizacion $make(CopyWithData data) => Organizacion(
      id: data.get(#id, or: $value.id),
      nombre: data.get(#nombre, or: $value.nombre),
      tipo: data.get(#tipo, or: $value.tipo),
      contacto: data.get(#contacto, or: $value.contacto),
      fechaCreacion: data.get(#fechaCreacion, or: $value.fechaCreacion));

  @override
  OrganizacionCopyWith<$R2, Organizacion, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OrganizacionCopyWithImpl($value, $cast, t);
}
