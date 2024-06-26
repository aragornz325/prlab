import 'package:prlab_server/src/generated/cliente.dart';
import 'package:prlab_server/src/orms/orm_cliente.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/server.dart';

/// Servicio para datos de [Cliente].
class ServicioCliente extends Servicio<OrmCliente> {
  @override
  final orm = OrmCliente();

  /// Guarda los datos personales del [Cliente] insertados en el formulario de
  /// registro.
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [datosDelCliente] ([Cliente]): Objeto con los datos personales que se
  /// van a insertar en la tabla de clientes de la Base de Datos.
  Future<bool> completarKyc(
    Session session, {
    required Cliente datosDelCliente,
  }) async {
    try {
      logger.info('Completando KYC para ${datosDelCliente.nombre}');
      return await ejecutarOperacion(
        () => orm.completarKyc(
          session: session,
          datosDelCliente: datosDelCliente,
        ),
      );
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// Comprueba si un usuario completó la fase de registro.
  Future<bool> comprobarKyc(Session session, {required int idUsuario}) async {
    return await orm.comprobarKyc(session, idUsuario: idUsuario);
  }

  /// Obtiene los usuarios asignados a una Marca.
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [idMarca] ([int]): ID de la Marca a la que pertenecen los usuarios.
  Future<List<Cliente>> listarUsuariosPorMarca(
    Session session, {
    required int idMarca,
  }) async {
    logger.info('Recuperando usuarios relacionados a la marca $idMarca...');
    return await ejecutarOperacion(
      () => orm.listarUsuariosPorMarca(
        session,
        idMarca: idMarca,
      ),
    );
  }
}
