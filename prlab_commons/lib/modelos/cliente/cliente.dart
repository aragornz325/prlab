import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serverpod/serverpod.dart';

part 'cliente.freezed.dart';

part 'cliente.g.dart';

@freezed
class Cliente with _$Cliente {
  
  const factory Cliente({
    required int id,
    required String nombre,
    required int idOrganizacion,
    required int contacto,
    required DateTime fechaCreacion,
  }) = _Cliente;

  factory Cliente.fromJson(
    Map<String, Object?> json,
    SerializationManager serializationManager,
  ) =>
      _$ClienteFromJson(json);
}
