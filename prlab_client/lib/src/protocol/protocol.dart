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
import 'marca.dart' as _i7;
import 'mensaje_registro.dart' as _i8;
import 'organizacion.dart' as _i9;
import 'proyecto.dart' as _i10;
import 'publicacion.dart' as _i11;
import 'protocol.dart' as _i12;
import 'package:prlab_client/src/protocol/articulo.dart' as _i13;
import 'package:prlab_client/src/protocol/marca.dart' as _i14;
import 'package:prlab_client/src/protocol/cliente.dart' as _i15;
import 'package:serverpod_auth_client/module.dart' as _i16;
export 'articulo.dart';
export 'cliente.dart';
export 'comentario.dart';
export 'entregable.dart';
export 'informacion_de_contacto.dart';
export 'marca.dart';
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
    if (t == _i7.Marca) {
      return _i7.Marca.fromJson(data, this) as T;
    }
    if (t == _i8.MensajeRegistro) {
      return _i8.MensajeRegistro.fromJson(data, this) as T;
    }
    if (t == _i9.Organizacion) {
      return _i9.Organizacion.fromJson(data, this) as T;
    }
    if (t == _i10.Proyecto) {
      return _i10.Proyecto.fromJson(data, this) as T;
    }
    if (t == _i11.Publicacion) {
      return _i11.Publicacion.fromJson(data, this) as T;
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
    if (t == _i1.getType<_i7.Marca?>()) {
      return (data != null ? _i7.Marca.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.MensajeRegistro?>()) {
      return (data != null ? _i8.MensajeRegistro.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i9.Organizacion?>()) {
      return (data != null ? _i9.Organizacion.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.Proyecto?>()) {
      return (data != null ? _i10.Proyecto.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i11.Publicacion?>()) {
      return (data != null ? _i11.Publicacion.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i12.Cliente>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.Cliente>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i12.Articulo>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.Articulo>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i13.Articulo>) {
      return (data as List).map((e) => deserialize<_i13.Articulo>(e)).toList()
          as dynamic;
    }
    if (t == List<_i14.Marca>) {
      return (data as List).map((e) => deserialize<_i14.Marca>(e)).toList()
          as dynamic;
    }
    if (t == List<List<dynamic>>) {
      return (data as List).map((e) => deserialize<List<dynamic>>(e)).toList()
          as dynamic;
    }
    if (t == List<dynamic>) {
      return (data as List).map((e) => deserialize<dynamic>(e)).toList()
          as dynamic;
    }
    if (t == List<_i15.Cliente>) {
      return (data as List).map((e) => deserialize<_i15.Cliente>(e)).toList()
          as dynamic;
    }
    try {
      return _i16.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i16.Protocol().getClassNameForObject(data);
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
    if (data is _i7.Marca) {
      return 'Marca';
    }
    if (data is _i8.MensajeRegistro) {
      return 'MensajeRegistro';
    }
    if (data is _i9.Organizacion) {
      return 'Organizacion';
    }
    if (data is _i10.Proyecto) {
      return 'Proyecto';
    }
    if (data is _i11.Publicacion) {
      return 'Publicacion';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i16.Protocol().deserializeByClassName(data);
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
    if (data['className'] == 'Marca') {
      return deserialize<_i7.Marca>(data['data']);
    }
    if (data['className'] == 'MensajeRegistro') {
      return deserialize<_i8.MensajeRegistro>(data['data']);
    }
    if (data['className'] == 'Organizacion') {
      return deserialize<_i9.Organizacion>(data['data']);
    }
    if (data['className'] == 'Proyecto') {
      return deserialize<_i10.Proyecto>(data['data']);
    }
    if (data['className'] == 'Publicacion') {
      return deserialize<_i11.Publicacion>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
