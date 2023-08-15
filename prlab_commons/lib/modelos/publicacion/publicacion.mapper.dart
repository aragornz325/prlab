// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'publicacion.dart';

class PublicacionMapper extends ClassMapperBase<Publicacion> {
  PublicacionMapper._();

  static PublicacionMapper? _instance;
  static PublicacionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PublicacionMapper._());
      EntregableMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Publicacion';

  static int? _$id(Publicacion v) => v.id;
  static const Field<Publicacion, int> _f$id = Field('id', _$id);
  static int? _$idProyecto(Publicacion v) => v.idProyecto;
  static const Field<Publicacion, int> _f$idProyecto =
      Field('idProyecto', _$idProyecto);
  static String? _$nombre(Publicacion v) => v.nombre;
  static const Field<Publicacion, String> _f$nombre = Field('nombre', _$nombre);
  static String? _$contenido(Publicacion v) => v.contenido;
  static const Field<Publicacion, String> _f$contenido =
      Field('contenido', _$contenido);
  static int? _$idAutor(Publicacion v) => v.idAutor;
  static const Field<Publicacion, int> _f$idAutor = Field('idAutor', _$idAutor);
  static String? _$resumen(Publicacion v) => v.resumen;
  static const Field<Publicacion, String> _f$resumen =
      Field('resumen', _$resumen);
  static List<int>? _$idTags(Publicacion v) => v.idTags;
  static const Field<Publicacion, List<int>> _f$idTags =
      Field('idTags', _$idTags);
  static int? _$idStatus(Publicacion v) => v.idStatus;
  static const Field<Publicacion, int> _f$idStatus =
      Field('idStatus', _$idStatus);
  static List<int>? _$idCategorias(Publicacion v) => v.idCategorias;
  static const Field<Publicacion, List<int>> _f$idCategorias =
      Field('idCategorias', _$idCategorias);
  static DateTime? _$fechaInicio(Publicacion v) => v.fechaInicio;
  static const Field<Publicacion, DateTime> _f$fechaInicio =
      Field('fechaInicio', _$fechaInicio);
  static DateTime? _$fechaFin(Publicacion v) => v.fechaFin;
  static const Field<Publicacion, DateTime> _f$fechaFin =
      Field('fechaFin', _$fechaFin);
  static DateTime? _$fechaCreacion(Publicacion v) => v.fechaCreacion;
  static const Field<Publicacion, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion);

  @override
  final Map<Symbol, Field<Publicacion, dynamic>> fields = const {
    #id: _f$id,
    #idProyecto: _f$idProyecto,
    #nombre: _f$nombre,
    #contenido: _f$contenido,
    #idAutor: _f$idAutor,
    #resumen: _f$resumen,
    #idTags: _f$idTags,
    #idStatus: _f$idStatus,
    #idCategorias: _f$idCategorias,
    #fechaInicio: _f$fechaInicio,
    #fechaFin: _f$fechaFin,
    #fechaCreacion: _f$fechaCreacion,
  };
  @override
  final bool ignoreNull = true;

  static Publicacion _instantiate(DecodingData data) {
    return Publicacion(
        id: data.dec(_f$id),
        idProyecto: data.dec(_f$idProyecto),
        nombre: data.dec(_f$nombre),
        contenido: data.dec(_f$contenido),
        idAutor: data.dec(_f$idAutor),
        resumen: data.dec(_f$resumen),
        idTags: data.dec(_f$idTags),
        idStatus: data.dec(_f$idStatus),
        idCategorias: data.dec(_f$idCategorias),
        fechaInicio: data.dec(_f$fechaInicio),
        fechaFin: data.dec(_f$fechaFin),
        fechaCreacion: data.dec(_f$fechaCreacion));
  }

  @override
  final Function instantiate = _instantiate;

  static Publicacion fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Publicacion>(map));
  }

  static Publicacion fromJson(String json) {
    return _guard((c) => c.fromJson<Publicacion>(json));
  }
}

