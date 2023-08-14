import 'package:prlab_commons/prlab_commons.dart';
import 'package:serverpod/serverpod.dart';

class ClienteEndpoint extends Endpoint {
  Future<String> crearOrganizacion(Session session, Organizacion orga) async {
    try {
      print("Llegamos acá");
      
      session.db.insert(orga.copyWith(fechaCreacion: DateTime.now()));
      return "true";
    } catch (e, st) {
      return "$e, $st";
    }
  }
}
