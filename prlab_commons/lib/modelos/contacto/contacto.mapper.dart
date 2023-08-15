// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'contacto.dart';

class ContactoMapper extends ClassMapperBase<Contacto> {
  ContactoMapper._();

  static ContactoMapper? _instance;
  static ContactoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContactoMapper._());
      BaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Contacto';

  static int? _$id(Contacto v) => v.id;
  static const Field<Contacto, int> _f$id = Field('id', _$id, opt: true);
  static String? _$emailPrincipal(Contacto v) => v.emailPrincipal;
  static const Field<Contacto, String> _f$emailPrincipal =
      Field('emailPrincipal', _$emailPrincipal, key: 'email_principal');
  static String? _$telefonoPrincipal(Contacto v) => v.telefonoPrincipal;
  static const Field<Contacto, String> _f$telefonoPrincipal = Field(
      'telefonoPrincipal', _$telefonoPrincipal,
      key: 'telefono_principal');
  static String? _$emailSecundario(Contacto v) => v.emailSecundario;
  static const Field<Contacto, String> _f$emailSecundario =
      Field('emailSecundario', _$emailSecundario, key: 'email_secundario');
  static String? _$telefonoSecundario(Contacto v) => v.telefonoSecundario;
  static const Field<Contacto, String> _f$telefonoSecundario = Field(
      'telefonoSecundario', _$telefonoSecundario,
      key: 'telefono_secundario');
  static String? _$domicilioCalle(Contacto v) => v.domicilioCalle;
  static const Field<Contacto, String> _f$domicilioCalle =
      Field('domicilioCalle', _$domicilioCalle, key: 'domicilio_calle');
  static int? _$domicilioNumero(Contacto v) => v.domicilioNumero;
  static const Field<Contacto, int> _f$domicilioNumero =
      Field('domicilioNumero', _$domicilioNumero, key: 'domicilio_numero');
  static String? _$domicilioCiudad(Contacto v) => v.domicilioCiudad;
  static const Field<Contacto, String> _f$domicilioCiudad =
      Field('domicilioCiudad', _$domicilioCiudad, key: 'domicilio_ciudad');
  static String? _$domicilioCodigoPostal(Contacto v) => v.domicilioCodigoPostal;
  static const Field<Contacto, String> _f$domicilioCodigoPostal = Field(
      'domicilioCodigoPostal', _$domicilioCodigoPostal,
      key: 'domicilio_codigo_postal');
  static String? _$domicilioEstadoProvincia(Contacto v) =>
      v.domicilioEstadoProvincia;
  static const Field<Contacto, String> _f$domicilioEstadoProvincia = Field(
      'domicilioEstadoProvincia', _$domicilioEstadoProvincia,
      key: 'domicilio_estado_provincia');
  static String? _$domicilioPais(Contacto v) => v.domicilioPais;
  static const Field<Contacto, String> _f$domicilioPais =
      Field('domicilioPais', _$domicilioPais, key: 'domicilio_pais');
  static DateTime? _$fechaCreacion(Contacto v) => v.fechaCreacion;
  static const Field<Contacto, DateTime> _f$fechaCreacion =
      Field('fechaCreacion', _$fechaCreacion, key: 'fecha_creacion', opt: true);

  @override
  final Map<Symbol, Field<Contacto, dynamic>> fields = const {
    #id: _f$id,
    #emailPrincipal: _f$emailPrincipal,
    #telefonoPrincipal: _f$telefonoPrincipal,
    #emailSecundario: _f$emailSecundario,
    #telefonoSecundario: _f$telefonoSecundario,
    #domicilioCalle: _f$domicilioCalle,
    #domicilioNumero: _f$domicilioNumero,
    #domicilioCiudad: _f$domicilioCiudad,
    #domicilioCodigoPostal: _f$domicilioCodigoPostal,
    #domicilioEstadoProvincia: _f$domicilioEstadoProvincia,
    #domicilioPais: _f$domicilioPais,
    #fechaCreacion: _f$fechaCreacion,
  };

  static Contacto _instantiate(DecodingData data) {
    return Contacto(
        id: data.dec(_f$id),
        emailPrincipal: data.dec(_f$emailPrincipal),
        telefonoPrincipal: data.dec(_f$telefonoPrincipal),
        emailSecundario: data.dec(_f$emailSecundario),
        telefonoSecundario: data.dec(_f$telefonoSecundario),
        domicilioCalle: data.dec(_f$domicilioCalle),
        domicilioNumero: data.dec(_f$domicilioNumero),
        domicilioCiudad: data.dec(_f$domicilioCiudad),
        domicilioCodigoPostal: data.dec(_f$domicilioCodigoPostal),
        domicilioEstadoProvincia: data.dec(_f$domicilioEstadoProvincia),
        domicilioPais: data.dec(_f$domicilioPais),
        fechaCreacion: data.dec(_f$fechaCreacion));
  }

  @override
  final Function instantiate = _instantiate;

  static Contacto fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Contacto>(map));
  }

  static Contacto fromJson(String json) {
    return _guard((c) => c.fromJson<Contacto>(json));
  }
}

