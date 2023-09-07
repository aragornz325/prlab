/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:prlab_client/src/manejo_de_errores/manejo_de_errores.dart';
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class ExcepcionPrLab extends _i1.SerializableEntity
    implements _i1.SerializableException {
  ExcepcionPrLab({
    required this.mensaje,
    required this.errorType,
  });

  factory ExcepcionPrLab.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ExcepcionPrLab(
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
}
