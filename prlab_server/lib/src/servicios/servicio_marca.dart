import 'package:prlab_server/src/generated/marca.dart';
import 'package:prlab_server/src/odms/odm_articulo.dart';
import 'package:prlab_server/src/odms/odm_cliente.dart';
import 'package:prlab_server/src/odms/odm_marca.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/server.dart';

/// Servicio para administrar aspectos de la entidad Marca.
class ServicioMarca extends Servicio<OdmMarca> {
  @override
  final odm = OdmMarca();

  /// Instancia del ODM para la administracion de clientes.
  final odmCliente = OdmCliente();

  /// Instancia del ODM para la administracion de articulos
  final odmArticulo = OdmArticulo();

  /// La función `crearMarca` crea una nueva marca y devuelve un booleano que
  /// indica si la operación fue exitosa.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es
  /// obligatorio. Se utiliza para especificar la sesión de creación de la
  /// marca.
  ///   payload (Marca): El parámetro `payload` es de tipo `Marca` y es
  /// obligatorio. Representa los datos que se utilizarán para crear una nueva
  /// marca.
  Future<bool> crearMarca({
    required Session session,
    required Marca payload,
  }) async {
    try {
      logger.info(
        'Creando Marca ${payload.nombre}',
      );
      return await ejecutarOperacion(
        () => odm.crearMarca(
          session: session,
          payload: payload
            ..fechaCreacion = DateTime.now()
            ..ultimaModificacion = DateTime.now(),
        ),
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// La función `listarMarcas` lista todas las marcas usando una sesión
  /// proporcionada.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es
  /// obligatorio.
  ///
  /// Returns:
  ///   El método devuelve un objeto `Futuro` que se resuelve en una
  /// `Lista<Marca>`.
  Future<List<Marca>> listarMarcas({
    required Session session,
  }) async {
    try {
      logger.info(
        'Listando Marcas',
      );
      return await ejecutarOperacion(
        () => odm.listarMarcas(
          session: session,
        ),
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// Obtiene el registro de una marca por su id.
  Future<Marca> obtenerMarcaPorId(
    Session session,
    int idMarca,
  ) async {
    return await ejecutarOperacion(
      () => odm.obtenerMarcaPorId(
        session: session,
        id: idMarca,
      ),
    );
  }

  // Future<List<dynamic>> listarMarcasDeUsuario(
  //   Session session, {
  //   required int idUsuario,
  // }) async {
  //   print(idUsuario);
  //   return await performOperation(
  //     () => odm.listarMarcasDeUsuario(
  //       session,
  //       idUsuario: idUsuario,
  //     ),
  //   );
  // }

  /// La función `eliminarMarca` se utiliza para eliminar una marca por su ID.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es
  /// obligatorio. Representa el objeto de sesión que se utiliza para la
  /// operación.
  ///   id (int): El parámetro "id" es un número entero que representa el
  /// identificador único de la marca que debe eliminarse.
  Future<bool> eliminarMarca({
    required Session session,
    required int id,
  }) async {
    try {
      logger
        ..info(
          'Se va a eliminar la marca con id $id',
        )
        ..finest(
          'Verificando que la marca exista',
        );
      await ejecutarOperacion(
        () => odm.obtenerMarcaPorId(
          session: session,
          id: id,
        ),
      );
      logger.finest(
        'Eliminando marca',
      );
      return await ejecutarOperacion(
        () => odm.eliminarMarca(
          session: session,
          id: id,
        ),
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// Crea la relación entre una marca y un usuario.
  Future<List<List<dynamic>>> asignarUsuarioAMarca(
    Session session, {
    required int idMarca,
    required int idUsuario,
    required int idRol,
  }) async {
    return await ejecutarOperacion(
      () => odm.asignarUsuarioAMarca(
        session,
        idMarca: idMarca,
        idUsuario: idUsuario,
        idRol: idRol,
      ),
    );
  }

  /// Da de baja la relacion entre el usuario y la marca
  /// en la tabla intermedia.
  Future<List<List<dynamic>>> desvincularUsuarioDeMarca(
    Session session, {
    required int idMarca,
    required int idUsuario,
  }) async {
    return await ejecutarOperacion(
      () => odm.desvincularUsuarioDeMarca(
        session,
        idMarca: idMarca,
        idUsuario: idUsuario,
      ),
    );
  }

  /// Obtiene las marcas a las que se encuentra asignado un usuario.
  Future<List<Marca>> listarMarcasPorUsuario(
    Session session, {
    required int idUsuario,
  }) async {
    logger.info(
      'Recuperando marcas del usuario $idUsuario...',
    );

    List<Marca> marcas = await ejecutarOperacion(
      () => odm.listarMarcasPorUsuario(
        session,
        idUsuario: idUsuario,
      ),
    );

    logger.finest(
      'Se ha(n) recuperado ${marcas.length} marca(s) relacionada(s) con el usuario $idUsuario.',
    );

    final listasUsuarios = {};
    final listasArticulos = {};

    logger.finest(
      'Recuperando usuarios y últimos artículos de la(s) marca(s) encontradas...',
    );

    for (final marca in marcas) {
      final listaUsuarios = await ejecutarOperacion(
        () => odmCliente.listarUsuariosPorMarca(
          session,
          idMarca: marca.id!,
        ),
      );

      logger.finest(
        'Recuperado(s) ${listaUsuarios.length} usuarios pertenecientes a la marca ${marca.id}',
      );

      final listaArticulos = await ejecutarOperacion(
        () => odmArticulo.listarUltimosTresArticulosPorMarca(
          session,
          idMarca: marca.id!,
        ),
      );

      logger.finest(
        'Recuperado(s) ${listaArticulos.length} articulos pertenecientes a la marca ${marca.id}',
      );

      listasUsuarios[marca.id] = listaUsuarios;
      listasArticulos[marca.id] = listaArticulos;
    }

    final response = marcas
        .map(
          (e) => e
            ..staff = listasUsuarios[e.id]
            ..ultimosArticulos = listasArticulos[e.id],
        )
        .toList();

    logger.finest(
      'Retornando información obtenida...',
    );

    return response;
  }
}
