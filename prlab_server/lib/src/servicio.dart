import 'package:prlab_server/src/odm.dart';

/// Clase abstracta para la capa de Servicio.
abstract class Servicio<T extends ODM> {

  /// Variable con la instancia del odm.
  late final T odm;

  // TODO(BACKEND): CREAR LOGGER ESPECIFICO
  // final logger = Logger('Servicio');
  
  /// Metodo para ejecutar las operaciones y manejar errores.
  Future<T> performOperation<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
