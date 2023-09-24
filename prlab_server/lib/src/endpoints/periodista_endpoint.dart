import 'package:prlab_server/src/generated/protocol.dart';
import 'package:prlab_server/src/servicios/servicio_periodista.dart';
import 'package:serverpod/serverpod.dart';

class PeriodistaEndpoint extends Endpoint {
  final servicioPeriodista = ServicioPeriodista();

  Future<bool> crearPeriodista(
    Session session, {
    required Periodista periodista,
  }) async {
    return await servicioPeriodista.crearPeriodista(
        session: session, periodista: periodista);
  }

  Future<List<Periodista>> listarPeriodistas(
    Session session,
  ) async {
    return await servicioPeriodista.listarPeriodistas(session: session);
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
}
