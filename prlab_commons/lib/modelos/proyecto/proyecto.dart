import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serverpod/serverpod.dart';

part 'proyecto.freezed.dart';

part 'proyecto.g.dart';

/// Modelo de entidad Proyecto (que depende de la Organizacion y que contiene entregables).
@freezed
class Proyecto with _$Proyecto {
  const factory Proyecto({
    required int id,
    required int idOrganizacion,
    required String nombre,
    required List<int> idEntregables,
    required DateTime fechaCreacion,
  }) = _Proyecto;

  /// Constructor propio de Freezed y requerido por Serverpod para la serialización de la clase.
  factory Proyecto.fromJson(
    Map<String, Object?> json,
    SerializationManager serializationManager,
  ) =>
      _$ProyectoFromJson(json);
}
