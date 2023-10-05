import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/servicios/servicio_entregable_articulo.dart';
import 'package:serverpod/serverpod.dart';

const _canalDeArticulo = 'canal_de_articulo';

/// Endpoints centrados en la entidad [EntregableArticulo].
class EntregableArticuloEndpoint extends Endpoint {
  /// Instancia del servicio para la entidad [EntregableArticulo].
  final servicioArticulo = ServicioEntregableArticulo();

  @override
  final requireLogin = false;

  /// La función `crearArticulo` es que crea un artículo usando una sesión y un
  /// articulo, y devuelve un booleano que indica si la creación fue exitosa.
  ///
  /// Args:
  ///   [session] ([Session]): Un objeto de sesión que representa la sesión del
  /// usuario actual. Puede contener información como el token de autenticación
  /// del usuario u otros datos relacionados con la sesión.
  ///   [articulo] ([EntregableArticulo]): El parámetro "articulo" es un objeto de tipo
  /// "Articulo" que contiene los datos necesarios para crear un artículo.
  Future<int> crearArticulo(
    Session session, {
    required String titulo,
    required String contenido,
    required String contenidoHtml,
    int? idMarca,
  }) async {
    try {
      return await servicioArticulo.crearArticulo(
        session,
        titulo: titulo,
        contenido: contenido,
        contenidoHtml: contenidoHtml,
        idMarca: idMarca,
      );
    } on Exception {
      rethrow;
    }
  }

  /// La función [listarArticulos] recupera una lista de artículos usando un
  /// objeto de sesión y un objeto de servicio.
  ///
  /// Args:
  ///   [session] ([Session]): El parámetro [sesión] es de tipo "Sesión" y es
  ///   obligatorio.
  Future<List<EntregableArticulo>> listarArticulos(
    Session session,
  ) async {
    try {
      return await servicioArticulo.listarArticulos(
        session,
      );
    } on Exception {
      rethrow;
    }
  }

  /// La función [obtenerArticulo] es una función asincrónica de Dart que toma
  /// un objeto [Session] y un [id] entero como parámetros, y devuelve un
  ///  [Future] que se resuelve en un objeto [EntregableArticulo].
  ///
  /// Args:
  ///   [session] ([Session]): Un objeto de sesión que contiene información sobre
  ///   la sesión del usuario. id (int): El parámetro [id] es un número entero
  ///   que representa el identificador único del artículo que desea obtener.
  Future<EntregableArticulo> obtenerArticulo(
    Session session,
    int id,
  ) async {
    try {
      return await servicioArticulo.obtenerArticulo(
        session,
        id: id,
      );
    } on Exception {
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
    } on Exception {
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
  Future<List<EntregableArticulo>> listarArticulosPorMarca(
    Session session,
    int idMarca,
  ) async {
    try {
      return await servicioArticulo.listarArticulosPorMarca(
        session,
        idMarca: idMarca,
      );
    } on Exception {
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
  /// [articulo] ([EntregableArticulo]): El parámetro [articulo] es de tipo "Articulo" y es
  /// obligatorio.
  Future<bool> actualizarArticulo(
    Session session, {
    required EntregableArticulo articulo,
  }) async {
    try {
      return await servicioArticulo.actualizarArticulo(
        session,
        articulo: articulo,
      );
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    session.messages.addListener(_canalDeArticulo, (update) async {
      await sendStreamMessage(session, update);
    });
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableEntity message,
  ) async {
    if (message is EntregableArticulo) {
      await actualizarArticulo(session, articulo: message);

      session.messages.postMessage(_canalDeArticulo, message);
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
    } on Exception {
      rethrow;
    }
  }

  Future<List<EntregableArticulo>> traerArticulosPorUsuario(Session session) {
    try {
      return servicioArticulo.traerArticulosPorUsuario(
        session: session,
      );
    } on Exception {
      rethrow;
    }
  }

  Future<bool> publicarArticulo(
    Session session, {
    required int idArticulo,
  }) async {
    try {
      return await servicioArticulo.publicarArticulo(
        session: session,
        idArticulo: idArticulo,
      );
    } on Exception {
      rethrow;
    }
  }

  Future<List<EntregableArticulo>> traerEntregableporFiltro(Session session,
      {required List<int> status, required int idAutor}) async {
    try {
      return await servicioArticulo.traerEntregableporFiltro(
        session: session,
        status: status,
        idAutor: idAutor,
      );
    } on Exception {
      rethrow;
    }
  }

  /// La función `listarArticuloMarcayEstado` toma una sesión, un texto, un ID de marca y una lista de
  /// ID de estado, y devuelve una lista de objetos `EntregableArticulo` basado en los parámetros dados.
  /// 
  /// Args:
  ///   session (Session): Un objeto de sesión que representa la sesión del usuario actual.
  ///   texto (String): Un parámetro de cadena que representa el texto que se buscará en los artículos.
  ///   idMarca (int): El ID de la marca del artículo.
  ///   idStatus (List<int>): Una lista de números enteros que representan los ID del estado deseado
  /// para los artículos.
  /// 
  /// Returns:
  ///   El método devuelve un objeto "Futuro" que se resuelve en una "Lista" de objetos
  /// "EntregableArticulo".
  Future<List<EntregableArticulo>> listarEntregableMarcayEstado(
    Session session,
    String texto, {
    required int idMarca,
    required List<int> idStatus,
  }) async {
    if (texto.isEmpty) {
      texto = '';
    }
    try {
      return await servicioArticulo.listarEntregableMarcayEstado(
        texto,
        session: session,
        idMarca: idMarca,
        idStatus: idStatus,
      );
    } on Exception {
      rethrow;
    }
  }

  /// La función `listarStatusEntregable` recupera una lista de objetos `StatusEntregable` usando un
  /// objeto `Session`.
  /// 
  /// Args:
  ///   session (Session): Un objeto de sesión que representa la sesión del usuario actual.
  /// 
  /// Returns:
  ///   El método devuelve un objeto "Futuro" que se resuelve en una "Lista" de objetos
  /// "EstadoEntregable".
  Future<List<StatusEntregable>> listarStatusEntregable(
    Session session,
  ) async {
    try {
      return await servicioArticulo.listarStatusEntregable(
        session: session,
      );
    } on Exception {
      rethrow;
    }
  }
}
