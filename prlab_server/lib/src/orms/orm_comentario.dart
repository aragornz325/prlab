import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/orm.dart';
import 'package:serverpod/serverpod.dart';

/// La clase OdmCommentario es una subclase de ODM.
class OrmComentario extends ORM {
  /// La función `listarComentariosPorArticulo` recupera una lista de
  /// comentarios para un ID de artículo determinado utilizando una sesión
  /// proporcionada.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y se utiliza
  ///   para especificar la sesión de la base de datos para ejecutar la
  ///   consulta. idArticulo (int): La identificación del artículo para el cual
  ///   desea enumerar los comentarios.
  ///
  /// Returns:
  ///   El método devuelve un objeto "Futuro" que se resuelve en una "Lista" de
  ///   objetos "Comentario".
  Future<List<Comentario>> listarComentariosPorArticulo(
    Session session, {
    required int idArticulo,
  }) async {
    final respuesta = await ejecutarConsultaSql(session, '''
    SELECT c."textoComentario",
           c."id",
           c."idEntregable",
           c."idAutorCompletado",
           c."completado",
           c."fechaCreacion",
           c."ultimaModificacion",
           c."fechaCompletado",
           c."fechaEliminacion",
           c."idAutor",
           cl."nombre",
           cl."apellido"
    FROM 
        comentarios c
    JOIN clientes cl ON c."idAutor" = cl."id"
    WHERE c."idEntregable" = $idArticulo
     
    ''', clavesMapaModeloDb: [
      'textoComentario',
      'id',
      'idEntregable',
      'idAutorCompletado',
      'completado',
      'fechaCreacion',
      'ultimaModificacion',
      'fechaCompletado',
      'fechaEliminacion',
      'idAutor',
      'nombre',
      'apellido',
    ]);
    return respuesta
        .map(
          (e) => Comentario.fromJson(
            e
              ..['ultimaModificacion'] = e['ultimaModificacion'].toString()
              ..['fechaCreacion'] = e['fechaCreacion'].toString()
              ..['fechaCompletado'] = e['fechaCompletado'].toString()
              ..['fechaEliminacion'] = e['fechaEliminacion'].toString(),
            Protocol(),
          ),
        )
        .toList();
  }

  ///Lita todos los comentarios de la db
  Future<List<Comentario>> listarTodosComentarios(
    Session session,
  ) async {
    final respuesta = await ejecutarConsultaSql(session, '''
    SELECT c."textoComentario",
           cl."nombre",
           cl."apellido"
    FROM 
        comentarios c
    JOIN clientes cl ON c."idAutor" = cl."idUsuario"
     
    ''', clavesMapaModeloDb: [
      'textoComentario',
      'nombre',
      'apellido',
    ]);

    return respuesta.map((e) => Comentario.fromJson(e, Protocol())).toList();
  }

  Future<Comentario?> obtenerComentario(
    Session session, {
    required int idComentario,
  }) async {
    return await Comentario.findById(session, idComentario);
  }

  /// La función `eliminarComentario` elimina un comentario con un ID
  /// determinado de una sesión.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y representa
  ///   la sesión o conexión de base de datos actual. Se utiliza para realizar
  ///   operaciones de bases de datos. idComentario (int): La identificación del
  ///   comentario que debe eliminarse.
  ///
  /// Returns:
  ///   un `Futuro<bool>`.
  Future<bool> eliminarComentario(
    Session session,
    int idComentario,
  ) async {
    try {
      await Comentario.delete(
        session,
        where: (t) => t.id.equals(idComentario),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `crearCommentario` se utiliza para crear un nuevo comentario.
  /// Toma como parámetros un objeto `Session` y un objeto `Commentario`. Luego
  /// llama al método `Comentario.insert` para insertar el comentario en la base
  /// de datos. Si la inserción es exitosa, devuelve "verdadero". Si se produce
  /// una excepción durante la inserción, genera una excepción con el mensaje
  /// de error.
  Future<Comentario> crearComentario(
    Session session, {
    required Comentario comentario,
  }) async {
    try {
      await Comentario.insert(
        session,
        comentario
          ..fechaCreacion = DateTime.now()
          ..ultimaModificacion = DateTime.now()
          ..idAutor = await session.auth.authenticatedUserId ?? 0,
      );
      final response = await Comentario.findSingleRow(
        session,
        where: (t) => t.idAutor.equals(comentario.idAutor),
        orderBy: ComentarioTable().ultimaModificacion,
        orderDescending: true,
      );
      final idbusqueda = response!.id;
      print(idbusqueda);
      final respuesta = await ejecutarConsultaSql(session, '''
    SELECT c."textoComentario",
           c."id",
           c."idEntregable",
           c."idAutorCompletado",
           c."completado",
           c."fechaCreacion",
           c."ultimaModificacion",
           c."fechaCompletado",
           c."fechaEliminacion",
           c."idAutor",
           cl."nombre",
           cl."apellido"
    FROM 
        comentarios c
    INNER JOIN clientes cl ON c."idAutor" = cl."idUsuario"
    WHERE c."id" = $idbusqueda;
     
    ''', clavesMapaModeloDb: [
        'textoComentario',
        'id',
        'idEntregable',
        'idAutorCompletado',
        'completado',
        'fechaCreacion',
        'ultimaModificacion',
        'fechaCompletado',
        'fechaEliminacion',
        'idAutor',
        'nombre',
        'apellido',
      ]);

      if (respuesta.isEmpty) {
        throw Exception('Comentario no encontrado');
      }
      print(respuesta);
      return respuesta
          .map(
            (e) => Comentario.fromJson(
              e
                ..['ultimaModificacion'] = e['ultimaModificacion'].toString()
                ..['fechaCreacion'] = e['fechaCreacion'].toString()
                ..['fechaCompletado'] = e['fechaCompletado'].toString()
                ..['fechaEliminacion'] = e['fechaEliminacion'].toString(),
              Protocol(),
            ),
          )
          .first;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `modificarComentario` se utiliza para modificar un
  /// comentario existente.
  /// Toma como parámetros un objeto `Session` y un objeto `Commentario`. Luego
  /// llama al método `Comentario.update` para actualizar el comentario en la
  /// base de datos. Si la actualización se realiza correctamente, devuelve
  /// "verdadero". Si se produce una excepción durante la actualización, genera
  /// una excepción con el mensaje de error.
  Future<bool> modificarComentario(
    Session session, {
    required Comentario comentario,
  }) async {
    try {
      return await Comentario.update(
        session,
        comentario,
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
