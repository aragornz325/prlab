// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organizacion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Organizacion _$OrganizacionFromJson(Map<String, dynamic> json) {
  return _Organizacion.fromJson(json);
}

/// @nodoc
mixin _$Organizacion {
  int get id => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  int get tipo => throw _privateConstructorUsedError;
  int get contacto => throw _privateConstructorUsedError;
  List<int> get idMiembros => throw _privateConstructorUsedError;
  List<int> get idProyectos => throw _privateConstructorUsedError;
  DateTime get fechaCreacion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizacionCopyWith<Organizacion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizacionCopyWith<$Res> {
  factory $OrganizacionCopyWith(
          Organizacion value, $Res Function(Organizacion) then) =
      _$OrganizacionCopyWithImpl<$Res, Organizacion>;
  @useResult
  $Res call(
      {int id,
      String nombre,
      int tipo,
      int contacto,
      List<int> idMiembros,
      List<int> idProyectos,
      DateTime fechaCreacion});
}

/// @nodoc
class _$OrganizacionCopyWithImpl<$Res, $Val extends Organizacion>
    implements $OrganizacionCopyWith<$Res> {
  _$OrganizacionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? tipo = null,
    Object? contacto = null,
    Object? idMiembros = null,
    Object? idProyectos = null,
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
      tipo: null == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as int,
      contacto: null == contacto
          ? _value.contacto
          : contacto // ignore: cast_nullable_to_non_nullable
              as int,
      idMiembros: null == idMiembros
          ? _value.idMiembros
          : idMiembros // ignore: cast_nullable_to_non_nullable
              as List<int>,
      idProyectos: null == idProyectos
          ? _value.idProyectos
          : idProyectos // ignore: cast_nullable_to_non_nullable
              as List<int>,
      fechaCreacion: null == fechaCreacion
          ? _value.fechaCreacion
          : fechaCreacion // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrganizacionCopyWith<$Res>
    implements $OrganizacionCopyWith<$Res> {
  factory _$$_OrganizacionCopyWith(
          _$_Organizacion value, $Res Function(_$_Organizacion) then) =
      __$$_OrganizacionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nombre,
      int tipo,
      int contacto,
      List<int> idMiembros,
      List<int> idProyectos,
      DateTime fechaCreacion});
}

/// @nodoc
class __$$_OrganizacionCopyWithImpl<$Res>
    extends _$OrganizacionCopyWithImpl<$Res, _$_Organizacion>
    implements _$$_OrganizacionCopyWith<$Res> {
  __$$_OrganizacionCopyWithImpl(
      _$_Organizacion _value, $Res Function(_$_Organizacion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? tipo = null,
    Object? contacto = null,
    Object? idMiembros = null,
    Object? idProyectos = null,
    Object? fechaCreacion = null,
  }) {
    return _then(_$_Organizacion(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      tipo: null == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as int,
      contacto: null == contacto
          ? _value.contacto
          : contacto // ignore: cast_nullable_to_non_nullable
              as int,
      idMiembros: null == idMiembros
          ? _value._idMiembros
          : idMiembros // ignore: cast_nullable_to_non_nullable
              as List<int>,
      idProyectos: null == idProyectos
          ? _value._idProyectos
          : idProyectos // ignore: cast_nullable_to_non_nullable
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
class _$_Organizacion implements _Organizacion {
  const _$_Organizacion(
      {required this.id,
      required this.nombre,
      required this.tipo,
      required this.contacto,
      required final List<int> idMiembros,
      required final List<int> idProyectos,
      required this.fechaCreacion})
      : _idMiembros = idMiembros,
        _idProyectos = idProyectos;

  factory _$_Organizacion.fromJson(Map<String, dynamic> json) =>
      _$$_OrganizacionFromJson(json);

  @override
  final int id;
  @override
  final String nombre;
  @override
  final int tipo;
  @override
  final int contacto;
  final List<int> _idMiembros;
  @override
  List<int> get idMiembros {
    if (_idMiembros is EqualUnmodifiableListView) return _idMiembros;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idMiembros);
  }

  final List<int> _idProyectos;
  @override
  List<int> get idProyectos {
    if (_idProyectos is EqualUnmodifiableListView) return _idProyectos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_idProyectos);
  }

  @override
  final DateTime fechaCreacion;

  @override
  String toString() {
    return 'Organizacion(id: $id, nombre: $nombre, tipo: $tipo, contacto: $contacto, idMiembros: $idMiembros, idProyectos: $idProyectos, fechaCreacion: $fechaCreacion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Organizacion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.tipo, tipo) || other.tipo == tipo) &&
            (identical(other.contacto, contacto) ||
                other.contacto == contacto) &&
            const DeepCollectionEquality()
                .equals(other._idMiembros, _idMiembros) &&
            const DeepCollectionEquality()
                .equals(other._idProyectos, _idProyectos) &&
            (identical(other.fechaCreacion, fechaCreacion) ||
                other.fechaCreacion == fechaCreacion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nombre,
      tipo,
      contacto,
      const DeepCollectionEquality().hash(_idMiembros),
      const DeepCollectionEquality().hash(_idProyectos),
      fechaCreacion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrganizacionCopyWith<_$_Organizacion> get copyWith =>
      __$$_OrganizacionCopyWithImpl<_$_Organizacion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrganizacionToJson(
      this,
    );
  }
}

abstract class _Organizacion implements Organizacion {
  const factory _Organizacion(
      {required final int id,
      required final String nombre,
      required final int tipo,
      required final int contacto,
      required final List<int> idMiembros,
      required final List<int> idProyectos,
      required final DateTime fechaCreacion}) = _$_Organizacion;

  factory _Organizacion.fromJson(Map<String, dynamic> json) =
      _$_Organizacion.fromJson;

  @override
  int get id;
  @override
  String get nombre;
  @override
  int get tipo;
  @override
  int get contacto;
  @override
  List<int> get idMiembros;
  @override
  List<int> get idProyectos;
  @override
  DateTime get fechaCreacion;
  @override
  @JsonKey(ignore: true)
  _$$_OrganizacionCopyWith<_$_Organizacion> get copyWith =>
      throw _privateConstructorUsedError;
}
