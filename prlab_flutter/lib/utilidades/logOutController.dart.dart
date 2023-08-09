import 'package:prlab_flutter/utilidades/serverpod_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class LogOutController extends EmailAuthController {
  LogOutController(super.caller);

  Future<bool> signOut() async {
    try {
      await sessionManager.signOut();
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
