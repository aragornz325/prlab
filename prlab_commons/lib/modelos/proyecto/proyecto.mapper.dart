// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'proyecto.dart';

class ProyectoMapper extends ClassMapperBase<Proyecto> {
  ProyectoMapper._();

  static ProyectoMapper? _instance;
  static ProyectoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProyectoMapper._());
      EntregableMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Proyecto';

  static int? _$id(Proyecto v) => v.id;
  static const Field<Proyecto, int> _f$id = Field('id', _$id, opt: true);
  static int? _$idOrganizacion(Proyecto v) => v.idOrganizacion;
  static const Field<Proyecto, int> _f$idOrganizacion =
      Field('idOrganizacion', _$idOrganizacion);
  static String? _$nombre(Proyecto v) => v.nombre;
  static const Field<Proyecto, String> _f$nombre = Field('nombre', _$nombre);
  static int? _$idAutor(Proyecto v) => v.idAutor;
  static const Field<Proyecto, int> _f$idAutor = Field('idAutor', _$idAutor);
  static DateTime? _$fechaInicio(Proyecto v) => v.fechaInicio;
  static const Field<Proyecto, DateTime> _f$fechaInicio =
      Field('fechaInicio', _$fechaInicio, opt: true);
  static DateTime? _$fechaFin(Proyecto v) => v.fechaFin;
  static const Field<Proyecto, DateTime> _f$fechaFin =
      Field('fechaFin', _$fechaFin, opt: true);
  static DateTime? _$fechaCreacion(Proyecto v) => v.fechaCreacion;
  static const Field<Proyecto, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion, opt: true);

  @override
  final Map<Symbol, Field<Proyecto, dynamic>> fields = const {
    #id: _f$id,
    #idOrganizacion: _f$idOrganizacion,
    #nombre: _f$nombre,
    #idAutor: _f$idAutor,
    #fechaInicio: _f$fechaInicio,
    #fechaFin: _f$fechaFin,
    #fechaCreacion: _f$fechaCreacion,
  };
  @override
  final bool ignoreNull = true;

  static Proyecto _instantiate(DecodingData data) {
    return Proyecto(
        id: data.dec(_f$id),
        idOrganizacion: data.dec(_f$idOrganizacion),
        nombre: data.dec(_f$nombre),
        idAutor: data.dec(_f$idAutor),
        fechaInicio: data.dec(_f$fechaInicio),
        fechaFin: data.dec(_f$fechaFin),
        fechaCreacion: data.dec(_f$fechaCreacion));
  }

  @override
  final Function instantiate = _instantiate;

  static Proyecto fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Proyecto>(map));
  }

  static Proyecto fromJson(String json) {
    return _guard((c) => c.fromJson<Proyecto>(json));
  }
}

mixin ProyectoMappable {
  String toJson() {
    return ProyectoMapper._guard((c) => c.toJson(this as Proyecto));
  }

  Map<String, dynamic> toMap() {
    return ProyectoMapper._guard((c) => c.toMap(this as Proyecto));
  }

  ProyectoCopyWith<Proyecto, Proyecto, Proyecto> get copyWith =>
      _ProyectoCopyWithImpl(this as Proyecto, $identity, $identity);
  @override
  String toString() {
    return ProyectoMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProyectoMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ProyectoMapper._guard((c) => c.hash(this));
  }
}

extension ProyectoValueCopy<$R, $Out> on ObjectCopyWith<$R, Proyecto, $Out> {
  ProyectoCopyWith<$R, Proyecto, $Out> get $asProyecto =>
      $base.as((v, t, t2) => _ProyectoCopyWithImpl(v, t, t2));
}

abstract class ProyectoCopyWith<$R, $In extends Proyecto, $Out>
    implements EntregableCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {int? id,
      int? idOrganizacion,
      String? nombre,
      int? idAutor,
      DateTime? fechaInicio,
      DateTime? fechaFin,
      DateTime? fechaCreacion});
  ProyectoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProyectoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Proyecto, $Out>
    implements ProyectoCopyWith<$R, Proyecto, $Out> {
  _ProyectoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Proyecto> $mapper =
      ProyectoMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? idOrganizacion = $none,
          Object? nombre = $none,
          Object? idAutor = $none,
          Object? fechaInicio = $none,
          Object? fechaFin = $none,
          Object? fechaCreacion = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (idOrganizacion != $none) #idOrganizacion: idOrganizacion,
        if (nombre != $none) #nombre: nombre,
        if (idAutor != $none) #idAutor: idAutor,
        if (fechaInicio != $none) #fechaInicio: fechaInicio,
        if (fechaFin != $none) #fechaFin: fechaFin,
        if (fechaCreacion != $none) #fechaCreacion: fechaCreacion
      }));
  @override
  Proyecto $make(CopyWithData data) => Proyecto(
      id: data.get(#id, or: $value.id),
      idOrganizacion: data.get(#idOrganizacion, or: $value.idOrganizacion),
      nombre: data.get(#nombre, or: $value.nombre),
      idAutor: data.get(#idAutor, or: $value.idAutor),
      fechaInicio: data.get(#fechaInicio, or: $value.fechaInicio),
      fechaFin: data.get(#fechaFin, or: $value.fechaFin),
      fechaCreacion: data.get(#fechaCreacion, or: $value.fechaCreacion));

  @override
  ProyectoCopyWith<$R2, Proyecto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProyectoCopyWithImpl($value, $cast, t);
}
