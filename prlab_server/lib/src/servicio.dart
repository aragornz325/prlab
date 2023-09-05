// ignore_for_file: avoid_shadowing_type_parameters

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:logging/logging.dart';
import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/odm.dart';

/// Clase abstracta para la capa de Servicio.
abstract class Servicio<T extends ODM> {
  /// Variable con la instancia del odm.
  late final T odm;

  /// Instancia del logger.
  // ignore: always_specify_types
  final logger = Logger('Servicio');

  /// Metodo para ejecutar las operaciones y manejar errores.
  Future<T> performOperation<T>(Future<T> Function() operation) async {
    try {
      logger.info('Executing $operation...');
      return operation().then((result) {
        logger.finer('Operacion completada exitosamente');
        return result;
      });
    } on ExceptionPrLab catch (e) {
      throw e.errorType;
    } on Exception catch (e, st) {
      logger.severe('Unidentified error: $e \n$st');
      throw UnimplementedError('Unidentified error: $e \n$st');
    }
  }

  /// Metodo para ejecutar las operaciones relacionadas a JSON Web Tokens y
  /// manejar sus errores.
  T performOperationToken<T>(T Function() operation) {
    try {
      logger.info('Verifying token...');
      return operation();
    } on JWTException catch (e) {
      logger.shout('$e');
      rethrow;
    } on Exception catch (e, st) {
      logger.severe('Unidentified error: $e \n$st');
      throw UnimplementedError('Unidentified error: $e \n$st');
    }
  }
}
