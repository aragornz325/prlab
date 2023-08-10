// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entregable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Entregable _$EntregableFromJson(Map<String, dynamic> json) {
  return _Entregable.fromJson(json);
}

/// @nodoc
mixin _$Entregable {
  int get id => throw _privateConstructorUsedError;
  int get idProyecto => throw _privateConstructorUsedError;
  String get titulo => throw _privateConstructorUsedError;
  List<int> get idSubEntregables => throw _privateConstructorUsedError;
  DateTime get fechaCreacion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntregableCopyWith<Entregable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntregableCopyWith<$Res> {
  factory $EntregableCopyWith(
          Entregable value, $Res Function(Entregable) then) =
      _$EntregableCopyWithImpl<$Res, Entregable>;
  @useResult
  $Res call(
      {int id,
      int idProyecto,
      String titulo,
      List<int> idSubEntregables,
      DateTime fechaCreacion});
}

/// @nodoc
class _$EntregableCopyWithImpl<$Res, $Val extends Entregable>
    implements $EntregableCopyWith<$Res> {
  _$EntregableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idProyecto = null,
    Object? titulo = null,
    Object? idSubEntregables = null,
    Object? fechaCreacion = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idProyecto: null == idProyecto
          ? _value.idProyecto
          : idProyecto // ignore: cast_nullable_to_non_nullable
              as int,
      titulo: null == titulo
          ? _value.titulo
          : titulo // ignore: cast_nullable_to_non_nullable
              as String,
      idSubEntregables: null == idSubEntregables
          ? _value.idSubEntregables
          : idSubEntregables // ignore: cast_nullable_to_non_nullable
              as List<int>,
      fechaCreacion: null == fechaCreacion
          ? _value.fechaCreacion
          : fechaCreacion // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EntregableCopyWith<$Res>
    implements $EntregableCopyWith<$Res> {
  factory _$$_EntregableCopyWith(
          _$_Entregable value, $Res Function(_$_Entregable) then) =
      __$$_EntregableCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int idProyecto,
      String titulo,
      List<int> idSubEntregables,
      DateTime fechaCreacion});
}

/// @nodoc
class __$$_EntregableCopyWithImpl<$Res>
    extends _$EntregableCopyWithImpl<$Res, _$_Entregable>
    implements _$$_EntregableCopyWith<$Res> {
  __$$_EntregableCopyWithImpl(
      _$_Entregable _value, $Res Function(_$_Entregable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idProyecto = null,
    Object? titulo = null,
    Object? idSubEntregables = null,
    Object? fechaCreacion = null,
  }) {
    return _then(_$_Entregable(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idProyecto: null == idProyecto
          ? _value.idProyecto
          : idProyecto // ignore: cast_nullable_to_non_nullable
              as int,
      titulo: null == titulo
          ? _value.titulo
          : titulo // ignore: cast_nullable_to_non_nullable
              as String,
      idSubEntregables: null == idSubEntregables
          ? _value._idSubEntregables
          : idSubEntregables // ignore: cast_nullable_to_non_nullable
              as List<int>,
      fechaCreacion: null == fechaCreacion
          ? _value.fechaCreacion
          : fechaCreacion // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Entregable implements _Entregable {
  const _$_Entregable(
      {required this.id,
      required this.idProyecto,
      required this.titulo,
      required final List<int> idSubEntregables,
      required this.fechaCreacion})
      : _idSubEntregables = idSubEntregables;

  factory _$_Entregable.fromJson(Map<String, dynamic> json) =>
      _$$_EntregableFromJson(json);

  @override
  final int id;
  @override
  final int idProyecto;
  @override
  final String titulo;
  final List<int> _idSubEntregables;
  @override
  List<int> get idSubEntregables {
    if (_idSubEntregables is EqualUnmodifiableListView)
      return _idSubEntregables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idSubEntregables);
  }

  @override
  final DateTime fechaCreacion;

  @override
  String toString() {
    return 'Entregable(id: $id, idProyecto: $idProyecto, titulo: $titulo, idSubEntregables: $idSubEntregables, fechaCreacion: $fechaCreacion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Entregable &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idProyecto, idProyecto) ||
                other.idProyecto == idProyecto) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            const DeepCollectionEquality()
                .equals(other._idSubEntregables, _idSubEntregables) &&
            (identical(other.fechaCreacion, fechaCreacion) ||
                other.fechaCreacion == fechaCreacion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, idProyecto, titulo,
      const DeepCollectionEquality().hash(_idSubEntregables), fechaCreacion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EntregableCopyWith<_$_Entregable> get copyWith =>
      __$$_EntregableCopyWithImpl<_$_Entregable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EntregableToJson(
      this,
    );
  }
}

abstract class _Entregable implements Entregable {
  const factory _Entregable(
      {required final int id,
      required final int idProyecto,
      required final String titulo,
      required final List<int> idSubEntregables,
      required final DateTime fechaCreacion}) = _$_Entregable;

  factory _Entregable.fromJson(Map<String, dynamic> json) =
      _$_Entregable.fromJson;

  @override
  int get id;
  @override
  int get idProyecto;
  @override
  String get titulo;
  @override
  List<int> get idSubEntregables;
  @override
  DateTime get fechaCreacion;
  @override
  @JsonKey(ignore: true)
  _$$_EntregableCopyWith<_$_Entregable> get copyWith =>
      throw _privateConstructorUsedError;
}
