// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'mensaje_registro.dart';

class MensajeRegistroMapper extends ClassMapperBase<MensajeRegistro> {
  MensajeRegistroMapper._();

  static MensajeRegistroMapper? _instance;
  static MensajeRegistroMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MensajeRegistroMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'MensajeRegistro';

  static int? _$id(MensajeRegistro v) => v.id;
  static const Field<MensajeRegistro, int> _f$id = Field('id', _$id, opt: true);
  static String _$mensaje(MensajeRegistro v) => v.mensaje;
  static const Field<MensajeRegistro, String> _f$mensaje =
      Field('mensaje', _$mensaje);
  static int _$idUsuario(MensajeRegistro v) => v.idUsuario;
  static const Field<MensajeRegistro, int> _f$idUsuario =
      Field('idUsuario', _$idUsuario);
  static DateTime? _$fechaCreacion(MensajeRegistro v) => v.fechaCreacion;
  static const Field<MensajeRegistro, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion, opt: true);

  @override
  final Map<Symbol, Field<MensajeRegistro, dynamic>> fields = const {
    #id: _f$id,
    #mensaje: _f$mensaje,
    #idUsuario: _f$idUsuario,
    #fechaCreacion: _f$fechaCreacion,
  };
  @override
  final bool ignoreNull = true;

  static MensajeRegistro _instantiate(DecodingData data) {
    return MensajeRegistro(
        id: data.dec(_f$id),
        mensaje: data.dec(_f$mensaje),
        idUsuario: data.dec(_f$idUsuario),
        fechaCreacion: data.dec(_f$fechaCreacion));
  }

  @override
  final Function instantiate = _instantiate;

  static MensajeRegistro fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<MensajeRegistro>(map));
  }

  static MensajeRegistro fromJson(String json) {
    return _guard((c) => c.fromJson<MensajeRegistro>(json));
  }
}

mixin MensajeRegistroMappable {
  String toJson() {
    return MensajeRegistroMapper._guard(
        (c) => c.toJson(this as MensajeRegistro));
  }

  Map<String, dynamic> toMap() {
    return MensajeRegistroMapper._guard(
        (c) => c.toMap(this as MensajeRegistro));
  }

  MensajeRegistroCopyWith<MensajeRegistro, MensajeRegistro, MensajeRegistro>
      get copyWith => _MensajeRegistroCopyWithImpl(
          this as MensajeRegistro, $identity, $identity);
  @override
  String toString() {
    return MensajeRegistroMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            MensajeRegistroMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return MensajeRegistroMapper._guard((c) => c.hash(this));
  }
}

extension MensajeRegistroValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MensajeRegistro, $Out> {
  MensajeRegistroCopyWith<$R, MensajeRegistro, $Out> get $asMensajeRegistro =>
      $base.as((v, t, t2) => _MensajeRegistroCopyWithImpl(v, t, t2));
}

abstract class MensajeRegistroCopyWith<$R, $In extends MensajeRegistro, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? mensaje, int? idUsuario, DateTime? fechaCreacion});
  MensajeRegistroCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MensajeRegistroCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MensajeRegistro, $Out>
    implements MensajeRegistroCopyWith<$R, MensajeRegistro, $Out> {
  _MensajeRegistroCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MensajeRegistro> $mapper =
      MensajeRegistroMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          String? mensaje,
          int? idUsuario,
          Object? fechaCreacion = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (mensaje != null) #mensaje: mensaje,
        if (idUsuario != null) #idUsuario: idUsuario,
        if (fechaCreacion != $none) #fechaCreacion: fechaCreacion
      }));
  @override
  MensajeRegistro $make(CopyWithData data) => MensajeRegistro(
      id: data.get(#id, or: $value.id),
      mensaje: data.get(#mensaje, or: $value.mensaje),
      idUsuario: data.get(#idUsuario, or: $value.idUsuario),
      fechaCreacion: data.get(#fechaCreacion, or: $value.fechaCreacion));

  @override
  MensajeRegistroCopyWith<$R2, MensajeRegistro, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MensajeRegistroCopyWithImpl($value, $cast, t);
}
