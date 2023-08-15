import 'package:flutter/foundation.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';
import 'package:serverpod_auth_client/module.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

//TODO(cualquiera): mejorar naming de clase
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
  Future<AuthenticationResponse> iniciarSesion(
    String email,
    String password,
  ) async {
    try {
      final serverResponse = await caller.email.authenticate(email, password);

      if (!serverResponse.success) {
        throw Exception(
          'ERROR: Algo salió mal, ${serverResponse.failReason}',
        );
      }

      if (serverResponse.userInfo == null ||
          serverResponse.keyId == null ||
          serverResponse.key == null) {
        throw Exception(
          'ERROR: Algo salió mal, valores requeridos faltantes',
        );
      }

      return serverResponse;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('$e');
        print('$stackTrace');
      }

      throw Exception(
        'ERROR: Algo salió mal, error: $e, stackTrace: $stackTrace',
      );
    }
  }

  // Future<bool> cuenta(
  //   String userName,
  //   String email,
  //   String password,
  // ) async {
  //   try {
  //     return await caller.email.createAccountRequest(
  //       userName,
  //       email,
  //       password,
  //     );
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

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

// void main() async {
//   client = Client(
//     'https://prlab-production.up.railway.app/',
//     // authenticationKeyManager: FlutterAuthenticationKeyManager(
//     //   runMode: 'staging',
//     //   storage: SharedPreferenceStorage(),
//     // ),
//   )..connectivityMonitor = FlutterConnectivityMonitor();

//   final s = EmailAuthControllerCustomPRLab(client.modules.auth);

//   await s.cuenta();
// }
