import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/odm.dart';
import 'package:serverpod/serverpod.dart';

class OdmPeriodista extends ODM {
  
  
  
  /// La función `crearPeriodista` crea un nuevo periodista insertándolo en una base de datos mediante
  /// un ODM (Object-Document Mapper) y devuelve un booleano que indica si la creación fue exitosa o no.
  /// 
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es obligatorio. Representa la
  /// sesión o conexión actual a la base de datos.
  ///   periodista (Periodista): El parámetro "periodista" es un objeto de tipo "Periodista" que
  /// representa a un periodista. Contiene información como el nombre del periodista, fecha de creación
  /// y fecha de última modificación.

  Future<bool> crearPeriodista({
    required Session session,
    required Periodista periodista,
  }) async {
    try {
      await ejecutarOperacionOdm(
        session,
        (Session session) {
          logger.finer('Creando periodista: ${periodista.nombre}');
          return Periodista.insert(
            session,
            periodista
              ..fechaDeCreacion = DateTime.now()
              ..ultimaModificacion = DateTime.now(),
          );
        },
      );
      logger.fine('Periodista ${periodista.nombre} creada exitosamente.');
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

 
  /// La función `listarPeriodistas` recupera una lista de periodistas activos usando un ODM y una
  /// sesión.
  /// 
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. Se utiliza para
  /// realizar operaciones en la sesión de la base de datos.
  /// 
  /// Returns:
  ///   El método devuelve un objeto Futuro que se resuelve en una Lista de objetos Periodista.
  Future<List<Periodista>> listarPeriodistas({
    required Session session,
  }) async {
    try {
      return await ejecutarOperacionOdm(
        session,
        (session) => Periodista.find(
          session,
          where: (t) => t.activo.equals(true),
        ),
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

 /// La función `eliminarPeriodistaBorradoFisico` elimina a un periodista de la base de datos mediante
 /// un método de eliminación física.
 /// 
 /// Args:
 ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. Representa la
 /// sesión o conexión actual a la base de datos.
 ///   id (int): El parámetro id es un número entero que representa el identificador único del
 /// periodista que debe eliminarse.
 /// 
 /// Returns:
 ///   un `Futuro<bool>`.
  Future<bool> eliminarPeriodistaBorradoFisico({
    required Session session,
    required int id,
  }) async {
    try {
      await ejecutarOperacionOdm(
        session,
        (session) => Periodista.delete(
          session,
          where: (t) => t.id.equals(id),
        ),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `eliminarPeriodistaBorradoLogico` es una función de Dart que realiza una eliminación
  /// lógica de un periodista actualizando su campo `activo` a `false` y configurando el campo
  /// `ultimaModificacion` a la fecha y hora actuales.
  /// 
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión, que representa la sesión o conexión
  /// actual a la base de datos.
  ///   id (int): El parámetro `id` es un número entero que representa el identificador único del
  /// periodista que debe eliminarse lógicamente.
  /// 
  /// Returns:
  ///   un `Futuro<bool>`.
  Future<bool> eliminarPeriodistaBorradoLogico({
    required Session session,
    required int id,
  }) async {
    try {
      final periodistaDB = await ejecutarOperacionOdm(
        session,
        (session) => Periodista.find(
          session,
          where: (t) => t.id.equals(id),
        ),
      );
      await ejecutarOperacionOdm(
        session,
        (session) => Periodista.update(
          session,
          periodistaDB.first
            ..activo = false
            ..ultimaModificacion = DateTime.now(),
        ),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `modificarPeriodista` actualiza la información de un periodista y devuelve un valor
  /// booleano que indica si la actualización fue exitosa o no.
  /// 
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. Representa la
  /// sesión o conexión actual a la base de datos.
  ///   periodista (Periodista): El parámetro "periodista" es un objeto de tipo "Periodista". Representa
  /// a un periodista y contiene información sobre él, como su nombre, edad y otros detalles relevantes.
  /// 
  /// Returns:
  ///   un `Futuro<bool>`.
  Future<bool> modificarPeriodista({
    required Session session,
    required Periodista periodista,
  }) async {
    try {
      await ejecutarOperacionOdm(
        session,
        (session) => Periodista.update(
          session,
          periodista..ultimaModificacion = DateTime.now(),
        ),
      );
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
