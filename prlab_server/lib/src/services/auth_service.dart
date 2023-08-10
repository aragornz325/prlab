import 'package:serverpod/serverpod.dart';

class AuthService {
  Future<String> getValidationCode(Session session, String email) async {
    var result = await session.db.query(
        'SELECT "verificationCode" FROM serverpod_email_create_request WHERE email = \'$email\'');
    if (result.isEmpty) {
      return 'Email not found';
    } else {
      return result.first.first;
    }
  }
}
