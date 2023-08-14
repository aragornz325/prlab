// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'cliente.dart';

class ClienteMapper extends ClassMapperBase<Cliente> {
  ClienteMapper._();

  static ClienteMapper? _instance;
  static ClienteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClienteMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Cliente';

  static int? _$id(Cliente v) => v.id;
  static const Field<Cliente, int> _f$id = Field('id', _$id, opt: true);
  static String? _$nombre(Cliente v) => v.nombre;
  static const Field<Cliente, String> _f$nombre = Field('nombre', _$nombre);
  static int? _$idOrganizacion(Cliente v) => v.idOrganizacion;
  static const Field<Cliente, int> _f$idOrganizacion =
      Field('idOrganizacion', _$idOrganizacion);
  static int? _$contacto(Cliente v) => v.contacto;
  static const Field<Cliente, int> _f$contacto = Field('contacto', _$contacto);
  static DateTime? _$fechaCreacion(Cliente v) => v.fechaCreacion;
  static const Field<Cliente, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion, key: 'fecha_creacion');

  @override
  final Map<Symbol, Field<Cliente, dynamic>> fields = const {
    #id: _f$id,
    #nombre: _f$nombre,
    #idOrganizacion: _f$idOrganizacion,
    #contacto: _f$contacto,
    #fechaCreacion: _f$fechaCreacion,
  };

  static Cliente _instantiate(DecodingData data) {
    return Cliente(
        id: data.dec(_f$id),
        nombre: data.dec(_f$nombre),
        idOrganizacion: data.dec(_f$idOrganizacion),
        contacto: data.dec(_f$contacto),
        fechaCreacion: data.dec(_f$fechaCreacion));
  }

  @override
  final Function instantiate = _instantiate;

  static Cliente fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Cliente>(map));
  }

  static Cliente fromJson(String json) {
    return _guard((c) => c.fromJson<Cliente>(json));
  }
}

mixin ClienteMappable {
  String toJson() {
    return ClienteMapper._guard((c) => c.toJson(this as Cliente));
  }

  Map<String, dynamic> toMap() {
    return ClienteMapper._guard((c) => c.toMap(this as Cliente));
  }

  ClienteCopyWith<Cliente, Cliente, Cliente> get copyWith =>
      _ClienteCopyWithImpl(this as Cliente, $identity, $identity);
  @override
  String toString() {
    return ClienteMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ClienteMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ClienteMapper._guard((c) => c.hash(this));
  }
}

extension ClienteValueCopy<$R, $Out> on ObjectCopyWith<$R, Cliente, $Out> {
  ClienteCopyWith<$R, Cliente, $Out> get $asCliente =>
      $base.as((v, t, t2) => _ClienteCopyWithImpl(v, t, t2));
}

abstract class ClienteCopyWith<$R, $In extends Cliente, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? nombre,
      int? idOrganizacion,
      int? contacto,
      DateTime? fechaCreacion});
  ClienteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ClienteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Cliente, $Out>
    implements ClienteCopyWith<$R, Cliente, $Out> {
  _ClienteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Cliente> $mapper =
      ClienteMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? nombre = $none,
          Object? idOrganizacion = $none,
          Object? contacto = $none,
          Object? fechaCreacion = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (nombre != $none) #nombre: nombre,
        if (idOrganizacion != $none) #idOrganizacion: idOrganizacion,
        if (contacto != $none) #contacto: contacto,
        if (fechaCreacion != $none) #fechaCreacion: fechaCreacion
      }));
  @override
  Cliente $make(CopyWithData data) => Cliente(
      id: data.get(#id, or: $value.id),
      nombre: data.get(#nombre, or: $value.nombre),
      idOrganizacion: data.get(#idOrganizacion, or: $value.idOrganizacion),
      contacto: data.get(#contacto, or: $value.contacto),
      fechaCreacion: data.get(#fechaCreacion, or: $value.fechaCreacion));

  @override
  ClienteCopyWith<$R2, Cliente, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ClienteCopyWithImpl($value, $cast, t);
}
