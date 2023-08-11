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

  static int _$id(Publicacion v) => v.id;
  static const Field<Publicacion, int> _f$id = Field('id', _$id);
  static int _$idProyecto(Publicacion v) => v.idProyecto;
  static const Field<Publicacion, int> _f$idProyecto =
      Field('idProyecto', _$idProyecto);
  static String _$titulo(Publicacion v) => v.titulo;
  static const Field<Publicacion, String> _f$titulo = Field('titulo', _$titulo);
  static String _$contenido(Publicacion v) => v.contenido;
  static const Field<Publicacion, String> _f$contenido =
      Field('contenido', _$contenido);
  static int _$idAutor(Publicacion v) => v.idAutor;
  static const Field<Publicacion, int> _f$idAutor = Field('idAutor', _$idAutor);
  static List<int> _$idImagenes(Publicacion v) => v.idImagenes;
  static const Field<Publicacion, List<int>> _f$idImagenes =
      Field('idImagenes', _$idImagenes);
  static int _$idImagenDestacada(Publicacion v) => v.idImagenDestacada;
  static const Field<Publicacion, int> _f$idImagenDestacada =
      Field('idImagenDestacada', _$idImagenDestacada, key: 'imagenDestacada');
  static String _$resumen(Publicacion v) => v.resumen;
  static const Field<Publicacion, String> _f$resumen =
      Field('resumen', _$resumen);
  static List<int> _$idTags(Publicacion v) => v.idTags;
  static const Field<Publicacion, List<int>> _f$idTags =
      Field('idTags', _$idTags);
  static int _$idStatus(Publicacion v) => v.idStatus;
  static const Field<Publicacion, int> _f$idStatus =
      Field('idStatus', _$idStatus);
  static List<int> _$idCategorias(Publicacion v) => v.idCategorias;
  static const Field<Publicacion, List<int>> _f$idCategorias =
      Field('idCategorias', _$idCategorias);
  static int _$idPadres(Publicacion v) => v.idPadres;
  static const Field<Publicacion, int> _f$idPadres =
      Field('idPadres', _$idPadres);
  static int _$idComentarios(Publicacion v) => v.idComentarios;
  static const Field<Publicacion, int> _f$idComentarios =
      Field('idComentarios', _$idComentarios);
  static List<int> _$idSubEntregables(Publicacion v) => v.idSubEntregables;
  static const Field<Publicacion, List<int>> _f$idSubEntregables =
      Field('idSubEntregables', _$idSubEntregables);
  static DateTime _$fechaCreacion(Publicacion v) => v.fechaCreacion;
  static const Field<Publicacion, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion);

  @override
  final Map<Symbol, Field<Publicacion, dynamic>> fields = const {
    #id: _f$id,
    #idProyecto: _f$idProyecto,
    #titulo: _f$titulo,
    #contenido: _f$contenido,
    #idAutor: _f$idAutor,
    #idImagenes: _f$idImagenes,
    #idImagenDestacada: _f$idImagenDestacada,
    #resumen: _f$resumen,
    #idTags: _f$idTags,
    #idStatus: _f$idStatus,
    #idCategorias: _f$idCategorias,
    #idPadres: _f$idPadres,
    #idComentarios: _f$idComentarios,
    #idSubEntregables: _f$idSubEntregables,
    #fechaCreacion: _f$fechaCreacion,
  };

  static Publicacion _instantiate(DecodingData data) {
    return Publicacion(
        id: data.dec(_f$id),
        idProyecto: data.dec(_f$idProyecto),
        titulo: data.dec(_f$titulo),
        contenido: data.dec(_f$contenido),
        idAutor: data.dec(_f$idAutor),
        idImagenes: data.dec(_f$idImagenes),
        idImagenDestacada: data.dec(_f$idImagenDestacada),
        resumen: data.dec(_f$resumen),
        idTags: data.dec(_f$idTags),
        idStatus: data.dec(_f$idStatus),
        idCategorias: data.dec(_f$idCategorias),
        idPadres: data.dec(_f$idPadres),
        idComentarios: data.dec(_f$idComentarios),
        idSubEntregables: data.dec(_f$idSubEntregables),
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
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get idImagenes;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get idTags;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get idCategorias;
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get idSubEntregables;
  @override
  $R call(
      {int? id,
      int? idProyecto,
      String? titulo,
      String? contenido,
      int? idAutor,
      List<int>? idImagenes,
      int? idImagenDestacada,
      String? resumen,
      List<int>? idTags,
      int? idStatus,
      List<int>? idCategorias,
      int? idPadres,
      int? idComentarios,
      List<int>? idSubEntregables,
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
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get idImagenes =>
      ListCopyWith($value.idImagenes, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(idImagenes: v));
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get idTags =>
      ListCopyWith($value.idTags, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(idTags: v));
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get idCategorias =>
      ListCopyWith(
          $value.idCategorias,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(idCategorias: v));
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get idSubEntregables =>
      ListCopyWith(
          $value.idSubEntregables,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(idSubEntregables: v));
  @override
  $R call(
          {int? id,
          int? idProyecto,
          String? titulo,
          String? contenido,
          int? idAutor,
          List<int>? idImagenes,
          int? idImagenDestacada,
          String? resumen,
          List<int>? idTags,
          int? idStatus,
          List<int>? idCategorias,
          int? idPadres,
          int? idComentarios,
          List<int>? idSubEntregables,
          DateTime? fechaCreacion}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (idProyecto != null) #idProyecto: idProyecto,
        if (titulo != null) #titulo: titulo,
        if (contenido != null) #contenido: contenido,
        if (idAutor != null) #idAutor: idAutor,
        if (idImagenes != null) #idImagenes: idImagenes,
        if (idImagenDestacada != null) #idImagenDestacada: idImagenDestacada,
        if (resumen != null) #resumen: resumen,
        if (idTags != null) #idTags: idTags,
        if (idStatus != null) #idStatus: idStatus,
        if (idCategorias != null) #idCategorias: idCategorias,
        if (idPadres != null) #idPadres: idPadres,
        if (idComentarios != null) #idComentarios: idComentarios,
        if (idSubEntregables != null) #idSubEntregables: idSubEntregables,
        if (fechaCreacion != null) #fechaCreacion: fechaCreacion
      }));
  @override
  Publicacion $make(CopyWithData data) => Publicacion(
      id: data.get(#id, or: $value.id),
      idProyecto: data.get(#idProyecto, or: $value.idProyecto),
      titulo: data.get(#titulo, or: $value.titulo),
      contenido: data.get(#contenido, or: $value.contenido),
      idAutor: data.get(#idAutor, or: $value.idAutor),
      idImagenes: data.get(#idImagenes, or: $value.idImagenes),
      idImagenDestacada:
          data.get(#idImagenDestacada, or: $value.idImagenDestacada),
      resumen: data.get(#resumen, or: $value.resumen),
      idTags: data.get(#idTags, or: $value.idTags),
      idStatus: data.get(#idStatus, or: $value.idStatus),
      idCategorias: data.get(#idCategorias, or: $value.idCategorias),
      idPadres: data.get(#idPadres, or: $value.idPadres),
      idComentarios: data.get(#idComentarios, or: $value.idComentarios),
      idSubEntregables:
          data.get(#idSubEntregables, or: $value.idSubEntregables),
      fechaCreacion: data.get(#fechaCreacion, or: $value.fechaCreacion));

  @override
  PublicacionCopyWith<$R2, Publicacion, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PublicacionCopyWithImpl($value, $cast, t);
}
