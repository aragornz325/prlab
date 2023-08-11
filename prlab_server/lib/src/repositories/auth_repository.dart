import 'package:serverpod/server.dart';

class AuthRepository {
  //trae de la tabla serverpod_email_create_request el codigo de verificacion
  // segun el email que se le pase
  Future<String> getValidationCode({
    required Session session,
    required String email,
  }) async {
    try {
      final result = await session.db.query(
          'SELECT "verificationCode" FROM serverpod_email_create_request WHERE email = \'$email\'');
      if (result.isEmpty) {
        return 'Email not found';
      } else {
        return result.first.first;
      }
    } catch (e) {
      rethrow;
    }
  }
}
