/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'articulo.dart' as _i2;
import 'cliente.dart' as _i3;
import 'comentario.dart' as _i4;
import 'entregable.dart' as _i5;
import 'informacion_de_contacto.dart' as _i6;
import 'mensaje_registro.dart' as _i7;
import 'organizacion.dart' as _i8;
import 'proyecto.dart' as _i9;
import 'publicacion.dart' as _i10;
import 'package:serverpod_auth_client/module.dart' as _i11;
export 'articulo.dart';
export 'cliente.dart';
export 'comentario.dart';
export 'entregable.dart';
export 'informacion_de_contacto.dart';
export 'mensaje_registro.dart';
export 'organizacion.dart';
export 'proyecto.dart';
export 'publicacion.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Articulo) {
      return _i2.Articulo.fromJson(data, this) as T;
    }
    if (t == _i3.Cliente) {
      return _i3.Cliente.fromJson(data, this) as T;
    }
    if (t == _i4.Comentario) {
      return _i4.Comentario.fromJson(data, this) as T;
    }
    if (t == _i5.Entregable) {
      return _i5.Entregable.fromJson(data, this) as T;
    }
    if (t == _i6.InformacionDeContacto) {
      return _i6.InformacionDeContacto.fromJson(data, this) as T;
    }
    if (t == _i7.MensajeRegistro) {
      return _i7.MensajeRegistro.fromJson(data, this) as T;
    }
    if (t == _i8.Organizacion) {
      return _i8.Organizacion.fromJson(data, this) as T;
    }
    if (t == _i9.Proyecto) {
      return _i9.Proyecto.fromJson(data, this) as T;
    }
    if (t == _i10.Publicacion) {
      return _i10.Publicacion.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Articulo?>()) {
      return (data != null ? _i2.Articulo.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Cliente?>()) {
      return (data != null ? _i3.Cliente.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Comentario?>()) {
      return (data != null ? _i4.Comentario.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Entregable?>()) {
      return (data != null ? _i5.Entregable.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.InformacionDeContacto?>()) {
      return (data != null
          ? _i6.InformacionDeContacto.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i7.MensajeRegistro?>()) {
      return (data != null ? _i7.MensajeRegistro.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i8.Organizacion?>()) {
      return (data != null ? _i8.Organizacion.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.Proyecto?>()) {
      return (data != null ? _i9.Proyecto.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.Publicacion?>()) {
      return (data != null ? _i10.Publicacion.fromJson(data, this) : null) as T;
    }
    try {
      return _i11.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i11.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Articulo) {
      return 'Articulo';
    }
    if (data is _i3.Cliente) {
      return 'Cliente';
    }
    if (data is _i4.Comentario) {
      return 'Comentario';
    }
    if (data is _i5.Entregable) {
      return 'Entregable';
    }
    if (data is _i6.InformacionDeContacto) {
      return 'InformacionDeContacto';
    }
    if (data is _i7.MensajeRegistro) {
      return 'MensajeRegistro';
    }
    if (data is _i8.Organizacion) {
      return 'Organizacion';
    }
    if (data is _i9.Proyecto) {
      return 'Proyecto';
    }
    if (data is _i10.Publicacion) {
      return 'Publicacion';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i11.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Articulo') {
      return deserialize<_i2.Articulo>(data['data']);
    }
    if (data['className'] == 'Cliente') {
      return deserialize<_i3.Cliente>(data['data']);
    }
    if (data['className'] == 'Comentario') {
      return deserialize<_i4.Comentario>(data['data']);
    }
    if (data['className'] == 'Entregable') {
      return deserialize<_i5.Entregable>(data['data']);
    }
    if (data['className'] == 'InformacionDeContacto') {
      return deserialize<_i6.InformacionDeContacto>(data['data']);
    }
    if (data['className'] == 'MensajeRegistro') {
      return deserialize<_i7.MensajeRegistro>(data['data']);
    }
    if (data['className'] == 'Organizacion') {
      return deserialize<_i8.Organizacion>(data['data']);
    }
    if (data['className'] == 'Proyecto') {
      return deserialize<_i9.Proyecto>(data['data']);
    }
    if (data['className'] == 'Publicacion') {
      return deserialize<_i10.Publicacion>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
