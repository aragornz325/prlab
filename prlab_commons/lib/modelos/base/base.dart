import 'package:dart_mappable/dart_mappable.dart';
import 'package:serverpod/serverpod.dart';

part 'base.mapper.dart';

/// Modelo de entidad abstracta Base (contiene elementos comunes).
@MappableClass()
abstract class Base extends TableRow with BaseMappable {
  Base({
    int? id,
    this.fechaCreacion,
  }) : super(id);

  DateTime? fechaCreacion;
}
