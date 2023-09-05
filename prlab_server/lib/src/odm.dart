import 'package:logging/logging.dart';
import 'package:serverpod/serverpod.dart';

/// Tipo de funcion que ejecuta el metodo performOdmOperation.
typedef FuncionServerpodDb<T> = Future<T> Function(Session session);

/// Objeto de session de Serverpod.

/// Clase abstracta de ODM con metodo performOperation.
abstract class ODM {
  /// Sesion (clase de Serverpod).
  late Session? session;

  /// Instancia del logger.
  final logger = Logger('ODM');

  /// Metodo para ejecutar las operaciones de los ODM y manejar errores.
  Future<T> ejecutarOperacionOdm<T>(
    Session session,
    FuncionServerpodDb<T> funcion,
  ) async {
    try {
      this.session = session;
      return await funcion(session);
    } on Exception catch (e, st) {
      throw UnimplementedError(
        'Error no identificado: $e \n$st',
      );
    }
  }

  /// Metodo para ejecutar funciones con queries raw de Serverpod y mapear los
  /// resultados a objetos.
  /// Requiere del script de la query SQL y las "keys" del objeto a devolver.
  Future<List<Map<String, dynamic>>> ejecutarConsultaSql<T>(
    Session session,
    String consulta, {
    required Iterable<String> clavesMapaModeloDb,
    int? tiempoDeEsperaEnSegundos,
    Transaction? transaccion,
  }) async {
    try {
      final consultaDb = await session.db.query(
        consulta,
        timeoutInSeconds: tiempoDeEsperaEnSegundos,
        transaction: transaccion,
      );

      List<String> clavesMapaModeloLista = clavesMapaModeloDb.toList();

      final respuesta = consultaDb.map((e) {
        Map<String, dynamic> modeloRespuesta = {};
        for (final clave in clavesMapaModeloLista) {
          modeloRespuesta[clave] = e[clavesMapaModeloLista.indexOf(clave)];
        }
        return modeloRespuesta;
      }).toList();

      return respuesta;
    } on Exception catch (e, st) {
      throw UnimplementedError(
        'Error no identificado: $e \n$st',
      );
    }
  }
}
