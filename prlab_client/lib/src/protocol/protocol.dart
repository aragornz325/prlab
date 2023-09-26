/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'cliente.dart' as _i2;
import 'comentario.dart' as _i3;
import 'entregable.dart' as _i4;
import 'entregable_articulo.dart' as _i5;
import 'excepcion_de_endpoint.dart' as _i6;
import 'excepciones/tipo_excepcion.dart' as _i7;
import 'imagen_articulo.dart' as _i8;
import 'informacion_de_contacto.dart' as _i9;
import 'marca.dart' as _i10;
import 'mensaje_registro.dart' as _i11;
import 'organizacion.dart' as _i12;
import 'periodista.dart' as _i13;
import 'proyecto.dart' as _i14;
import 'publicacion.dart' as _i15;
import 'protocol.dart' as _i16;
import 'package:prlab_client/src/protocol/cliente.dart' as _i17;
import 'package:prlab_client/src/protocol/comentario.dart' as _i18;
import 'package:prlab_client/src/protocol/entregable_articulo.dart' as _i19;
import 'package:prlab_client/src/protocol/marca.dart' as _i20;
import 'package:prlab_client/src/protocol/periodista.dart' as _i21;
import 'package:serverpod_auth_client/module.dart' as _i22;
export 'cliente.dart';
export 'comentario.dart';
export 'entregable.dart';
export 'entregable_articulo.dart';
export 'excepcion_de_endpoint.dart';
export 'excepciones/tipo_excepcion.dart';
export 'imagen_articulo.dart';
export 'informacion_de_contacto.dart';
export 'marca.dart';
export 'mensaje_registro.dart';
export 'organizacion.dart';
export 'periodista.dart';
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
    if (t == _i2.Cliente) {
      return _i2.Cliente.fromJson(data, this) as T;
    }
    if (t == _i3.Comentario) {
      return _i3.Comentario.fromJson(data, this) as T;
    }
    if (t == _i4.Entregable) {
      return _i4.Entregable.fromJson(data, this) as T;
    }
    if (t == _i5.EntregableArticulo) {
      return _i5.EntregableArticulo.fromJson(data, this) as T;
    }
    if (t == _i6.ExcepcionCustom) {
      return _i6.ExcepcionCustom.fromJson(data, this) as T;
    }
    if (t == _i7.TipoExcepcion) {
      return _i7.TipoExcepcion.fromJson(data) as T;
    }
    if (t == _i8.ImagenArticulo) {
      return _i8.ImagenArticulo.fromJson(data, this) as T;
    }
    if (t == _i9.InformacionDeContacto) {
      return _i9.InformacionDeContacto.fromJson(data, this) as T;
    }
    if (t == _i10.Marca) {
      return _i10.Marca.fromJson(data, this) as T;
    }
    if (t == _i11.MensajeRegistro) {
      return _i11.MensajeRegistro.fromJson(data, this) as T;
    }
    if (t == _i12.Organizacion) {
      return _i12.Organizacion.fromJson(data, this) as T;
    }
    if (t == _i13.Periodista) {
      return _i13.Periodista.fromJson(data, this) as T;
    }
    if (t == _i14.Proyecto) {
      return _i14.Proyecto.fromJson(data, this) as T;
    }
    if (t == _i15.Publicacion) {
      return _i15.Publicacion.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Cliente?>()) {
      return (data != null ? _i2.Cliente.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Comentario?>()) {
      return (data != null ? _i3.Comentario.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Entregable?>()) {
      return (data != null ? _i4.Entregable.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.EntregableArticulo?>()) {
      return (data != null ? _i5.EntregableArticulo.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i6.ExcepcionCustom?>()) {
      return (data != null ? _i6.ExcepcionCustom.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i7.TipoExcepcion?>()) {
      return (data != null ? _i7.TipoExcepcion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ImagenArticulo?>()) {
      return (data != null ? _i8.ImagenArticulo.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i9.InformacionDeContacto?>()) {
      return (data != null
          ? _i9.InformacionDeContacto.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i10.Marca?>()) {
      return (data != null ? _i10.Marca.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i11.MensajeRegistro?>()) {
      return (data != null ? _i11.MensajeRegistro.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i12.Organizacion?>()) {
      return (data != null ? _i12.Organizacion.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i13.Periodista?>()) {
      return (data != null ? _i13.Periodista.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i14.Proyecto?>()) {
      return (data != null ? _i14.Proyecto.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i15.Publicacion?>()) {
      return (data != null ? _i15.Publicacion.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i16.Cliente>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i16.Cliente>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i16.EntregableArticulo>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i16.EntregableArticulo>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i17.Cliente>) {
      return (data as List).map((e) => deserialize<_i17.Cliente>(e)).toList()
          as dynamic;
    }
    if (t == List<_i18.Comentario>) {
      return (data as List).map((e) => deserialize<_i18.Comentario>(e)).toList()
          as dynamic;
    }
    if (t == List<_i19.EntregableArticulo>) {
      return (data as List)
          .map((e) => deserialize<_i19.EntregableArticulo>(e))
          .toList() as dynamic;
    }
    if (t == List<_i20.Marca>) {
      return (data as List).map((e) => deserialize<_i20.Marca>(e)).toList()
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
    if (t == List<_i21.Periodista>) {
      return (data as List).map((e) => deserialize<_i21.Periodista>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == Map<dynamic, dynamic>) {
      return Map.fromEntries((data as List).map((e) => MapEntry(
              deserialize<dynamic>(e['k']), deserialize<dynamic>(e['v']))))
          as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    try {
      return _i22.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i22.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Cliente) {
      return 'Cliente';
    }
    if (data is _i3.Comentario) {
      return 'Comentario';
    }
    if (data is _i4.Entregable) {
      return 'Entregable';
    }
    if (data is _i5.EntregableArticulo) {
      return 'EntregableArticulo';
    }
    if (data is _i6.ExcepcionCustom) {
      return 'ExcepcionCustom';
    }
    if (data is _i7.TipoExcepcion) {
      return 'TipoExcepcion';
    }
    if (data is _i8.ImagenArticulo) {
      return 'ImagenArticulo';
    }
    if (data is _i9.InformacionDeContacto) {
      return 'InformacionDeContacto';
    }
    if (data is _i10.Marca) {
      return 'Marca';
    }
    if (data is _i11.MensajeRegistro) {
      return 'MensajeRegistro';
    }
    if (data is _i12.Organizacion) {
      return 'Organizacion';
    }
    if (data is _i13.Periodista) {
      return 'Periodista';
    }
    if (data is _i14.Proyecto) {
      return 'Proyecto';
    }
    if (data is _i15.Publicacion) {
      return 'Publicacion';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i22.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Cliente') {
      return deserialize<_i2.Cliente>(data['data']);
    }
    if (data['className'] == 'Comentario') {
      return deserialize<_i3.Comentario>(data['data']);
    }
    if (data['className'] == 'Entregable') {
      return deserialize<_i4.Entregable>(data['data']);
    }
    if (data['className'] == 'EntregableArticulo') {
      return deserialize<_i5.EntregableArticulo>(data['data']);
    }
    if (data['className'] == 'ExcepcionCustom') {
      return deserialize<_i6.ExcepcionCustom>(data['data']);
    }
    if (data['className'] == 'TipoExcepcion') {
      return deserialize<_i7.TipoExcepcion>(data['data']);
    }
    if (data['className'] == 'ImagenArticulo') {
      return deserialize<_i8.ImagenArticulo>(data['data']);
    }
    if (data['className'] == 'InformacionDeContacto') {
      return deserialize<_i9.InformacionDeContacto>(data['data']);
    }
    if (data['className'] == 'Marca') {
      return deserialize<_i10.Marca>(data['data']);
    }
    if (data['className'] == 'MensajeRegistro') {
      return deserialize<_i11.MensajeRegistro>(data['data']);
    }
    if (data['className'] == 'Organizacion') {
      return deserialize<_i12.Organizacion>(data['data']);
    }
    if (data['className'] == 'Periodista') {
      return deserialize<_i13.Periodista>(data['data']);
    }
    if (data['className'] == 'Proyecto') {
      return deserialize<_i14.Proyecto>(data['data']);
    }
    if (data['className'] == 'Publicacion') {
      return deserialize<_i15.Publicacion>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
