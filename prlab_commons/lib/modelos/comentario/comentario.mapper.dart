// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'comentario.dart';

class ComentarioMapper extends ClassMapperBase<Comentario> {
  ComentarioMapper._();

  static ComentarioMapper? _instance;
  static ComentarioMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ComentarioMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Comentario';

  static int? _$id(Comentario v) => v.id;
  static const Field<Comentario, int> _f$id = Field('id', _$id, opt: true);
  static int _$idPublicacion(Comentario v) => v.idPublicacion;
  static const Field<Comentario, int> _f$idPublicacion =
      Field('idPublicacion', _$idPublicacion);
  static Set<double> _$offset(Comentario v) => v.offset;
  static const Field<Comentario, Set<double>> _f$offset =
      Field('offset', _$offset);
  static String _$comentario(Comentario v) => v.comentario;
  static const Field<Comentario, String> _f$comentario =
      Field('comentario', _$comentario);
  static DateTime _$fechaCreacion(Comentario v) => v.fechaCreacion;
  static const Field<Comentario, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion, key: 'fecha_creacion');

  @override
  final Map<Symbol, Field<Comentario, dynamic>> fields = const {
    #id: _f$id,
    #idPublicacion: _f$idPublicacion,
    #offset: _f$offset,
    #comentario: _f$comentario,
    #fechaCreacion: _f$fechaCreacion,
  };

  static Comentario _instantiate(DecodingData data) {
    return Comentario(
        id: data.dec(_f$id),
        idPublicacion: data.dec(_f$idPublicacion),
        offset: data.dec(_f$offset),
        comentario: data.dec(_f$comentario),
        fechaCreacion: data.dec(_f$fechaCreacion));
  }

  @override
  final Function instantiate = _instantiate;

  static Comentario fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Comentario>(map));
  }

  static Comentario fromJson(String json) {
    return _guard((c) => c.fromJson<Comentario>(json));
  }
}

mixin ComentarioMappable {
  String toJson() {
    return ComentarioMapper._guard((c) => c.toJson(this as Comentario));
  }

  Map<String, dynamic> toMap() {
    return ComentarioMapper._guard((c) => c.toMap(this as Comentario));
  }

  ComentarioCopyWith<Comentario, Comentario, Comentario> get copyWith =>
      _ComentarioCopyWithImpl(this as Comentario, $identity, $identity);
  @override
  String toString() {
    return ComentarioMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ComentarioMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ComentarioMapper._guard((c) => c.hash(this));
  }
}

extension ComentarioValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Comentario, $Out> {
  ComentarioCopyWith<$R, Comentario, $Out> get $asComentario =>
      $base.as((v, t, t2) => _ComentarioCopyWithImpl(v, t, t2));
}

abstract class ComentarioCopyWith<$R, $In extends Comentario, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      int? idPublicacion,
      Set<double>? offset,
      String? comentario,
      DateTime? fechaCreacion});
  ComentarioCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ComentarioCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Comentario, $Out>
    implements ComentarioCopyWith<$R, Comentario, $Out> {
  _ComentarioCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Comentario> $mapper =
      ComentarioMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          int? idPublicacion,
          Set<double>? offset,
          String? comentario,
          DateTime? fechaCreacion}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (idPublicacion != null) #idPublicacion: idPublicacion,
        if (offset != null) #offset: offset,
        if (comentario != null) #comentario: comentario,
        if (fechaCreacion != null) #fechaCreacion: fechaCreacion
      }));
  @override
  Comentario $make(CopyWithData data) => Comentario(
      id: data.get(#id, or: $value.id),
      idPublicacion: data.get(#idPublicacion, or: $value.idPublicacion),
      offset: data.get(#offset, or: $value.offset),
      comentario: data.get(#comentario, or: $value.comentario),
      fechaCreacion: data.get(#fechaCreacion, or: $value.fechaCreacion));

  @override
  ComentarioCopyWith<$R2, Comentario, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ComentarioCopyWithImpl($value, $cast, t);
}
