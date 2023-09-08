import 'package:logging/logging.dart';
import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/servicios/servicio_articulo.dart';
import 'package:serverpod/server.dart';

/// Endpoints centrados en la entidad [Articulo].
class ArticuloEndpoint extends Endpoint {
  /// Instancia del servicio para la entidad [Articulo].
  final servicioArticulo = ServicioArticulo();

  @override
  final requireLogin = false;

  /// La función `crearArticulo` es que crea un artículo usando una sesión y un
  /// articulo, y devuelve un booleano que indica si la creación fue exitosa.
  ///
  /// Args:
  ///   [session] ([Session]): Un objeto de sesión que representa la sesión del
  /// usuario actual. Puede contener información como el token de autenticación
  /// del usuario u otros datos relacionados con la sesión.
  ///   [articulo] ([Articulo]): El parámetro "articulo" es un objeto de tipo
  /// "Articulo" que contiene los datos necesarios para crear un artículo.
  Future<int> crearArticulo(
    Session session,
    Articulo articulo,
  ) async {
    try {
      return await servicioArticulo.crearArticulo(
        session,
        articulo: articulo,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// La función [listarArticulos] recupera una lista de artículos usando un
  /// objeto de sesión y un objeto de servicio.
  ///
  /// Args:
  ///   [session] ([Session]): El parámetro [sesión] es de tipo "Sesión" y es
  ///   obligatorio.
  Future<List<Articulo>> listarArticulos(
    Session session,
  ) async {
    try {
      return await servicioArticulo.listarArticulos(
        session,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// La función [obtenerArticulo] es una función asincrónica de Dart que toma
  /// un objeto [Session] y un [id] entero como parámetros, y devuelve un
  ///  [Future] que se resuelve en un objeto [Articulo].
  ///
  /// Args:
  ///   [session] ([Session]): Un objeto de sesión que contiene información sobre
  ///   la sesión del usuario. id (int): El parámetro [id] es un número entero
  ///   que representa el identificador único del artículo que desea obtener.
  Future<Articulo> obtenerArticulo(
    Session session,
    int id,
  ) async {
    try {
      return await servicioArticulo.obtenerArticulo(
        session,
        id: id,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// La función [eliminarArticulo] es una función asincrónica de Dart que
  /// intenta eliminar un artículoutilizando una sesión e ID proporcionadas,
  ///  y devuelve un valor booleano que indica si la eliminación fue exitosa
  ///  o no.
  ///
  /// Args:
  ///   [session] ([Session]): Un parámetro obligatorio de tipo Sesión.
  ///   [id] ([int]): El parámetro [id] es un número entero que representa el
  ///   identificador único del artículo que debe eliminarse.
  Future<bool> eliminarArticulo(
    Session session,
    int id,
  ) async {
    try {
      return await servicioArticulo.eliminarArticulo(
        session,
        idArticulo: id,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// La función [listarArticulosPorMarca] es un servicio querecupera una lista
  /// de artículos en función de un ID de marca determinado.
  ///
  /// Args:
  ///   [session] ([Session]): El parámetro de sesión es de tipo Sesión y representa
  ///   la sesión o conexión actual a la base de datos. Se utiliza para ejecutar
  ///   consultas o realizar operaciones de bases de datos.
  ///   [idMarca] ([int]): La identificación de la marca para la que desea enumerar
  ///   los artículos.
  ///
  /// Returns:
  ///   Un objeto futuro que se resuelve en una lista de objetos Articulo.
  Future<List<Articulo>> listarArticulosPorMarca(
    Session session,
    int idMarca,
  ) async {
    try {
      return await servicioArticulo.listarArticulosPorMarca(
        session,
        idMarca: idMarca,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// La función [actualizarArticulo] actualiza un artículo usando el servicio
  /// [servicioArticulo] y devuelve un booleano indicando si la actualización
  /// fue exitosa.
  ///
  /// Args:
  ///   [session] ([Session]): Un objeto de sesión que representa la sesión del
  /// usuario actual.
  ///
  /// [articulo] ([Articulo]): El parámetro [articulo] es de tipo "Articulo" y es
  /// obligatorio.
  Future<bool> actualizarArticulo(
    Session session, {
    required Articulo articulo,
  }) async {
    try {
      return await servicioArticulo.actualizarArticulo(
        session,
        articulo: articulo,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  /// La función [subirImagenArticulo] toma un objeto [Session] y un [rutaImagen]
  /// como parámetros, y devuelve un [Future] que se resuelve en un
  ///  objeto [String].
  Future<String> subirImagenArticulo(
    Session session, {
    required String rutaImagen,
    required int idArticulo,
  }) async {
    try {
      return await servicioArticulo.subirImagenArticulo(
        session,
        rutaImagen: rutaImagen,
        idArticulo: idArticulo,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }
}
