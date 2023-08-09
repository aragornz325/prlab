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
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Proyecto';

  static int _$id(Proyecto v) => v.id;
  static const Field<Proyecto, int> _f$id = Field('id', _$id);
  static int _$idOrganizacion(Proyecto v) => v.idOrganizacion;
  static const Field<Proyecto, int> _f$idOrganizacion =
      Field('idOrganizacion', _$idOrganizacion);
  static String _$nombre(Proyecto v) => v.nombre;
  static const Field<Proyecto, String> _f$nombre = Field('nombre', _$nombre);
  static List<int> _$entregables(Proyecto v) => v.entregables;
  static const Field<Proyecto, List<int>> _f$entregables =
      Field('entregables', _$entregables);
  static DateTime _$fechaCreacion(Proyecto v) => v.fechaCreacion;
  static const Field<Proyecto, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion);

  @override
  final Map<Symbol, Field<Proyecto, dynamic>> fields = const {
    #id: _f$id,
    #idOrganizacion: _f$idOrganizacion,
    #nombre: _f$nombre,
    #entregables: _f$entregables,
    #fechaCreacion: _f$fechaCreacion,
  };

  static Proyecto _instantiate(DecodingData data) {
    return Proyecto(
        id: data.dec(_f$id),
        idOrganizacion: data.dec(_f$idOrganizacion),
        nombre: data.dec(_f$nombre),
        entregables: data.dec(_f$entregables),
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
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get entregables;
  $R call(
      {int? id,
      int? idOrganizacion,
      String? nombre,
      List<int>? entregables,
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
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get entregables =>
      ListCopyWith(
          $value.entregables,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(entregables: v));
  @override
  $R call(
          {int? id,
          int? idOrganizacion,
          String? nombre,
          List<int>? entregables,
          DateTime? fechaCreacion}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (idOrganizacion != null) #idOrganizacion: idOrganizacion,
        if (nombre != null) #nombre: nombre,
        if (entregables != null) #entregables: entregables,
        if (fechaCreacion != null) #fechaCreacion: fechaCreacion
      }));
  @override
  Proyecto $make(CopyWithData data) => Proyecto(
      id: data.get(#id, or: $value.id),
      idOrganizacion: data.get(#idOrganizacion, or: $value.idOrganizacion),
      nombre: data.get(#nombre, or: $value.nombre),
      entregables: data.get(#entregables, or: $value.entregables),
      fechaCreacion: data.get(#fechaCreacion, or: $value.fechaCreacion));

  @override
  ProyectoCopyWith<$R2, Proyecto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProyectoCopyWithImpl($value, $cast, t);
}
