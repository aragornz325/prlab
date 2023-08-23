// ignore_for_file: avoid_shadowing_type_parameters

import 'package:prlab_server/src/odm.dart';
import 'package:prlab_server/utils/logger.dart';

import 'package:simple_logger/simple_logger.dart';

/// Clase abstracta para la capa de Servicio.
abstract class Servicio<T extends ODM> {
  /// Variable con la instancia del odm.
  late final T odm;

  /// Instancia del logger.
  // ignore: always_specify_types
  final logger = loggerPrint;
  final sLogger = SimpleLogger();

  /// Metodo para ejecutar las operaciones y manejar errores.
  Future<T> performOperation<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
