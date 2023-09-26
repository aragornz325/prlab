import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/servicios/servicio_periodista.dart';
import 'package:serverpod/serverpod.dart';
import 'package:prlab_server/src/generated/periodista.dart';

class PeriodistaEndpoint extends Endpoint {
  final servicioPeriodista = ServicioPeriodista();

  Future<bool> crearPeriodista(
    Session session, {
    required Periodista periodista,
  }) async {
    return await servicioPeriodista.crearPeriodista(
        session: session, periodista: periodista);
  }

  Future<bool> eliminarPeriodistaBorradoFisico(
    Session session, {
    required int id,
  }) async {
    return await servicioPeriodista.eliminarPeriodistaBorradoFisico(
      session: session,
      id: id,
    );
  }

  Future<bool> eliminarPeriodistaBorradoLogico(
    Session session, {
    required int id,
  }) async {
    return await servicioPeriodista.eliminarPeriodistaBorradoLogico(
      session: session,
      id: id,
    );
  }

  Future<bool> modificarPeriodista(
    Session session, {
    required Periodista periodista,
  }) async {
    return await servicioPeriodista.modificarPeriodista(
      session: session,
      periodista: periodista,
    );
  }

  /// Recupera una lista de [Periodista] de acuerdo a diferentes filtros.
  Future<List<Periodista>> listarPeriodistas(
    Session session, {
    String? nombreCompleto,
    String? nombreDeMedio,
    List<int>? idPaises,
    List<int>? idCiudades,
    List<int>? idTemas,
    List<int>? idIdiomas,
    List<int>? idTiposDeMedio,
    List<int>? idRoles,
  }) async {
    return servicioPeriodista.listarPeriodistas(
      session,
      nombreCompleto: nombreCompleto ?? '',
      nombreDeMedio: nombreDeMedio ?? '',
      idPaises: idPaises ?? const [],
      idCiudades: idCiudades ?? const [],
      idTemas: idTemas ?? const [],
      idIdiomas: idIdiomas ?? const [],
      idTiposDeMedio: idTiposDeMedio ?? const [],
      idRoles: idRoles ?? const [],
    );
  }

  /// Obtiene las categorías de filtrado de [Periodista] con su nombre, id y
  /// recuento de acuerdo a los filtros.
  Future<Map> obtenerListaDeFiltrosConRecuento(
    Session session, {
    List<int>? idPaises,
    List<int>? idCiudades = const [],
    List<int>? idIdiomas = const [],
    List<int>? idTemas = const [],
    List<int>? idTiposDeMedio = const [],
    List<int>? idRoles = const [],
  }) async {
    return await servicioPeriodista.obtenerListaDeFiltrosConRecuento(
      session,
      idPaises: idPaises ?? const [],
      idCiudades: idCiudades ?? const [],
      idIdiomas: idIdiomas ?? const [],
      idTemas: idTemas ?? const [],
      idTiposDeMedio: idTiposDeMedio ?? const [],
      idRoles: idRoles ?? const [],
    );
  }
}
