import 'dart:typed_data';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:prlab_server/src/generated/protocol.dart' as _i14;
import 'package:prlab_server/src/generated/articulo.dart' as _i15;
import 'package:prlab_server/src/generated/marca.dart' as _i16;

class AdministradorSerializacion extends SerializationManager{
  
  @override
  T deserialize<T>(data, [Type? t]) {
    t ??= T;

    //TODO: all the "dart native" types should be listed here
    if (t == int || t == getType<int?>()) {
      return data;
    } else if (t == double || t == getType<double?>()) {
      return (data as num?)?.toDouble() as T;
    } else if (t == String || t == getType<String?>()) {
      return data;
    } else if (t == bool || t == getType<bool?>()) {
      return data;
    } else if (t == DateTime || t == getType<DateTime?>()) {
      return DateTime.tryParse(data.toString()) as T;
    } else if (t == getType<DateTime?>()) {
      return DateTime.tryParse(data ?? '')?.toUtc() as T;
    } else if (t == ByteData) {
      return (data as String).base64DecodedByteData()! as T;
    } else if (t == getType<ByteData?>()) {
      return (data as String?)?.base64DecodedByteData() as T;
    } else if (t == Duration) {
      return Duration(milliseconds: (data as int)) as T;
    } else if (t == getType<Duration?>()) {
      return data == null ? data : Duration(milliseconds: (data as int)) as T;
    } else if (t == UuidValue) {
      return UuidValue(data as String) as T;
    } else if (t == getType<UuidValue?>()) {
      return (data == null ? null : UuidValue(data as String)) as T;
    } else if (t == _i1.getType<List<_i14.Cliente>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.Cliente>(e)).toList()
          : null) as dynamic;
    } else if (t == List<_i15.Articulo>) {
      return (data as List).map((e) => deserialize<_i15.Articulo>(e)).toList()
          as dynamic;
    } else if (t == List<_i16.Marca>) {
      return (data as List).map((e) => deserialize<_i16.Marca>(e)).toList()
          as dynamic;
    } else if (t == List<List<dynamic>>) {
      return (data as List).map((e) => deserialize<List<dynamic>>(e)).toList()
          as dynamic;
    } else if (t == List<dynamic>) {
      return (data as List).map((e) => deserialize<dynamic>(e)).toList()
          as dynamic;
    }    
    throw FormatException('No deserialization found for type $t');
  }
}
