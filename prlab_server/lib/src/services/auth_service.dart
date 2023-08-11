import 'package:prlab_server/src/repositories/auth_repository.dart';
import 'package:serverpod/serverpod.dart';

class AuthService {
  Future<String> getValidationCode({
    required Session session,
    required String email,
  }) async {
    return await AuthRepository()
        .getValidationCode(session: session, email: email);
  }
}
