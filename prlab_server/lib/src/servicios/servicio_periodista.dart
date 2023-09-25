import 'package:prlab_server/src/generated/periodista.dart';
import 'package:prlab_server/src/orms/orm_periodista.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/serverpod.dart';

/// Servicio para administrar operaciones de entidad [Periodista].
class ServicioPeriodista extends Servicio<OrmPeriodista> {

  /// Instancia del ORM de [Periodista].
  @override
  final orm = OrmPeriodista();

  /// Recupera una lista de [Periodista] de acuerdo a diferentes filtros.
  Future<List<Periodista>> listarPeriodistas(
    Session session, {
    String nombreCompleto = '',
    String nombreDeMedio = '',
    List<int> idPaises = const [],
    List<int> idCiudades = const [],
    List<int> idTemas = const [],
    List<int> idIdiomas = const [],
    List<int> idTiposDeMedio = const [],
    List<int> idRoles = const [],
  }) async {
    return await ejecutarOperacion(
      () => orm.listarPeriodistas(
        session,
        nombreCompleto: nombreCompleto,
        nombreDeMedio: nombreDeMedio,
        idPaises: idPaises,
        idCiudades: idCiudades,
        idTemas: idTemas,
        idIdiomas: idIdiomas,
        idTiposDeMedio: idTiposDeMedio,
        idRoles: idRoles,
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
        idRoles: idRoles,
      ),
    );
  }
}
