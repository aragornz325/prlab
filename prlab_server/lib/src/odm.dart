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

  Future<List<Map<String, dynamic>>> rawQueryOperation<T>(
    Session session, {
    TableRow? entidad,
    Map? mapaModelo,
    required ServerpodDbFunction<T> funcionRawQuery,
  }) async {
    try {
      this.session = session;
      if (entidad == null && mapaModelo == null) {
        throw Exception('Falta una clase TableRow o un Map como modelo');
      }

      Map<String, dynamic> tempModelo =
          (entidad != null) ? entidad.allToJson() : mapaModelo;

      final tempModeloKeys = tempModelo.keys.toList();
      final queryResponse = await funcionRawQuery(session);

      final response = queryResponse as List<List<dynamic>>;

      return response.map((e) {
        var index = 0;
        for (var key in tempModeloKeys) {
          if (key.contains('Api')) {
            tempModelo[key] = null;
            continue;
          } else {
            tempModelo[key] = e[index];
            index += 1;
          }
        }
        return tempModelo;
      }).toList();
    } on Exception catch (e, st) {
      throw UnimplementedError('Error no identificado: $e \n$st');
    }
  }
}
