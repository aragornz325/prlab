// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comentario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comentario _$ComentarioFromJson(Map<String, dynamic> json) {
  return _Comentario.fromJson(json);
}

/// @nodoc
mixin _$Comentario {
  int get id => throw _privateConstructorUsedError;
  int get idPublicacion => throw _privateConstructorUsedError;
  List<double> get offset => throw _privateConstructorUsedError;
  String get comentario => throw _privateConstructorUsedError;
  DateTime get fechaCreacion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComentarioCopyWith<Comentario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComentarioCopyWith<$Res> {
  factory $ComentarioCopyWith(
          Comentario value, $Res Function(Comentario) then) =
      _$ComentarioCopyWithImpl<$Res, Comentario>;
  @useResult
  $Res call(
      {int id,
      int idPublicacion,
      List<double> offset,
      String comentario,
      DateTime fechaCreacion});
}

/// @nodoc
class _$ComentarioCopyWithImpl<$Res, $Val extends Comentario>
    implements $ComentarioCopyWith<$Res> {
  _$ComentarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idPublicacion = null,
    Object? offset = null,
    Object? comentario = null,
    Object? fechaCreacion = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idPublicacion: null == idPublicacion
          ? _value.idPublicacion
          : idPublicacion // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as List<double>,
      comentario: null == comentario
          ? _value.comentario
          : comentario // ignore: cast_nullable_to_non_nullable
              as String,
      fechaCreacion: null == fechaCreacion
          ? _value.fechaCreacion
          : fechaCreacion // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComentarioCopyWith<$Res>
    implements $ComentarioCopyWith<$Res> {
  factory _$$_ComentarioCopyWith(
          _$_Comentario value, $Res Function(_$_Comentario) then) =
      __$$_ComentarioCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int idPublicacion,
      List<double> offset,
      String comentario,
      DateTime fechaCreacion});
}

/// @nodoc
class __$$_ComentarioCopyWithImpl<$Res>
    extends _$ComentarioCopyWithImpl<$Res, _$_Comentario>
    implements _$$_ComentarioCopyWith<$Res> {
  __$$_ComentarioCopyWithImpl(
      _$_Comentario _value, $Res Function(_$_Comentario) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idPublicacion = null,
    Object? offset = null,
    Object? comentario = null,
    Object? fechaCreacion = null,
  }) {
    return _then(_$_Comentario(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idPublicacion: null == idPublicacion
          ? _value.idPublicacion
          : idPublicacion // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value._offset
          : offset // ignore: cast_nullable_to_non_nullable
              as List<double>,
      comentario: null == comentario
          ? _value.comentario
          : comentario // ignore: cast_nullable_to_non_nullable
              as String,
      fechaCreacion: null == fechaCreacion
          ? _value.fechaCreacion
          : fechaCreacion // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comentario implements _Comentario {
  const _$_Comentario(
      {required this.id,
      required this.idPublicacion,
      required final List<double> offset,
      required this.comentario,
      required this.fechaCreacion})
      : _offset = offset;

  factory _$_Comentario.fromJson(Map<String, dynamic> json) =>
      _$$_ComentarioFromJson(json);

  @override
  final int id;
  @override
  final int idPublicacion;
  final List<double> _offset;
  @override
  List<double> get offset {
    if (_offset is EqualUnmodifiableListView) return _offset;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offset);
  }

  @override
  final String comentario;
  @override
  final DateTime fechaCreacion;

  @override
  String toString() {
    return 'Comentario(id: $id, idPublicacion: $idPublicacion, offset: $offset, comentario: $comentario, fechaCreacion: $fechaCreacion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comentario &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idPublicacion, idPublicacion) ||
                other.idPublicacion == idPublicacion) &&
            const DeepCollectionEquality().equals(other._offset, _offset) &&
            (identical(other.comentario, comentario) ||
                other.comentario == comentario) &&
            (identical(other.fechaCreacion, fechaCreacion) ||
                other.fechaCreacion == fechaCreacion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, idPublicacion,
      const DeepCollectionEquality().hash(_offset), comentario, fechaCreacion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComentarioCopyWith<_$_Comentario> get copyWith =>
      __$$_ComentarioCopyWithImpl<_$_Comentario>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComentarioToJson(
      this,
    );
  }
}

abstract class _Comentario implements Comentario {
  const factory _Comentario(
      {required final int id,
      required final int idPublicacion,
      required final List<double> offset,
      required final String comentario,
      required final DateTime fechaCreacion}) = _$_Comentario;

  factory _Comentario.fromJson(Map<String, dynamic> json) =
      _$_Comentario.fromJson;

  @override
  int get id;
  @override
  int get idPublicacion;
  @override
  List<double> get offset;
  @override
  String get comentario;
  @override
  DateTime get fechaCreacion;
  @override
  @JsonKey(ignore: true)
  _$$_ComentarioCopyWith<_$_Comentario> get copyWith =>
      throw _privateConstructorUsedError;
}
