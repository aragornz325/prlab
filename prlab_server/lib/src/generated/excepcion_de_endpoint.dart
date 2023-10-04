/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class ExcepcionCustom extends _i1.SerializableEntity
    implements _i1.SerializableException {
  ExcepcionCustom({
    required this.titulo,
    required this.mensaje,
    required this.tipoDeError,
    this.stackTrace,
    required this.codigoError,
  });

  factory ExcepcionCustom.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ExcepcionCustom(
      titulo:
          serializationManager.deserialize<String>(jsonSerialization['titulo']),
      mensaje: serializationManager
          .deserialize<String>(jsonSerialization['mensaje']),
      tipoDeError: serializationManager
          .deserialize<_i2.TipoExcepcion>(jsonSerialization['tipoDeError']),
      stackTrace: serializationManager
          .deserialize<String?>(jsonSerialization['stackTrace']),
      codigoError: serializationManager
          .deserialize<int>(jsonSerialization['codigoError']),
    );
  }

  String titulo;

  String mensaje;

  _i2.TipoExcepcion tipoDeError;

  String? stackTrace;

  int codigoError;

  @override
  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'mensaje': mensaje,
      'tipoDeError': tipoDeError,
      'stackTrace': stackTrace,
      'codigoError': codigoError,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'titulo': titulo,
      'mensaje': mensaje,
      'tipoDeError': tipoDeError,
      'stackTrace': stackTrace,
      'codigoError': codigoError,
    };
  }
}
