import 'package:serverpod/server.dart';

class AuthRepository{
  Future<String> getValidationCode({required Session session, required String email}) async {
    var result = await session.db.query(
        'SELECT "verificationCode" FROM serverpod_email_create_request WHERE email = \'$email\'');
    if (result.isEmpty) {
      return 'Email not found';
    } else {
      return result.first.first;
    }
  }
}