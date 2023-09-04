/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:prlab_server/utils/manejo_de_errores/manejo_de_errores.dart';
import 'package:serverpod/serverpod.dart' as _i1;

class ExceptionPrLab extends _i1.SerializableEntity
    implements _i1.SerializableException {
  ExceptionPrLab({
    required this.mensaje,
    required this.errorType,
  });

  factory ExceptionPrLab.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ExceptionPrLab(
      mensaje: serializationManager
          .deserialize<String>(jsonSerialization['mensaje']),
      errorType: serializationManager
          .deserialize<ErrorPrLab>(jsonSerialization['errorType']),
    );
  }

  String mensaje;

  ErrorPrLab errorType;

  @override
  Map<String, dynamic> toJson() {
    return {
      'mensaje': mensaje,
      'errorType': errorType,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'mensaje': mensaje,
      'errorType': errorType,
    };
  }
}
