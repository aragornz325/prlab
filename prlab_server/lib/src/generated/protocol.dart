/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/module.dart' as _i3;
import 'example.dart' as _i4;
import 'package:prlab_commons/prlab_commons.dart' as _i5;
export 'example.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final targetDatabaseDefinition = _i2.DatabaseDefinition(tables: [
    ..._i3.Protocol.targetDatabaseDefinition.tables,
    ..._i2.Protocol.targetDatabaseDefinition.tables,
  ]);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i4.Example) {
      return _i4.Example.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.Example?>()) {
      return (data != null ? _i4.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i5.Cliente) {
      return _i5.Cliente.fromJson(data, this) as T;
    }
    if (t == _i5.Comentario) {
      return _i5.Comentario.fromJson(data, this) as T;
    }
    if (t == _i5.MensajeRegistro) {
      return _i5.MensajeRegistro.fromJson(data, this) as T;
    }
    if (t == _i5.Organizacion) {
      return _i5.Organizacion.fromJson(data, this) as T;
    }
    if (t == _i5.Proyecto) {
      return _i5.Proyecto.fromJson(data, this) as T;
    }
    if (t == _i5.Publicacion) {
      return _i5.Publicacion.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i5.Cliente?>()) {
      return (data != null ? _i5.Cliente.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Comentario?>()) {
      return (data != null ? _i5.Comentario.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.MensajeRegistro?>()) {
      return (data != null ? _i5.MensajeRegistro.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i5.Organizacion?>()) {
      return (data != null ? _i5.Organizacion.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Proyecto?>()) {
      return (data != null ? _i5.Proyecto.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Publicacion?>()) {
      return (data != null ? _i5.Publicacion.fromJson(data, this) : null) as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i5.Cliente) {
      return 'Cliente';
    }
    if (data is _i5.Comentario) {
      return 'Comentario';
    }
    if (data is _i5.MensajeRegistro) {
      return 'MensajeRegistro';
    }
    if (data is _i5.Organizacion) {
      return 'Organizacion';
    }
    if (data is _i5.Proyecto) {
      return 'Proyecto';
    }
    if (data is _i5.Publicacion) {
      return 'Publicacion';
    }
    if (data is _i4.Example) {
      return 'Example';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Cliente') {
      return deserialize<_i5.Cliente>(data['data']);
    }
    if (data['className'] == 'Comentario') {
      return deserialize<_i5.Comentario>(data['data']);
    }
    if (data['className'] == 'MensajeRegistro') {
      return deserialize<_i5.MensajeRegistro>(data['data']);
    }
    if (data['className'] == 'Organizacion') {
      return deserialize<_i5.Organizacion>(data['data']);
    }
    if (data['className'] == 'Proyecto') {
      return deserialize<_i5.Proyecto>(data['data']);
    }
    if (data['className'] == 'Publicacion') {
      return deserialize<_i5.Publicacion>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i4.Example>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    return null;
  }

  @override
  _i2.DatabaseDefinition getTargetDatabaseDefinition() =>
      targetDatabaseDefinition;
}
