import 'package:flutter/foundation.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';
import 'package:serverpod_auth_client/module.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class EmailAuthControllerCustomPRLab extends EmailAuthController {
  EmailAuthControllerCustomPRLab(super.caller);

  /// La función `iniciarSesion` es una función asíncrona de Dart que toma
  /// un correo electrónico y una
  /// contraseña como parámetros y devuelve un `Future` de tipo
  /// `AuthenticationResponse` o `null`.
  ///
  /// Args:
  ///   email (String): Un string que representa la dirección de correo
  ///   electrónico del usuario.
  ///   password (String): Un string que representa la contraseña del usuario.
  Future<AuthenticationResponse?> iniciarSesion(
    String email,
    String password,
  ) async {
    try {
      final serverResponse = await caller.email.authenticate(email, password);

      if (!serverResponse.success ||
          serverResponse.userInfo == null ||
          serverResponse.keyId == null ||
          serverResponse.key == null) {
        return null;
      }

      return serverResponse;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('$e');
        print('$stackTrace');
      }
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await sessionManager.signOut();
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
