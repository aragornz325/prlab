import 'package:dart_mappable/dart_mappable.dart';
import 'package:prlab_commons/modelos/base/base.dart';

part 'entregable.mapper.dart';

/// Modelo de entidad Entregable (Abstracción para heredar a otras clases como Publicacion, curso, etc).
@MappableClass()
abstract class Entregable extends Base with EntregableMappable {
  Entregable({
    super.id,
    required this.nombre,
    required this.idAutor,
    this.fechaInicio,
    this.fechaFin,
    super.fechaCreacion,
  });

  String? nombre;
  int? idAutor;
  DateTime? fechaInicio;
  DateTime? fechaFin;
}