mixin PublicacionMappable {
  String toJson() {
    return PublicacionMapper._guard((c) => c.toJson(this as Publicacion));
  }

  Map<String, dynamic> toMap() {
    return PublicacionMapper._guard((c) => c.toMap(this as Publicacion));
  }

  PublicacionCopyWith<Publicacion, Publicacion, Publicacion> get copyWith =>
      _PublicacionCopyWithImpl(this as Publicacion, $identity, $identity);
  @override
  String toString() {
    return PublicacionMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PublicacionMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PublicacionMapper._guard((c) => c.hash(this));
  }
}

extension PublicacionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Publicacion, $Out> {
  PublicacionCopyWith<$R, Publicacion, $Out> get $asPublicacion =>
      $base.as((v, t, t2) => _PublicacionCopyWithImpl(v, t, t2));
}

abstract class PublicacionCopyWith<$R, $In extends Publicacion, $Out>
    implements EntregableCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get idTags;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get idCategorias;
  @override
  $R call(
      {int? id,
      int? idProyecto,
      String? nombre,
      String? contenido,
      int? idAutor,
      String? resumen,
      List<int>? idTags,
      int? idStatus,
      List<int>? idCategorias,
      DateTime? fechaInicio,
      DateTime? fechaFin,
      DateTime? fechaCreacion});
  PublicacionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PublicacionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Publicacion, $Out>
    implements PublicacionCopyWith<$R, Publicacion, $Out> {
  _PublicacionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Publicacion> $mapper =
      PublicacionMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get idTags =>
      $value.idTags != null
          ? ListCopyWith($value.idTags!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(idTags: v))
          : null;
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get idCategorias =>
      $value.idCategorias != null
          ? ListCopyWith(
              $value.idCategorias!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(idCategorias: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? idProyecto = $none,
          Object? nombre = $none,
          Object? contenido = $none,
          Object? idAutor = $none,
          Object? resumen = $none,
          Object? idTags = $none,
          Object? idStatus = $none,
          Object? idCategorias = $none,
          Object? fechaInicio = $none,
          Object? fechaFin = $none,
          Object? fechaCreacion = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (idProyecto != $none) #idProyecto: idProyecto,
        if (nombre != $none) #nombre: nombre,
        if (contenido != $none) #contenido: contenido,
        if (idAutor != $none) #idAutor: idAutor,
        if (resumen != $none) #resumen: resumen,
        if (idTags != $none) #idTags: idTags,
        if (idStatus != $none) #idStatus: idStatus,
        if (idCategorias != $none) #idCategorias: idCategorias,
        if (fechaInicio != $none) #fechaInicio: fechaInicio,
        if (fechaFin != $none) #fechaFin: fechaFin,
        if (fechaCreacion != $none) #fechaCreacion: fechaCreacion
      }));
  @override
  Publicacion $make(CopyWithData data) => Publicacion(
      id: data.get(#id, or: $value.id),
      idProyecto: data.get(#idProyecto, or: $value.idProyecto),
      nombre: data.get(#nombre, or: $value.nombre),
      contenido: data.get(#contenido, or: $value.contenido),
      idAutor: data.get(#idAutor, or: $value.idAutor),
      resumen: data.get(#resumen, or: $value.resumen),
      idTags: data.get(#idTags, or: $value.idTags),
      idStatus: data.get(#idStatus, or: $value.idStatus),
      idCategorias: data.get(#idCategorias, or: $value.idCategorias),
      fechaInicio: data.get(#fechaInicio, or: $value.fechaInicio),
      fechaFin: data.get(#fechaFin, or: $value.fechaFin),
      fechaCreacion: data.get(#fechaCreacion, or: $value.fechaCreacion));

  @override
  PublicacionCopyWith<$R2, Publicacion, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PublicacionCopyWithImpl($value, $cast, t);
}
