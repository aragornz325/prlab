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
  Future<T> ejecutarOperacion<T>(Future<T> Function() operacion) async {
    try {
      return operacion();
    } on ExcepcionPrLab catch (e) {
      throw e.errorType;
    } on Exception catch (e, st) {
      logger.severe(
        'Unidentified error: $e \n$st',
      );
      throw UnimplementedError(
        'Unidentified error: $e \n$st',
      );
    }
  }

  /// Metodo para ejecutar las operaciones relacionadas a JSON Web Tokens y
  /// manejar sus errores.
  T ejecutarOperacionToken<T>(T Function() operacion) {
    try {
      return operacion();
    } on JWTException catch (e) {
      logger.shout('$e');
      rethrow;
    } on Exception catch (e, st) {
      logger.severe(
        'Unidentified error: $e \n$st',
      );
      throw UnimplementedError(
        'Unidentified error: $e \n$st',
      );
    }
  }
}