mixin ContactoMappable {
  String toJson() {
    return ContactoMapper._guard((c) => c.toJson(this as Contacto));
  }

  Map<String, dynamic> toMap() {
    return ContactoMapper._guard((c) => c.toMap(this as Contacto));
  }

  ContactoCopyWith<Contacto, Contacto, Contacto> get copyWith =>
      _ContactoCopyWithImpl(this as Contacto, $identity, $identity);
  @override
  String toString() {
    return ContactoMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ContactoMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ContactoMapper._guard((c) => c.hash(this));
  }
}

extension ContactoValueCopy<$R, $Out> on ObjectCopyWith<$R, Contacto, $Out> {
  ContactoCopyWith<$R, Contacto, $Out> get $asContacto =>
      $base.as((v, t, t2) => _ContactoCopyWithImpl(v, t, t2));
}

abstract class ContactoCopyWith<$R, $In extends Contacto, $Out>
    implements BaseCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {int? id,
      String? emailPrincipal,
      String? telefonoPrincipal,
      String? emailSecundario,
      String? telefonoSecundario,
      String? domicilioCalle,
      int? domicilioNumero,
      String? domicilioCiudad,
      String? domicilioCodigoPostal,
      String? domicilioEstadoProvincia,
      String? domicilioPais,
      DateTime? fechaCreacion});
  ContactoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ContactoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Contacto, $Out>
    implements ContactoCopyWith<$R, Contacto, $Out> {
  _ContactoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Contacto> $mapper =
      ContactoMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? emailPrincipal = $none,
          Object? telefonoPrincipal = $none,
          Object? emailSecundario = $none,
          Object? telefonoSecundario = $none,
          Object? domicilioCalle = $none,
          Object? domicilioNumero = $none,
          Object? domicilioCiudad = $none,
          Object? domicilioCodigoPostal = $none,
          Object? domicilioEstadoProvincia = $none,
          Object? domicilioPais = $none,
          Object? fechaCreacion = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (emailPrincipal != $none) #emailPrincipal: emailPrincipal,
        if (telefonoPrincipal != $none) #telefonoPrincipal: telefonoPrincipal,
        if (emailSecundario != $none) #emailSecundario: emailSecundario,
        if (telefonoSecundario != $none)
          #telefonoSecundario: telefonoSecundario,
        if (domicilioCalle != $none) #domicilioCalle: domicilioCalle,
        if (domicilioNumero != $none) #domicilioNumero: domicilioNumero,
        if (domicilioCiudad != $none) #domicilioCiudad: domicilioCiudad,
        if (domicilioCodigoPostal != $none)
          #domicilioCodigoPostal: domicilioCodigoPostal,
        if (domicilioEstadoProvincia != $none)
          #domicilioEstadoProvincia: domicilioEstadoProvincia,
        if (domicilioPais != $none) #domicilioPais: domicilioPais,
        if (fechaCreacion != $none) #fechaCreacion: fechaCreacion
      }));
  @override
  Contacto $make(CopyWithData data) => Contacto(
      id: data.get(#id, or: $value.id),
      emailPrincipal: data.get(#emailPrincipal, or: $value.emailPrincipal),
      telefonoPrincipal:
          data.get(#telefonoPrincipal, or: $value.telefonoPrincipal),
      emailSecundario: data.get(#emailSecundario, or: $value.emailSecundario),
      telefonoSecundario:
          data.get(#telefonoSecundario, or: $value.telefonoSecundario),
      domicilioCalle: data.get(#domicilioCalle, or: $value.domicilioCalle),
      domicilioNumero: data.get(#domicilioNumero, or: $value.domicilioNumero),
      domicilioCiudad: data.get(#domicilioCiudad, or: $value.domicilioCiudad),
      domicilioCodigoPostal:
          data.get(#domicilioCodigoPostal, or: $value.domicilioCodigoPostal),
      domicilioEstadoProvincia: data.get(#domicilioEstadoProvincia,
          or: $value.domicilioEstadoProvincia),
      domicilioPais: data.get(#domicilioPais, or: $value.domicilioPais),
      fechaCreacion: data.get(#fechaCreacion, or: $value.fechaCreacion));

  @override
  ContactoCopyWith<$R2, Contacto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ContactoCopyWithImpl($value, $cast, t);
}
