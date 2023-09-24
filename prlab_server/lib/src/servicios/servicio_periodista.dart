import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/odms/odm_periodista.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/serverpod.dart';

class ServicioPeriodista extends Servicio<OdmPeriodista> {
  @override
  final odm = OdmPeriodista();

  /// La función `crearPeriodista` crea un periodista llamando al método `odm.crearPeriodista` con los
  /// parámetros de sesión y periodista proporcionados.
  /// 
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión. Se utiliza para representar la
  /// sesión actual o la conexión a una base de datos u otro servicio externo.
  ///   periodista (Periodista): El parámetro "periodista" es un objeto de tipo "Periodista". Se
  /// requiere y representa al periodista que hay que crear.
  /// 
  /// Returns:
  ///   un `Futuro<bool>`.
  Future<bool> crearPeriodista({
    required Session session,
    required Periodista periodista,
  }) async {
    return await odm.crearPeriodista(
      session: session,
      periodista: periodista,
    );
  }

  /// La función `listarPeriodistas` devuelve un Futuro que se resuelve en una lista de objetos
  /// Periodista, usando la sesión proporcionada.
  /// 
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio.
  /// 
  /// Returns:
  ///   un objeto `Futuro` que se resuelve en una `Lista` de objetos `Periodista`.
  Future<List<Periodista>> listarPeriodistas({
    required Session session,
  }) async {
    return await odm.listarPeriodistas(
      session: session,
    );
  }

  /// La función `eliminarPeriodistaBorradoFisico` elimina un registro de periodista de la base de datos
  /// mediante un borrado físico.
  /// 
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión. Representa la sesión o conexión
  /// actual a la base de datos.
  ///   id (int): El parámetro id es un número entero que representa el identificador único del
  /// periodista que debe eliminarse.
  /// 
  /// Returns:
  ///   un `Futuro<bool>`.
  Future<bool> eliminarPeriodistaBorradoFisico({
    required Session session,
    required int id,
  }) async {
    return await odm.eliminarPeriodistaBorradoFisico(
      session: session,
      id: id,
    );
  }

  /// La función `eliminarPeriodistaBorradoLogico` es una función de Dart que toma como parámetros una
  /// sesión y un id y devuelve un Future<bool> indicando si la eliminación fue exitosa o no.
  /// 
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es obligatorio. Representa la
  /// sesión o conexión actual a la base de datos.
  ///   id (int): El parámetro id es un número entero que representa el identificador único del
  /// periodista que se eliminará lógicamente.
  /// 
  /// Returns:
  ///   un `Futuro<bool>`.
  Future<bool> eliminarPeriodistaBorradoLogico({
    required Session session,
    required int id,
  }) async {
    return await odm.eliminarPeriodistaBorradoLogico(
      session: session,
      id: id,
    );
  }

  /// La función `modificarPeriodista` es una función de Dart que toma un objeto `Session` y un objeto
  /// `Periodista`, y devuelve un `Future<bool>` que indica si la modificación fue exitosa o no.
  /// 
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión. Representa la sesión o conexión
  /// actual a la base de datos.
  ///   periodista (Periodista): El parámetro "periodista" es de tipo "Periodista", que es un objeto que
  /// representa a un periodista. Es obligatorio y debe proporcionarse al llamar a la función
  /// "modificarPeriodista".
  /// 
  /// Returns:
  ///   un `Futuro<bool>`.
  Future<bool> modificarPeriodista({
    required Session session,
    required Periodista periodista,
  }) async {
    return await odm.modificarPeriodista(
      session: session,
      periodista: periodista,
    );
  }
}
