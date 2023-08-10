import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serverpod/serverpod.dart';

part 'publicacion.freezed.dart';

part 'publicacion.g.dart';

@freezed
class Publicacion with _$Publicacion {
  
  const factory Publicacion({
    required String contenido,
    required int autor,
    required List<int> imagenes,
    required int imagenDestacada,
    required String resumen,
    required List<int> tags,
    required int status,
    required List<int> idCategorias,
    required List<int> parents,
    required List<int> comentarios,
    required int id,
    required int idProyecto,
    required String titulo,
    required List<int> idSubEntregables,
    required DateTime fechaCreacion,
  }) = _Publicacion;

  factory Publicacion.fromJson(
    Map<String, Object?> json,
    SerializationManager serializationManager,
  ) =>
      _$PublicacionFromJson(json);
}
