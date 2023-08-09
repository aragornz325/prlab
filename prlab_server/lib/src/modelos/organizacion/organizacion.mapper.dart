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

  static int _$id(Organizacion v) => v.id;
  static const Field<Organizacion, int> _f$id = Field('id', _$id);
  static String _$nombre(Organizacion v) => v.nombre;
  static const Field<Organizacion, String> _f$nombre =
      Field('nombre', _$nombre);
  static int _$tipo(Organizacion v) => v.tipo;
  static const Field<Organizacion, int> _f$tipo = Field('tipo', _$tipo);
  static int _$contacto(Organizacion v) => v.contacto;
  static const Field<Organizacion, int> _f$contacto =
      Field('contacto', _$contacto);
  static List<int> _$miembros(Organizacion v) => v.miembros;
  static const Field<Organizacion, List<int>> _f$miembros =
      Field('miembros', _$miembros);
  static List<int> _$proyectos(Organizacion v) => v.proyectos;
  static const Field<Organizacion, List<int>> _f$proyectos =
      Field('proyectos', _$proyectos);
  static DateTime _$fechaCreacion(Organizacion v) => v.fechaCreacion;
  static const Field<Organizacion, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion);

  @override
  final Map<Symbol, Field<Organizacion, dynamic>> fields = const {
    #id: _f$id,
    #nombre: _f$nombre,
    #tipo: _f$tipo,
    #contacto: _f$contacto,
    #miembros: _f$miembros,
    #proyectos: _f$proyectos,
    #fechaCreacion: _f$fechaCreacion,
  };

  static Organizacion _instantiate(DecodingData data) {
    return Organizacion(
        id: data.dec(_f$id),
        nombre: data.dec(_f$nombre),
        tipo: data.dec(_f$tipo),
        contacto: data.dec(_f$contacto),
        miembros: data.dec(_f$miembros),
        proyectos: data.dec(_f$proyectos),
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
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get miembros;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get proyectos;
  $R call(
      {int? id,
      String? nombre,
      int? tipo,
      int? contacto,
      List<int>? miembros,
      List<int>? proyectos,
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
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get miembros =>
      ListCopyWith($value.miembros, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(miembros: v));
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get proyectos =>
      ListCopyWith($value.proyectos, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(proyectos: v));
  @override
  $R call(
          {int? id,
          String? nombre,
          int? tipo,
          int? contacto,
          List<int>? miembros,
          List<int>? proyectos,
          DateTime? fechaCreacion}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (nombre != null) #nombre: nombre,
        if (tipo != null) #tipo: tipo,
        if (contacto != null) #contacto: contacto,
        if (miembros != null) #miembros: miembros,
        if (proyectos != null) #proyectos: proyectos,
        if (fechaCreacion != null) #fechaCreacion: fechaCreacion
      }));
  @override
  Organizacion $make(CopyWithData data) => Organizacion(
      id: data.get(#id, or: $value.id),
      nombre: data.get(#nombre, or: $value.nombre),
      tipo: data.get(#tipo, or: $value.tipo),
      contacto: data.get(#contacto, or: $value.contacto),
      miembros: data.get(#miembros, or: $value.miembros),
      proyectos: data.get(#proyectos, or: $value.proyectos),
      fechaCreacion: data.get(#fechaCreacion, or: $value.fechaCreacion));

  @override
  OrganizacionCopyWith<$R2, Organizacion, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OrganizacionCopyWithImpl($value, $cast, t);
}
