import 'package:prlab_flutter/utilidades/serverpod_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class LogOutController extends EmailAuthController {
  LogOutController(super.caller);

  /// La función signOut es un future que devuelve un valor booleano que indica
  /// si el proceso de cierre de sesión fue exitoso o no.
  Future<bool> signOut() async {
    try {
      await sessionManager.signOut();
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
