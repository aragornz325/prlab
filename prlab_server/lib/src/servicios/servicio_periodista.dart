import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/orms/orm_periodista.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/serverpod.dart';
import 'package:prlab_server/src/generated/periodista.dart';

class ServicioPeriodista extends Servicio<OrmPeriodista> {
  @override
  final orm = OrmPeriodista();

  /// La función `crearPeriodista` crea un periodista llamando al método `orm.crearPeriodista` con los
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
    return await orm.crearPeriodista(
      session: session,
      periodista: periodista,
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
    return await orm.eliminarPeriodistaBorradoFisico(
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
    return await orm.eliminarPeriodistaBorradoLogico(
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
    return await orm.modificarPeriodista(
      session: session,
      periodista: periodista,
    );
  }

  /// Recupera una lista de [Periodista] de acuerdo a diferentes filtros.
  Future<List<Periodista>> listarPeriodistas(
    Session session, {
    String nombres = '',
    String nombreDeMedio = '',
    List<int> idPaises = const [],
    List<int> idCiudades = const [],
    List<int> idTemas = const [],
    List<int> idIdiomas = const [],
    List<int> idTiposDeMedio = const [],
    List<int> idPuestos = const [],
  }) async {
    return await ejecutarOperacion(
      () => orm.listarPeriodistas(
        session,
        nombres: nombres,
        nombreDeMedio: nombreDeMedio,
        idPaises: idPaises,
        idCiudades: idCiudades,
        idTemas: idTemas,
        idIdiomas: idIdiomas,
        idTiposDeMedio: idTiposDeMedio,
        idPuestos: idPuestos,
      ),
    );
  }

  /// Obtiene las categorías de filtrado de [Periodista] con su nombre, id y
  /// recuento de acuerdo a los filtros.
  Future<Map> obtenerListaDeFiltrosConRecuento(
    Session session, {
    List<int> idPaises = const [],
    List<int> idCiudades = const [],
    List<int> idIdiomas = const [],
    List<int> idTemas = const [],
    List<int> idTiposDeMedio = const [],
    List<int> idRoles = const [],
  }) async {
    return await ejecutarOperacion(
      () => orm.obtenerListaDeFiltrosConRecuento(
        session,
        idPaises: idPaises,
        idCiudades: idCiudades,
        idIdiomas: idIdiomas,
        idTemas: idTemas,
        idTiposDeMedio: idTiposDeMedio,
        idPuestos: idRoles,
      ),
    );
  }
}
