import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serverpod/serverpod.dart';

part 'comentario.freezed.dart';

part 'comentario.g.dart';

@freezed
class Comentario with _$Comentario {

  const factory Comentario({
    required int id,
    required int idPublicacion,
    required List<double> offset,
    required String comentario,
    required DateTime fechaCreacion,
  }) = _Comentario;

factory Comentario.fromJson(
    Map<String, Object?> json,
    SerializationManager serializationManager,
  ) =>
      _$ComentarioFromJson(json);
}

