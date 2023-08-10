// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proyecto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Proyecto _$ProyectoFromJson(Map<String, dynamic> json) {
  return _Proyecto.fromJson(json);
}

/// @nodoc
mixin _$Proyecto {
  int get id => throw _privateConstructorUsedError;
  int get idOrganizacion => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  List<int> get idEntregables => throw _privateConstructorUsedError;
  DateTime get fechaCreacion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProyectoCopyWith<Proyecto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProyectoCopyWith<$Res> {
  factory $ProyectoCopyWith(Proyecto value, $Res Function(Proyecto) then) =
      _$ProyectoCopyWithImpl<$Res, Proyecto>;
  @useResult
  $Res call(
      {int id,
      int idOrganizacion,
      String nombre,
      List<int> idEntregables,
      DateTime fechaCreacion});
}

/// @nodoc
class _$ProyectoCopyWithImpl<$Res, $Val extends Proyecto>
    implements $ProyectoCopyWith<$Res> {
  _$ProyectoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idOrganizacion = null,
    Object? nombre = null,
    Object? idEntregables = null,
    Object? fechaCreacion = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idOrganizacion: null == idOrganizacion
          ? _value.idOrganizacion
          : idOrganizacion // ignore: cast_nullable_to_non_nullable
              as int,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      idEntregables: null == idEntregables
          ? _value.idEntregables
          : idEntregables // ignore: cast_nullable_to_non_nullable
              as List<int>,
      fechaCreacion: null == fechaCreacion
          ? _value.fechaCreacion
          : fechaCreacion // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProyectoCopyWith<$Res> implements $ProyectoCopyWith<$Res> {
  factory _$$_ProyectoCopyWith(
          _$_Proyecto value, $Res Function(_$_Proyecto) then) =
      __$$_ProyectoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int idOrganizacion,
      String nombre,
      List<int> idEntregables,
      DateTime fechaCreacion});
}

/// @nodoc
class __$$_ProyectoCopyWithImpl<$Res>
    extends _$ProyectoCopyWithImpl<$Res, _$_Proyecto>
    implements _$$_ProyectoCopyWith<$Res> {
  __$$_ProyectoCopyWithImpl(
      _$_Proyecto _value, $Res Function(_$_Proyecto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idOrganizacion = null,
    Object? nombre = null,
    Object? idEntregables = null,
    Object? fechaCreacion = null,
  }) {
    return _then(_$_Proyecto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idOrganizacion: null == idOrganizacion
          ? _value.idOrganizacion
          : idOrganizacion // ignore: cast_nullable_to_non_nullable
              as int,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      idEntregables: null == idEntregables
          ? _value._idEntregables
          : idEntregables // ignore: cast_nullable_to_non_nullable
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
class _$_Proyecto implements _Proyecto {
  const _$_Proyecto(
      {required this.id,
      required this.idOrganizacion,
      required this.nombre,
      required final List<int> idEntregables,
      required this.fechaCreacion})
      : _idEntregables = idEntregables;

  factory _$_Proyecto.fromJson(Map<String, dynamic> json) =>
      _$$_ProyectoFromJson(json);

  @override
  final int id;
  @override
  final int idOrganizacion;
  @override
  final String nombre;
  final List<int> _idEntregables;
  @override
  List<int> get idEntregables {
    if (_idEntregables is EqualUnmodifiableListView) return _idEntregables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idEntregables);
  }

  @override
  final DateTime fechaCreacion;

  @override
  String toString() {
    return 'Proyecto(id: $id, idOrganizacion: $idOrganizacion, nombre: $nombre, idEntregables: $idEntregables, fechaCreacion: $fechaCreacion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Proyecto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idOrganizacion, idOrganizacion) ||
                other.idOrganizacion == idOrganizacion) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            const DeepCollectionEquality()
                .equals(other._idEntregables, _idEntregables) &&
            (identical(other.fechaCreacion, fechaCreacion) ||
                other.fechaCreacion == fechaCreacion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, idOrganizacion, nombre,
      const DeepCollectionEquality().hash(_idEntregables), fechaCreacion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProyectoCopyWith<_$_Proyecto> get copyWith =>
      __$$_ProyectoCopyWithImpl<_$_Proyecto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProyectoToJson(
      this,
    );
  }
}

abstract class _Proyecto implements Proyecto {
  const factory _Proyecto(
      {required final int id,
      required final int idOrganizacion,
      required final String nombre,
      required final List<int> idEntregables,
      required final DateTime fechaCreacion}) = _$_Proyecto;

  factory _Proyecto.fromJson(Map<String, dynamic> json) = _$_Proyecto.fromJson;

  @override
  int get id;
  @override
  int get idOrganizacion;
  @override
  String get nombre;
  @override
  List<int> get idEntregables;
  @override
  DateTime get fechaCreacion;
  @override
  @JsonKey(ignore: true)
  _$$_ProyectoCopyWith<_$_Proyecto> get copyWith =>
      throw _privateConstructorUsedError;
}
