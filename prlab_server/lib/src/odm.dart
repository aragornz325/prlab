import 'package:logging/logging.dart';
import 'package:serverpod/serverpod.dart';

/// Tipo de funcion que ejecuta el metodo performOdmOperation.
typedef ServerpodDbFunction<T> = Future<T> Function(Session session);

/// Objeto de session de Serverpod.

/// Clase abstracta de ODM con metodo performOperation.
abstract class ODM {
  /// Sesion (clase de Serverpod).
  late Session? session;

  final logger = Logger('ODM');
  /// Metodo para ejecutar las operaciones de los ODM y manejar errores.
  Future<T> performOdmOperation<T>(
    Session session,
    ServerpodDbFunction<T> function,
  ) async {
    try {
      this.session = session;
      return await function(session);
    } on Exception catch (e, st) {
      throw UnimplementedError('Error no identificado: $e \n$st');
    }
  }
}
