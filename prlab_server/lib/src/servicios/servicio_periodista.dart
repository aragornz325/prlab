import 'package:prlab_server/src/generated/periodista.dart';
import 'package:prlab_server/src/odms/odm_periodista.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/serverpod.dart';

class ServicioPeriodista extends Servicio<OdmPeriodista> {
  @override
  final odm = OdmPeriodista();

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
  }) async {
    return odm.listarPeriodistas(
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
