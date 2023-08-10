// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mensaje_registro.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MensajeRegistro _$MensajeRegistroFromJson(Map<String, dynamic> json) {
  return _MensajeRegistro.fromJson(json);
}

/// @nodoc
mixin _$MensajeRegistro {
  int get id => throw _privateConstructorUsedError;
  String get mensaje => throw _privateConstructorUsedError;
  int get autor => throw _privateConstructorUsedError;
  DateTime get fechaCreacion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MensajeRegistroCopyWith<MensajeRegistro> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MensajeRegistroCopyWith<$Res> {
  factory $MensajeRegistroCopyWith(
          MensajeRegistro value, $Res Function(MensajeRegistro) then) =
      _$MensajeRegistroCopyWithImpl<$Res, MensajeRegistro>;
  @useResult
  $Res call({int id, String mensaje, int autor, DateTime fechaCreacion});
}

/// @nodoc
class _$MensajeRegistroCopyWithImpl<$Res, $Val extends MensajeRegistro>
    implements $MensajeRegistroCopyWith<$Res> {
  _$MensajeRegistroCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mensaje = null,
    Object? autor = null,
    Object? fechaCreacion = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mensaje: null == mensaje
          ? _value.mensaje
          : mensaje // ignore: cast_nullable_to_non_nullable
              as String,
      autor: null == autor
          ? _value.autor
          : autor // ignore: cast_nullable_to_non_nullable
              as int,
      fechaCreacion: null == fechaCreacion
          ? _value.fechaCreacion
          : fechaCreacion // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MensajeRegistroCopyWith<$Res>
    implements $MensajeRegistroCopyWith<$Res> {
  factory _$$_MensajeRegistroCopyWith(
          _$_MensajeRegistro value, $Res Function(_$_MensajeRegistro) then) =
      __$$_MensajeRegistroCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String mensaje, int autor, DateTime fechaCreacion});
}

/// @nodoc
class __$$_MensajeRegistroCopyWithImpl<$Res>
    extends _$MensajeRegistroCopyWithImpl<$Res, _$_MensajeRegistro>
    implements _$$_MensajeRegistroCopyWith<$Res> {
  __$$_MensajeRegistroCopyWithImpl(
      _$_MensajeRegistro _value, $Res Function(_$_MensajeRegistro) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mensaje = null,
    Object? autor = null,
    Object? fechaCreacion = null,
  }) {
    return _then(_$_MensajeRegistro(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mensaje: null == mensaje
          ? _value.mensaje
          : mensaje // ignore: cast_nullable_to_non_nullable
              as String,
      autor: null == autor
          ? _value.autor
          : autor // ignore: cast_nullable_to_non_nullable
              as int,
      fechaCreacion: null == fechaCreacion
          ? _value.fechaCreacion
          : fechaCreacion // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MensajeRegistro implements _MensajeRegistro {
  const _$_MensajeRegistro(
      {required this.id,
      required this.mensaje,
      required this.autor,
      required this.fechaCreacion});

  factory _$_MensajeRegistro.fromJson(Map<String, dynamic> json) =>
      _$$_MensajeRegistroFromJson(json);

  @override
  final int id;
  @override
  final String mensaje;
  @override
  final int autor;
  @override
  final DateTime fechaCreacion;

  @override
  String toString() {
    return 'MensajeRegistro(id: $id, mensaje: $mensaje, autor: $autor, fechaCreacion: $fechaCreacion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MensajeRegistro &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mensaje, mensaje) || other.mensaje == mensaje) &&
            (identical(other.autor, autor) || other.autor == autor) &&
            (identical(other.fechaCreacion, fechaCreacion) ||
                other.fechaCreacion == fechaCreacion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mensaje, autor, fechaCreacion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MensajeRegistroCopyWith<_$_MensajeRegistro> get copyWith =>
      __$$_MensajeRegistroCopyWithImpl<_$_MensajeRegistro>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MensajeRegistroToJson(
      this,
    );
  }
}

abstract class _MensajeRegistro implements MensajeRegistro {
  const factory _MensajeRegistro(
      {required final int id,
      required final String mensaje,
      required final int autor,
      required final DateTime fechaCreacion}) = _$_MensajeRegistro;

  factory _MensajeRegistro.fromJson(Map<String, dynamic> json) =
      _$_MensajeRegistro.fromJson;

  @override
  int get id;
  @override
  String get mensaje;
  @override
  int get autor;
  @override
  DateTime get fechaCreacion;
  @override
  @JsonKey(ignore: true)
  _$$_MensajeRegistroCopyWith<_$_MensajeRegistro> get copyWith =>
      throw _privateConstructorUsedError;
}
