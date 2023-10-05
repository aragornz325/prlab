import 'package:prlab_server/src/generated/marca.dart';
import 'package:prlab_server/src/generated/marca_staff.dart';
import 'package:prlab_server/src/orms/orm_entregable_articulo.dart';
import 'package:prlab_server/src/orms/orm_cliente.dart';
import 'package:prlab_server/src/orms/orm_marca.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/server.dart';

/// Servicio para administrar aspectos de la entidad Marca.
class ServicioMarca extends Servicio<OrmMarca> {
  @override
  final orm = OrmMarca();

  /// Instancia del ODM para la administracion de clientes.
  final odmCliente = OrmCliente();

  /// Instancia del ODM para la administracion de articulos
  final odmArticulo = OrmEntregableArticulo();

  /// Crea una nueva marca y devuelve un booleano que indica si la operación
  /// fue exitosa.
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [marca] ([Marca]): Un objeto con el registro de la marca a ser guardado
  /// en la Base de Datos.
  Future<List<Map>> crearMarca(
    Session session, {
    required String nombre,
    required String sitioWeb,
  }) async {
    try {
      logger.info(
        'Creando Marca $nombre',
      );
      final now = DateTime.now();
      return await ejecutarOperacion(
        () => orm.crearMarca(
          session: session,
          marca: Marca(
            nombre: nombre,
            sitioWeb: sitioWeb,
            staff: [],
            ultimosArticulos: [],
            cantidadArticulos: 0,
            cantidadClippings: 0,
            fechaCreacion: now,
            ultimaModificacion: now,
          ),
        ),
      );
    } on Exception {
      rethrow;
    }
  }

  // TODO(anyone): El método no funciona por el caracter no-nulleable de campos API.
  /// Recupera todas las marcas no eliminadas existentes.
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  // Future<List<Marca>> listarMarcas(
  //   Session session,
  // ) async {
  //   try {
  //     logger.info(
  //       'Listando Marcas',
  //     );
  //     return await ejecutarOperacion(
  //       () => orm.listarMarcas(
  //         session: session,
  //       ),
  //     );
  //   } on Exception {
  //     rethrow;
  //   }
  // }

  /// Obtiene el registro de una marca por su id.
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [idMarca] ([int]): ID de la [Marca] buscada.
  Future<Marca> obtenerMarcaPorId(
    Session session, {
    required int idMarca,
  }) async {
    return await ejecutarOperacion(
      () => orm.obtenerMarcaPorId(
        session: session,
        id: idMarca,
      ),
    );
  }

  /// Obtiene las marcas a las que se encuentra asignado un usuario.
  ///
  /// Args:
  /// [idUsuario] ([int]): ID del usuario (ID de usuario de Serverpod, que está
  /// como FK en su registro de Cliente).
  Future<List<Marca>> listarMarcasPorUsuario(
    Session session, {
    required int idUsuario,
  }) async {
    logger.info(
      'Recuperando marcas del usuario $idUsuario...',
    );

    return await ejecutarOperacion(
      () => orm.listarMarcasPorUsuario(
        session,
        idUsuario: idUsuario,
      ),
    );
  }

  Future<bool> modificarMarca({
    required Session session,
    required int idMarca,
    required Map<String, dynamic> camposMarca,
  }) async {
    return await ejecutarOperacion(
      () => orm.modificarMarca(
        session: session,
        idMarca: idMarca,
        camposMarca: camposMarca,
      ),
    );
  }

  /// Elimina una marca.
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [idMarca] ([int]): ID de la [Marca] a eliminar.
  Future<bool> eliminarMarca(
    Session session, {
    required int idMarca,
  }) async {
    try {
      logger
        ..info(
          'Se va a eliminar la marca con id $idMarca',
        )
        ..finest(
          'Eliminando marca',
        );
      return await ejecutarOperacion(
        () => orm.eliminarMarca(
          session: session,
          idMarca: idMarca,
        ),
      );
    } on Exception {
      rethrow;
    }
  }

  /// Crea la relación entre una marca y un usuario.
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [idMarca] ([int]): ID de la [Marca].
  ///   [idUsuario] ([int]): ID del usuario a ser asignado a la Marca
  /// (ID de usuario de Serverpod, que está como FK en su registro de Cliente).
  ///   [idRol] ([int]): ID del rol que posee el usuario en la marca. Es el
  /// index de un enum.
  Future<bool> asignarUsuarioAMarca(
    Session session, {
    required int idMarca,
    required int idUsuario,
    required int idRol,
  }) async {
    final now = DateTime.now();
    return await ejecutarOperacion(
      () => orm.asignarUsuarioAMarca(
        session,
        marcaStaff: MarcaStaff(
          idMarca: idMarca,
          idStaff: idUsuario,
          idRol: idRol,
          ultimaModificacion: now,
          fechaCreacion: now,
        ),
      ),
    );
  }

  /// Da de baja la relacion entre el usuario y la marca
  /// en la tabla intermedia.
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [idMarca] ([int]): ID de la [Marca].
  ///   [idUsuario] ([int]): ID del usuario a ser eliminado de la Marca
  /// (ID de usuario de Serverpod, que está como FK en su registro de Cliente).
  Future<bool> desvincularUsuarioDeMarca(
    Session session, {
    required int idMarca,
    required int idUsuario,
  }) async {
    return await ejecutarOperacion(
      () => orm.desvincularUsuarioDeMarca(
        session,
        idMarca: idMarca,
        idUsuario: idUsuario,
      ),
    );
  }
}
