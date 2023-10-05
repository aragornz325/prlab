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
  /// Args:
  ///   [session] ([Session]): El parámetro de sesión es de tipo Sesión y representa
  ///   la sesión del usuario
  /// actual.
  ///   [marca] ([Marca]): Este parametro es un objeto de tipo "Marca" que
  ///   contiene los datos necesarios para crear una nueva marca.
  Future<List<Map>> crearMarca(
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
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  // TODO(anyone): El método no funciona por el caracter no-nulleable de campos API.
  /// La función [listarMarcas] recupera una lista de marcas usando un objeto
  /// de sesión y un objeto de servicio.
  ///
  /// Args:
  ///   [session] ([Session]): Este parametro es de tipo "Sesión". Se utiliza
  ///   para pasar la información de la sesión al método "listarMarcas".

  // Future<List<Marca>> listarMarcas(
  //   Session session,
  // ) async {
  //   try {
  //     return servicioMarca.listarMarcas(
  //       session,
  //     );
  //   } on Exception catch (e) {
  //     throw Exception('$e');
  //   }
  // }

  /// Obtiene el registro de una marca por su id.
  Future<Marca> obtenerMarcaPorId(Session session, int idMarca) async {
    return await servicioMarca.obtenerMarcaPorId(
      session,
      idMarca: idMarca,
    );
  }

  /// Obtiene las marcas a las que se encuentra asignado un usuario.
  Future<List<Marca>> listarMarcasPorUsuario(
    Session session, {
    required int idUsuario,
  }) async {
    return await servicioMarca.listarMarcasPorUsuario(
      session,
      idUsuario: idUsuario,
    );
  }

  /// Modifica un registro de [Marca].
  Future<bool> modificarMarca(
    Session session, {
    required int idMarca,
    String? nombre,
    String? sitioWeb,
  }) async {
    return await servicioMarca.modificarMarca(
      session: session,
      idMarca: idMarca,
      camposMarca: {
        'nombre': nombre,
        'sitioWeb': sitioWeb,
      },
    );
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
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// Crea la relación entre una marca y un usuario.
  Future<bool> asignarUsuarioAMarca(
    Session session, {
    required int idMarca,
    required int idUsuario,
    required int idRol,
  }) async {
    return await servicioMarca.asignarUsuarioAMarca(
      session,
      idMarca: idMarca,
      idUsuario: idUsuario,
      idRol: idRol,
    );
  }

  /// Da de baja la relacion entre el usuario y la marca
  /// en la tabla intermedia.
  Future<bool> desvincularUsuarioDeMarca(
    Session session, {
    required int idMarca,
    required int idUsuario,
  }) async {
    return await servicioMarca.desvincularUsuarioDeMarca(
      session,
      idMarca: idMarca,
      idUsuario: idUsuario,
    );
  }
}
