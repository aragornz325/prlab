import 'package:prlab_server/src/services/auth_service.dart';
import 'package:serverpod/server.dart';

class AuthEndpoint extends Endpoint {
  Future<String> getValidationCode(Session session, String email) async {
    return await AuthService()
        .getValidationCode(session: session, email: email);
  }
}
