import 'package:prlab_server/src/repositorio.dart';

abstract class Servicio<T extends Repositorio> {
  late final T repositorio;

  // TODO(BACKEND): CREAR LOGGER ESPECIFICO
  // final logger = Logger('Servicio');

  // TODO(BACKEND): CREAR UN PERFORM OPERATION SERVICIO
}
