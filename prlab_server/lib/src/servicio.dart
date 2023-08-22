import 'package:prlab_server/src/odm.dart';


import '../utils/logger.dart';

abstract class Servicio<T extends ODM> {
  /// Variable con la instancia del odm.
  late final T odm;
  final logger = loggerPrint;
  //final logger = loggerPrint;
  // TODO(BACKEND): CREAR LOGGER ESPECIFICO
  

  /// Metodo para ejecutar las operaciones y manejar errores.
  Future<T> performOperation<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
