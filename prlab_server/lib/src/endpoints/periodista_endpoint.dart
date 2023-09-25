import 'package:prlab_server/src/generated/periodista.dart';
import 'package:prlab_server/src/servicios/servicio_periodista.dart';
import 'package:serverpod/serverpod.dart';

/// Endpoints pertenecientes a [Periodista].
class PeriodistaEndpoint extends Endpoint {

  /// Instancia del servicio de [Periodista].
  final servicioPeriodista = ServicioPeriodista();

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
