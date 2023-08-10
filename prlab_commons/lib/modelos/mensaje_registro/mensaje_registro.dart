import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serverpod/serverpod.dart';

part 'mensaje_registro.freezed.dart';

part 'mensaje_registro.g.dart';

@freezed
class MensajeRegistro with _$MensajeRegistro {
  
  const factory MensajeRegistro({
    required int id,
    required String mensaje,
    required int autor,
    required DateTime fechaCreacion,
  }) = _MensajeRegistro;
  
  factory MensajeRegistro.fromJson(
    Map<String, Object?> json,
    SerializationManager serializationManager,
  ) =>
      _$MensajeRegistroFromJson(json);
}
