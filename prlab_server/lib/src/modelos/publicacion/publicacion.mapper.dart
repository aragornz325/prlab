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

  static String _$contenido(Publicacion v) => v.contenido;
  static const Field<Publicacion, String> _f$contenido =
      Field('contenido', _$contenido);
  static int _$autor(Publicacion v) => v.autor;
  static const Field<Publicacion, int> _f$autor = Field('autor', _$autor);
  static List<String> _$imagenes(Publicacion v) => v.imagenes;
  static const Field<Publicacion, List<String>> _f$imagenes =
      Field('imagenes', _$imagenes);
  static String _$imagenDestacada(Publicacion v) => v.imagenDestacada;
  static const Field<Publicacion, String> _f$imagenDestacada =
      Field('imagenDestacada', _$imagenDestacada);
  static String _$resumen(Publicacion v) => v.resumen;
  static const Field<Publicacion, String> _f$resumen =
      Field('resumen', _$resumen);
  static List<String> _$tags(Publicacion v) => v.tags;
  static const Field<Publicacion, List<String>> _f$tags = Field('tags', _$tags);
  static List<int> _$status(Publicacion v) => v.status;
  static const Field<Publicacion, List<int>> _f$status =
      Field('status', _$status);
  static List<int> _$categoria(Publicacion v) => v.categoria;
  static const Field<Publicacion, List<int>> _f$categoria =
      Field('categoria', _$categoria);
  static int _$parents(Publicacion v) => v.parents;
  static const Field<Publicacion, int> _f$parents =
      Field('parents', _$parents, key: 'padres');
  static int _$comentarios(Publicacion v) => v.comentarios;
  static const Field<Publicacion, int> _f$comentarios =
      Field('comentarios', _$comentarios);
  static int _$id(Publicacion v) => v.id;
  static const Field<Publicacion, int> _f$id = Field('id', _$id);
  static int _$idProyecto(Publicacion v) => v.idProyecto;
  static const Field<Publicacion, int> _f$idProyecto =
      Field('idProyecto', _$idProyecto);
  static String _$titulo(Publicacion v) => v.titulo;
  static const Field<Publicacion, String> _f$titulo = Field('titulo', _$titulo);
  static List<int> _$subEntregables(Publicacion v) => v.subEntregables;
  static const Field<Publicacion, List<int>> _f$subEntregables =
      Field('subEntregables', _$subEntregables);
  static DateTime _$fechaCreacion(Publicacion v) => v.fechaCreacion;
  static const Field<Publicacion, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion);

  @override
  final Map<Symbol, Field<Publicacion, dynamic>> fields = const {
    #contenido: _f$contenido,
    #autor: _f$autor,
    #imagenes: _f$imagenes,
    #imagenDestacada: _f$imagenDestacada,
    #resumen: _f$resumen,
    #tags: _f$tags,
    #status: _f$status,
    #categoria: _f$categoria,
    #parents: _f$parents,
    #comentarios: _f$comentarios,
    #id: _f$id,
    #idProyecto: _f$idProyecto,
    #titulo: _f$titulo,
    #subEntregables: _f$subEntregables,
    #fechaCreacion: _f$fechaCreacion,
  };

  static Publicacion _instantiate(DecodingData data) {
    return Publicacion(
        contenido: data.dec(_f$contenido),
        autor: data.dec(_f$autor),
        imagenes: data.dec(_f$imagenes),
        imagenDestacada: data.dec(_f$imagenDestacada),
        resumen: data.dec(_f$resumen),
        tags: data.dec(_f$tags),
        status: data.dec(_f$status),
        categoria: data.dec(_f$categoria),
        parents: data.dec(_f$parents),
        comentarios: data.dec(_f$comentarios),
        id: data.dec(_f$id),
        idProyecto: data.dec(_f$idProyecto),
        titulo: data.dec(_f$titulo),
        subEntregables: data.dec(_f$subEntregables),
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get imagenes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get status;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get categoria;
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get subEntregables;
  @override
  $R call(
      {String? contenido,
      int? autor,
      List<String>? imagenes,
      String? imagenDestacada,
      String? resumen,
      List<String>? tags,
      List<int>? status,
      List<int>? categoria,
      int? parents,
      int? comentarios,
      int? id,
      int? idProyecto,
      String? titulo,
      List<int>? subEntregables,
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get imagenes =>
      ListCopyWith($value.imagenes, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(imagenes: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith($value.tags, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tags: v));
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get status =>
      ListCopyWith($value.status, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(status: v));
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get categoria =>
      ListCopyWith($value.categoria, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(categoria: v));
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get subEntregables =>
      ListCopyWith(
          $value.subEntregables,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(subEntregables: v));
  @override
  $R call(
          {String? contenido,
          int? autor,
          List<String>? imagenes,
          String? imagenDestacada,
          String? resumen,
          List<String>? tags,
          List<int>? status,
          List<int>? categoria,
          int? parents,
          int? comentarios,
          int? id,
          int? idProyecto,
          String? titulo,
          List<int>? subEntregables,
          DateTime? fechaCreacion}) =>
      $apply(FieldCopyWithData({
        if (contenido != null) #contenido: contenido,
        if (autor != null) #autor: autor,
        if (imagenes != null) #imagenes: imagenes,
        if (imagenDestacada != null) #imagenDestacada: imagenDestacada,
        if (resumen != null) #resumen: resumen,
        if (tags != null) #tags: tags,
        if (status != null) #status: status,
        if (categoria != null) #categoria: categoria,
        if (parents != null) #parents: parents,
        if (comentarios != null) #comentarios: comentarios,
        if (id != null) #id: id,
        if (idProyecto != null) #idProyecto: idProyecto,
        if (titulo != null) #titulo: titulo,
        if (subEntregables != null) #subEntregables: subEntregables,
        if (fechaCreacion != null) #fechaCreacion: fechaCreacion
      }));
  @override
  Publicacion $make(CopyWithData data) => Publicacion(
      contenido: data.get(#contenido, or: $value.contenido),
      autor: data.get(#autor, or: $value.autor),
      imagenes: data.get(#imagenes, or: $value.imagenes),
      imagenDestacada: data.get(#imagenDestacada, or: $value.imagenDestacada),
      resumen: data.get(#resumen, or: $value.resumen),
      tags: data.get(#tags, or: $value.tags),
      status: data.get(#status, or: $value.status),
      categoria: data.get(#categoria, or: $value.categoria),
      parents: data.get(#parents, or: $value.parents),
      comentarios: data.get(#comentarios, or: $value.comentarios),
      id: data.get(#id, or: $value.id),
      idProyecto: data.get(#idProyecto, or: $value.idProyecto),
      titulo: data.get(#titulo, or: $value.titulo),
      subEntregables: data.get(#subEntregables, or: $value.subEntregables),
      fechaCreacion: data.get(#fechaCreacion, or: $value.fechaCreacion));

  @override
  PublicacionCopyWith<$R2, Publicacion, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PublicacionCopyWithImpl($value, $cast, t);
}
