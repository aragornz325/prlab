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
    String nombre = '',
    String nombreDeMedio = '',
    List<int> idPaises = const [],
    List<int> idCiudades = const [],
    List<int> idTemas = const [],
    List<int> idIdiomas = const [],
    List<int> idTiposDeMedio = const [],
    List<int> idRoles = const [],
    SortBy
  }) async {
    return servicioPeriodista.listarPeriodistas(
      session,
      nombre: nombre,
      nombreDeMedio: nombreDeMedio,
      idPaises: idPaises,
      idCiudades: idCiudades,
      idTemas: idTemas,
      idIdiomas: idIdiomas,
      idTiposDeMedio: idTiposDeMedio,
      idRoles: idRoles,
    );
  }
}
