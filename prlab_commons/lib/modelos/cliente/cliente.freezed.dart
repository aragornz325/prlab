// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cliente.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cliente _$ClienteFromJson(Map<String, dynamic> json) {
  return _Cliente.fromJson(json);
}

/// @nodoc
mixin _$Cliente {
  int get id => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  int get idOrganizacion => throw _privateConstructorUsedError;
  int get contacto => throw _privateConstructorUsedError;
  DateTime get fechaCreacion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClienteCopyWith<Cliente> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClienteCopyWith<$Res> {
  factory $ClienteCopyWith(Cliente value, $Res Function(Cliente) then) =
      _$ClienteCopyWithImpl<$Res, Cliente>;
  @useResult
  $Res call(
      {int id,
      String nombre,
      int idOrganizacion,
      int contacto,
      DateTime fechaCreacion});
}

/// @nodoc
class _$ClienteCopyWithImpl<$Res, $Val extends Cliente>
    implements $ClienteCopyWith<$Res> {
  _$ClienteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? idOrganizacion = null,
    Object? contacto = null,
    Object? fechaCreacion = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      idOrganizacion: null == idOrganizacion
          ? _value.idOrganizacion
          : idOrganizacion // ignore: cast_nullable_to_non_nullable
              as int,
      contacto: null == contacto
          ? _value.contacto
          : contacto // ignore: cast_nullable_to_non_nullable
              as int,
      fechaCreacion: null == fechaCreacion
          ? _value.fechaCreacion
          : fechaCreacion // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClienteCopyWith<$Res> implements $ClienteCopyWith<$Res> {
  factory _$$_ClienteCopyWith(
          _$_Cliente value, $Res Function(_$_Cliente) then) =
      __$$_ClienteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nombre,
      int idOrganizacion,
      int contacto,
      DateTime fechaCreacion});
}

/// @nodoc
class __$$_ClienteCopyWithImpl<$Res>
    extends _$ClienteCopyWithImpl<$Res, _$_Cliente>
    implements _$$_ClienteCopyWith<$Res> {
  __$$_ClienteCopyWithImpl(_$_Cliente _value, $Res Function(_$_Cliente) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? idOrganizacion = null,
    Object? contacto = null,
    Object? fechaCreacion = null,
  }) {
    return _then(_$_Cliente(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      idOrganizacion: null == idOrganizacion
          ? _value.idOrganizacion
          : idOrganizacion // ignore: cast_nullable_to_non_nullable
              as int,
      contacto: null == contacto
          ? _value.contacto
          : contacto // ignore: cast_nullable_to_non_nullable
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
class _$_Cliente implements _Cliente {
  const _$_Cliente(
      {required this.id,
      required this.nombre,
      required this.idOrganizacion,
      required this.contacto,
      required this.fechaCreacion});

  factory _$_Cliente.fromJson(Map<String, dynamic> json) =>
      _$$_ClienteFromJson(json);

  @override
  final int id;
  @override
  final String nombre;
  @override
  final int idOrganizacion;
  @override
  final int contacto;
  @override
  final DateTime fechaCreacion;

  @override
  String toString() {
    return 'Cliente(id: $id, nombre: $nombre, idOrganizacion: $idOrganizacion, contacto: $contacto, fechaCreacion: $fechaCreacion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cliente &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.idOrganizacion, idOrganizacion) ||
                other.idOrganizacion == idOrganizacion) &&
            (identical(other.contacto, contacto) ||
                other.contacto == contacto) &&
            (identical(other.fechaCreacion, fechaCreacion) ||
                other.fechaCreacion == fechaCreacion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nombre, idOrganizacion, contacto, fechaCreacion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClienteCopyWith<_$_Cliente> get copyWith =>
      __$$_ClienteCopyWithImpl<_$_Cliente>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClienteToJson(
      this,
    );
  }
}

abstract class _Cliente implements Cliente {
  const factory _Cliente(
      {required final int id,
      required final String nombre,
      required final int idOrganizacion,
      required final int contacto,
      required final DateTime fechaCreacion}) = _$_Cliente;

  factory _Cliente.fromJson(Map<String, dynamic> json) = _$_Cliente.fromJson;

  @override
  int get id;
  @override
  String get nombre;
  @override
  int get idOrganizacion;
  @override
  int get contacto;
  @override
  DateTime get fechaCreacion;
  @override
  @JsonKey(ignore: true)
  _$$_ClienteCopyWith<_$_Cliente> get copyWith =>
      throw _privateConstructorUsedError;
}
