// ignore_for_file: avoid_shadowing_type_parameters

import 'package:cloudinary/cloudinary.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:logging/logging.dart';
import 'package:prlab_server/src/orm.dart';
import 'package:prlab_server/utils/config/constants.dart';
import 'package:similar_web/similar_web.dart';

/// Clase abstracta para la capa de Servicio.
abstract class Servicio<T extends ORM> {
  /// Variable con la instancia del odm.
  late final T orm;

  /// Instancia del logger.
  // ignore: always_specify_types
  final logger = Logger('Servicio');

  /// Instancia del servicio para almacenamiento en la nube
  /// (actualmente Cloudinary).
  final almacenamientoNube = Cloudinary.signedConfig(
    apiKey: ConstantesPrLab.cloudinaryApiKey,
    apiSecret: ConstantesPrLab.cloudinaryApiSecret,
    cloudName: ConstantesPrLab.cloudinaryCloudName,
  );

  final similarWeb = SimilarWeb('MOCK');

  /// Metodo para ejecutar las operaciones y manejar errores.
  Future<T> ejecutarOperacion<T>(Future<T> Function() operacion) async {
    try {
      return operacion();
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
