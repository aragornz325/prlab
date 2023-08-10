import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serverpod/serverpod.dart';

part 'mensaje_registro.freezed.dart';

part 'mensaje_registro.g.dart';

/// Modelo de entidad MensajeRegistro (logs de actividad).
@freezed
class MensajeRegistro with _$MensajeRegistro {
  const factory MensajeRegistro({
    required int id,
    required String mensaje,
    required int autor,
    required DateTime fechaCreacion,
  }) = _MensajeRegistro;

  /// Constructor propio de Freezed y requerido por Serverpod para la serialización de la clase.
  factory MensajeRegistro.fromJson(
    Map<String, Object?> json,
    SerializationManager serializationManager,
  ) =>
      _$MensajeRegistroFromJson(json);
}
