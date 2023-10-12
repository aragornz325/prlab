import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/servicios/servicio_marca.dart';
import 'package:serverpod/serverpod.dart';

/// Enpoints para acceder a aspectos de la entidad [Marca].
class MarcaEndpoint extends Endpoint {
  /// Instancia del servicio para la entidad Marca.
  final servicioMarca = ServicioMarca();

  /// La función [crearMarca] crea una nueva marca llamando al método
  /// [crearMarca] del servicio [servicioMarca] y devuelve un booleano
  /// que indica éxito.
  ///
  /// Retorna el ID del registro de [Marca] creado.
  Future<int> crearMarca(
    Session session, {
    required String nombre,
    required String sitioWeb,
  }) async {
    try {
      return await servicioMarca.crearMarca(
        session,
        nombre: nombre,
        sitioWeb: sitioWeb,
      );
    } catch (e) {
      rethrow;
    }
  }

  // TODO(anyone): El método no funciona por el caracter no-nulleable de campos API.
  /// La función [listarMarcas] recupera una lista de marcas usando un objeto
  /// de sesión y un objeto de servicio.
  ///
  /// Args:
  ///   [session] ([Session]): Este parametro es de tipo "Sesión". Se utiliza
  ///   para pasar la información de la sesión al método "listarMarcas".

  Future<List<Marca>> listarMarcas(
    Session session,
  ) async {
    try {
      return servicioMarca.listarMarcas(
        session,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Obtiene el registro de una marca por su id.
  Future<Marca> obtenerMarcaPorId(Session session, int idMarca) async {
    try {
      return await servicioMarca.obtenerMarcaPorId(
        session,
        idMarca: idMarca,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Obtiene las marcas a las que se encuentra asignado un usuario.
  Future<List<Marca>> listarMarcasPorUsuario(
    Session session, {
    required int idUsuario,
  }) async {
    try {
      return await servicioMarca.listarMarcasPorUsuario(
        session,
        idUsuario: idUsuario,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Modifica un registro de [Marca].
  Future<bool> modificarMarca(
    Session session, {
    required int idMarca,
    String? nombre,
    String? sitioWeb,
  }) async {
    try {
      return await servicioMarca.modificarMarca(
        session: session,
        idMarca: idMarca,
        nombre: nombre,
        sitioWeb: sitioWeb,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// La función [eliminarMarca] es una función que toma un objeto `Session` y
  /// un entero [id] como parámetros, e intenta eliminar una marca usando el
  /// método [servicioMarca.eliminarMarca].
  ///
  /// Args:
  ///   [session] ([Session]): El parámetro de sesión es de tipo Sesión y representa
  ///   la sesión del usuario
  /// actual
  ///   [id] ([int]): La identificación de la marca que debe eliminarse.
  Future<bool> eliminarMarca(
    Session session,
    int id,
  ) async {
    try {
      await servicioMarca.eliminarMarca(
        session,
        idMarca: id,
      );
      return true;
    } catch (e) {
      rethrow;
    }
  }

  /// Crea la relación entre una marca y un usuario.
  Future<bool> asignarUsuarioAMarca(
    Session session, {
    required int idMarca,
    required int idUsuario,
    required int idRol,
  }) async {
    try {
      return await servicioMarca.asignarUsuarioAMarca(
        session,
        idMarca: idMarca,
        idUsuario: idUsuario,
        idRol: idRol,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Da de baja la relacion entre el usuario y la marca
  /// en la tabla intermedia.
  Future<bool> desvincularUsuarioDeMarca(
    Session session, {
    required int idMarca,
    required int idUsuario,
  }) async {
    try {
      return await servicioMarca.desvincularUsuarioDeMarca(
        session,
        idMarca: idMarca,
        idUsuario: idUsuario,
      );
    } catch (e) {
      rethrow;
    }
  }
}
