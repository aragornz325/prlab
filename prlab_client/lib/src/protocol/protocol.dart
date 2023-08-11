/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'example.dart' as _i2;
import 'package:prlab_commons/prlab_commons.dart' as _i3;
import 'package:serverpod_auth_client/module.dart' as _i4;
export 'example.dart';
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
    if (t == _i2.Example) {
      return _i2.Example.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Example?>()) {
      return (data != null ? _i2.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i3.Cliente) {
      return _i3.Cliente.fromJson(data, this) as T;
    }
    if (t == _i3.Comentario) {
      return _i3.Comentario.fromJson(data, this) as T;
    }
    if (t == _i3.MensajeRegistro) {
      return _i3.MensajeRegistro.fromJson(data, this) as T;
    }
    if (t == _i3.Organizacion) {
      return _i3.Organizacion.fromJson(data, this) as T;
    }
    if (t == _i3.Proyecto) {
      return _i3.Proyecto.fromJson(data, this) as T;
    }
    if (t == _i3.Publicacion) {
      return _i3.Publicacion.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.Cliente?>()) {
      return (data != null ? _i3.Cliente.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Comentario?>()) {
      return (data != null ? _i3.Comentario.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.MensajeRegistro?>()) {
      return (data != null ? _i3.MensajeRegistro.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i3.Organizacion?>()) {
      return (data != null ? _i3.Organizacion.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Proyecto?>()) {
      return (data != null ? _i3.Proyecto.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Publicacion?>()) {
      return (data != null ? _i3.Publicacion.fromJson(data, this) : null) as T;
    }
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i3.Cliente) {
      return 'Cliente';
    }
    if (data is _i3.Comentario) {
      return 'Comentario';
    }
    if (data is _i3.MensajeRegistro) {
      return 'MensajeRegistro';
    }
    if (data is _i3.Organizacion) {
      return 'Organizacion';
    }
    if (data is _i3.Proyecto) {
      return 'Proyecto';
    }
    if (data is _i3.Publicacion) {
      return 'Publicacion';
    }
    if (data is _i2.Example) {
      return 'Example';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i4.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Cliente') {
      return deserialize<_i3.Cliente>(data['data']);
    }
    if (data['className'] == 'Comentario') {
      return deserialize<_i3.Comentario>(data['data']);
    }
    if (data['className'] == 'MensajeRegistro') {
      return deserialize<_i3.MensajeRegistro>(data['data']);
    }
    if (data['className'] == 'Organizacion') {
      return deserialize<_i3.Organizacion>(data['data']);
    }
    if (data['className'] == 'Proyecto') {
      return deserialize<_i3.Proyecto>(data['data']);
    }
    if (data['className'] == 'Publicacion') {
      return deserialize<_i3.Publicacion>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i2.Example>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
