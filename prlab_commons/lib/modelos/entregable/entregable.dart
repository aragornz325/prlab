import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serverpod/serverpod.dart';

part 'entregable.freezed.dart';

part 'entregable.g.dart';

/// Modelo de entidad Entregable (Abstracción para heredar a otras clases como Publicacion, curso, etc).
@freezed
abstract class Entregable with _$Entregable {
  const factory Entregable({
    required int id,
    required int idProyecto,
    required String titulo,
    required List<int> idSubEntregables,
    required DateTime fechaCreacion,
  }) = _Entregable;

  /// Constructor propio de Freezed y requerido por Serverpod para la serialización de la clase.
  factory Entregable.fromJson(
    Map<String, Object?> json,
    SerializationManager serializationManager,
  ) =>
      _$EntregableFromJson(json);
}
