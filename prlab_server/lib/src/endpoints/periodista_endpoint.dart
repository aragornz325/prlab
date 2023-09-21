import 'package:prlab_server/src/generated/periodista.dart';
import 'package:prlab_server/src/servicios/servicio_periodista.dart';
import 'package:serverpod/serverpod.dart';

class PeriodistaEndpoint extends Endpoint {
  final servicioPeriodista = ServicioPeriodista();

  // Future<bool> crearPeriodista(
  //   Session session, {
  //   required Periodista periodista,
  // }) async {

  // }

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
    SortBy
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
}
