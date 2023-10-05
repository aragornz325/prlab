import 'package:logging/logging.dart';
import 'package:serverpod/serverpod.dart';

/// Tipo de funcion que ejecuta el metodo performOdmOperation.
typedef FuncionServerpodDb<T> = Future<T> Function(Session session);

/// Objeto de session de Serverpod.

/// Clase abstracta de ORM con metodo performOperation.
abstract class ORM {
  /// Sesion (clase de Serverpod).
  late Session? session;

  /// Instancia del logger.
  final logger = Logger('ORM');

  /// Metodo para ejecutar las operaciones de los ORM y manejar errores.
  Future<T> ejecutarOperacionOrm<T>(
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

  Future<List<Map<String, dynamic>>> insertarRegistro(
    Session session, {
    required String nombreTabla,
    required List<TableRow> registros,
  }) async {
    final List<Map> registrosMapas = registros
        .map(
          (row) => row.toJsonForDatabase(),
        )
        .toList();

    var listaColumnas = <String>[
      ...registrosMapas.first.keys.map((columna) => '"$columna"')
    ];

    var listasValores = <String>[];

    final cantidadRegistros = registrosMapas.length;

    for (var i = 0; i < cantidadRegistros; i++) {
      final Map registro = registrosMapas[i];
      var valoresRegistro = [];
      for (final columna in registro.keys as Iterable<String>) {
        if (columna == 'id') continue;

        dynamic valorSinFormato = registro[columna];

        String valor = DatabasePoolManager.encoder.convert(valorSinFormato);

        valoresRegistro.add(valor);
      }

      listasValores.add('(${valoresRegistro.join(', ')})');
    }

    var consulta =
        '''
          INSERT INTO $nombreTabla (
            ${listaColumnas.join(', ')}
          ) VALUES 
            ${listasValores.join(',\n  ')} 
          RETURNING id;
  ''';
    
    return await ejecutarConsultaSql(session, consulta, clavesMapaModeloDb: ['id']);
  }
}
