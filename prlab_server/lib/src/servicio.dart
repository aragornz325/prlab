import 'package:prlab_server/src/odm.dart';
import 'package:serverpod/server.dart';

abstract class Servicio<T extends ODM> {

  /// Variable con la instancia del odm.
  late final T odm;

  // TODO(BACKEND): CREAR LOGGER ESPECIFICO
  // final logger = Logger('Servicio');

  // TODO(BACKEND): CREAR UN PERFORM OPERATION SERVICIO
  
  /// Metodo para ejecutar las operaciones y manejar errores.
  Future<T> performOperation<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
