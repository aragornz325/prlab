/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'categoria_filtro.dart' as _i2;
import 'categorias_filtro.dart' as _i3;
import 'cliente.dart' as _i4;
import 'comentario.dart' as _i5;
import 'entregable.dart' as _i6;
import 'entregable_articulo.dart' as _i7;
import 'excepcion_de_endpoint.dart' as _i8;
import 'excepciones/tipo_excepcion.dart' as _i9;
import 'imagen_articulo.dart' as _i10;
import 'informacion_de_contacto.dart' as _i11;
import 'marca.dart' as _i12;
import 'mensaje_registro.dart' as _i13;
import 'organizacion.dart' as _i14;
import 'periodista.dart' as _i15;
import 'proyecto.dart' as _i16;
import 'publicacion.dart' as _i17;
import 'red_social.dart' as _i18;
import 'protocol.dart' as _i19;
import 'package:prlab_client/src/protocol/cliente.dart' as _i20;
import 'package:prlab_client/src/protocol/comentario.dart' as _i21;
import 'package:prlab_client/src/protocol/entregable_articulo.dart' as _i22;
import 'package:prlab_client/src/protocol/marca.dart' as _i23;
import 'package:prlab_client/src/protocol/periodista.dart' as _i24;
import 'package:serverpod_auth_client/module.dart' as _i25;
export 'categoria_filtro.dart';
export 'categorias_filtro.dart';
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
export 'red_social.dart';
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
    if (t == _i2.CategoriaFiltro) {
      return _i2.CategoriaFiltro.fromJson(data, this) as T;
    }
    if (t == _i3.CategoriasFiltro) {
      return _i3.CategoriasFiltro.fromJson(data, this) as T;
    }
    if (t == _i4.Cliente) {
      return _i4.Cliente.fromJson(data, this) as T;
    }
    if (t == _i5.Comentario) {
      return _i5.Comentario.fromJson(data, this) as T;
    }
    if (t == _i6.Entregable) {
      return _i6.Entregable.fromJson(data, this) as T;
    }
    if (t == _i7.EntregableArticulo) {
      return _i7.EntregableArticulo.fromJson(data, this) as T;
    }
    if (t == _i8.ExcepcionCustom) {
      return _i8.ExcepcionCustom.fromJson(data, this) as T;
    }
    if (t == _i9.TipoExcepcion) {
      return _i9.TipoExcepcion.fromJson(data) as T;
    }
    if (t == _i10.ImagenArticulo) {
      return _i10.ImagenArticulo.fromJson(data, this) as T;
    }
    if (t == _i11.InformacionDeContacto) {
      return _i11.InformacionDeContacto.fromJson(data, this) as T;
    }
    if (t == _i12.Marca) {
      return _i12.Marca.fromJson(data, this) as T;
    }
    if (t == _i13.MensajeRegistro) {
      return _i13.MensajeRegistro.fromJson(data, this) as T;
    }
    if (t == _i14.Organizacion) {
      return _i14.Organizacion.fromJson(data, this) as T;
    }
    if (t == _i15.Periodista) {
      return _i15.Periodista.fromJson(data, this) as T;
    }
    if (t == _i16.Proyecto) {
      return _i16.Proyecto.fromJson(data, this) as T;
    }
    if (t == _i17.Publicacion) {
      return _i17.Publicacion.fromJson(data, this) as T;
    }
    if (t == _i18.RedSocial) {
      return _i18.RedSocial.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.CategoriaFiltro?>()) {
      return (data != null ? _i2.CategoriaFiltro.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i3.CategoriasFiltro?>()) {
      return (data != null ? _i3.CategoriasFiltro.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i4.Cliente?>()) {
      return (data != null ? _i4.Cliente.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Comentario?>()) {
      return (data != null ? _i5.Comentario.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.Entregable?>()) {
      return (data != null ? _i6.Entregable.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.EntregableArticulo?>()) {
      return (data != null ? _i7.EntregableArticulo.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i8.ExcepcionCustom?>()) {
      return (data != null ? _i8.ExcepcionCustom.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i9.TipoExcepcion?>()) {
      return (data != null ? _i9.TipoExcepcion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ImagenArticulo?>()) {
      return (data != null ? _i10.ImagenArticulo.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i11.InformacionDeContacto?>()) {
      return (data != null
          ? _i11.InformacionDeContacto.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i12.Marca?>()) {
      return (data != null ? _i12.Marca.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i13.MensajeRegistro?>()) {
      return (data != null ? _i13.MensajeRegistro.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i14.Organizacion?>()) {
      return (data != null ? _i14.Organizacion.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i15.Periodista?>()) {
      return (data != null ? _i15.Periodista.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i16.Proyecto?>()) {
      return (data != null ? _i16.Proyecto.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i17.Publicacion?>()) {
      return (data != null ? _i17.Publicacion.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i18.RedSocial?>()) {
      return (data != null ? _i18.RedSocial.fromJson(data, this) : null) as T;
    }
    if (t == List<_i19.CategoriaFiltro>) {
      return (data as List)
          .map((e) => deserialize<_i19.CategoriaFiltro>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<List<_i19.Cliente>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i19.Cliente>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i19.EntregableArticulo>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i19.EntregableArticulo>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i19.RedSocial>) {
      return (data as List).map((e) => deserialize<_i19.RedSocial>(e)).toList()
          as dynamic;
    }
    if (t == List<_i20.Cliente>) {
      return (data as List).map((e) => deserialize<_i20.Cliente>(e)).toList()
          as dynamic;
    }
    if (t == List<_i21.Comentario>) {
      return (data as List).map((e) => deserialize<_i21.Comentario>(e)).toList()
          as dynamic;
    }
    if (t == List<_i22.EntregableArticulo>) {
      return (data as List)
          .map((e) => deserialize<_i22.EntregableArticulo>(e))
          .toList() as dynamic;
    }
    if (t == List<_i23.Marca>) {
      return (data as List).map((e) => deserialize<_i23.Marca>(e)).toList()
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
    if (t == List<_i24.Periodista>) {
      return (data as List).map((e) => deserialize<_i24.Periodista>(e)).toList()
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
      return _i25.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i25.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.CategoriaFiltro) {
      return 'CategoriaFiltro';
    }
    if (data is _i3.CategoriasFiltro) {
      return 'CategoriasFiltro';
    }
    if (data is _i4.Cliente) {
      return 'Cliente';
    }
    if (data is _i5.Comentario) {
      return 'Comentario';
    }
    if (data is _i6.Entregable) {
      return 'Entregable';
    }
    if (data is _i7.EntregableArticulo) {
      return 'EntregableArticulo';
    }
    if (data is _i8.ExcepcionCustom) {
      return 'ExcepcionCustom';
    }
    if (data is _i9.TipoExcepcion) {
      return 'TipoExcepcion';
    }
    if (data is _i10.ImagenArticulo) {
      return 'ImagenArticulo';
    }
    if (data is _i11.InformacionDeContacto) {
      return 'InformacionDeContacto';
    }
    if (data is _i12.Marca) {
      return 'Marca';
    }
    if (data is _i13.MensajeRegistro) {
      return 'MensajeRegistro';
    }
    if (data is _i14.Organizacion) {
      return 'Organizacion';
    }
    if (data is _i15.Periodista) {
      return 'Periodista';
    }
    if (data is _i16.Proyecto) {
      return 'Proyecto';
    }
    if (data is _i17.Publicacion) {
      return 'Publicacion';
    }
    if (data is _i18.RedSocial) {
      return 'RedSocial';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i25.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'CategoriaFiltro') {
      return deserialize<_i2.CategoriaFiltro>(data['data']);
    }
    if (data['className'] == 'CategoriasFiltro') {
      return deserialize<_i3.CategoriasFiltro>(data['data']);
    }
    if (data['className'] == 'Cliente') {
      return deserialize<_i4.Cliente>(data['data']);
    }
    if (data['className'] == 'Comentario') {
      return deserialize<_i5.Comentario>(data['data']);
    }
    if (data['className'] == 'Entregable') {
      return deserialize<_i6.Entregable>(data['data']);
    }
    if (data['className'] == 'EntregableArticulo') {
      return deserialize<_i7.EntregableArticulo>(data['data']);
    }
    if (data['className'] == 'ExcepcionCustom') {
      return deserialize<_i8.ExcepcionCustom>(data['data']);
    }
    if (data['className'] == 'TipoExcepcion') {
      return deserialize<_i9.TipoExcepcion>(data['data']);
    }
    if (data['className'] == 'ImagenArticulo') {
      return deserialize<_i10.ImagenArticulo>(data['data']);
    }
    if (data['className'] == 'InformacionDeContacto') {
      return deserialize<_i11.InformacionDeContacto>(data['data']);
    }
    if (data['className'] == 'Marca') {
      return deserialize<_i12.Marca>(data['data']);
    }
    if (data['className'] == 'MensajeRegistro') {
      return deserialize<_i13.MensajeRegistro>(data['data']);
    }
    if (data['className'] == 'Organizacion') {
      return deserialize<_i14.Organizacion>(data['data']);
    }
    if (data['className'] == 'Periodista') {
      return deserialize<_i15.Periodista>(data['data']);
    }
    if (data['className'] == 'Proyecto') {
      return deserialize<_i16.Proyecto>(data['data']);
    }
    if (data['className'] == 'Publicacion') {
      return deserialize<_i17.Publicacion>(data['data']);
    }
    if (data['className'] == 'RedSocial') {
      return deserialize<_i18.RedSocial>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
