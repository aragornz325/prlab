import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serverpod/serverpod.dart';

part 'organizacion.freezed.dart';

part 'organizacion.g.dart';

/// Modelo de entidad Organizacion (que posee los proyectos).
@freezed
class Organizacion with _$Organizacion {
  const factory Organizacion({
    required int id,
    required String nombre,
    required int tipo,
    required int contacto,
    required List<int> idMiembros,
    required List<int> idProyectos,
    required DateTime fechaCreacion,
  }) = _Organizacion;

  /// Constructor propio de Freezed y requerido por Serverpod para la serialización de la clase.
  factory Organizacion.fromJson(
    Map<String, Object?> json,
    SerializationManager serializationManager,
  ) =>
      _$OrganizacionFromJson(json);
}
