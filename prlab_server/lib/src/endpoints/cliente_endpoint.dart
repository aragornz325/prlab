import 'package:prlab_commons/prlab_commons.dart';
import 'package:serverpod/serverpod.dart';

class ClienteEndpoint extends Endpoint {
  Future<int> crearOrganizacion(Session session, Organizacion orga) async {
    try {
      session.db.insert(orga);
      return 200;
    } catch (e, st) {
      print('$e, $st');
      return 500;
    }
  }

  Future<int> crearLog(Session session, MensajeRegistro log) async {
    try {
      session.db.insert(log);
      return 200;
    } catch (e, st) {
      print('$e, $st');
      return 500;
    }
  }
}
