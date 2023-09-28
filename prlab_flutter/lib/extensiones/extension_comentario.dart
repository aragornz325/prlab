import 'package:intl/intl.dart';
import 'package:prlab_client/prlab_client.dart';

/// {@template ComentarioX}
/// Extension de la clase Comentario para sacar la informacion de dicho
/// comentario para mostrarla
/// {@endtemplate}
extension ComentarioX on Comentario {
  /// nombre completo de quien comento el articulo.
  String get nombreComepletoDelComentario => '$nombre $apellido';

  String get fechaComentarioCreada => DateFormat("dd/MM/yyyy, HH:mm").format(
        fechaCreacion ?? DateTime.now(),
      );
}
