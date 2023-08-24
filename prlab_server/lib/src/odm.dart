import 'package:prlab_client/prlab_client.dart';
import 'package:serverpod/serverpod.dart';

/// Tipo de funcion que ejecuta el metodo performOdmOperation.
typedef ServerpodDbFunction<T> = Future<T> Function(Session session);

/// Objeto de session de Serverpod.

/// Clase abstracta de ODM con metodo performOperation.
abstract class ODM {
  /// Se tiene que inicializar en el metodo especifico.
  late Session? session;
  /// Metodo para ejecutar las operaciones de los ODM y manejar errores.
  Future<T> performOdmOperation<T>(ServerpodDbFunction<T> function) async {
    try {
      return await function(session!);
    } on ErrorPrLab catch (e) {
      rethrow;
    } on Exception catch (e, st) {
      throw UnimplementedError('Error no identificado: $e \n$st');
    }
  }
}
