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

  /// Metodo para ejecutar funciones con queries raw de Serverpod y mapear los 
  /// resultados a objetos.  
  /// Requiere del script de la query SQL y las "keys" del objeto a devolver.
  Future<List<Map<String, dynamic>>> rawQueryOperation<T>(
    Session session,
    String query, {
    required Iterable<String> keysMapaModeloDb,
    int? timeoutInSeconds,
    Transaction? transaction,
  }) async {
    try {

      final dbRawQuery = await session.db.query(
        query,
        timeoutInSeconds: timeoutInSeconds,
        transaction: transaction,
      );

      List<String> keysMapaModeloList = keysMapaModeloDb.toList();
     
      final response = dbRawQuery.map((e) {
        Map<String, dynamic> modeloResponse = {};
        for (final key in keysMapaModeloList) {
          modeloResponse[key] = e[keysMapaModeloList.indexOf(key)];
        }
        return modeloResponse;
      }).toList();

      return response;
    } on Exception catch (e, st) {
      throw UnimplementedError('Error no identificado: $e \n$st');
    }
  }
}
