import 'package:prlab_server/src/services/auth_service.dart';
import 'package:serverpod/server.dart';

/// La clase `AuthEndpoint` está ampliando la clase `Endpoint`. por tanto maneja
/// todas las peticiones relacionadas con el auth del sistema
class AuthEndpoint extends Endpoint {
  final authService = AuthService();

  /// La función `getValidationCode` devuelve un Future que recupera un código de validación del
  /// `AuthService` utilizando la sesión y el correo electrónico proporcionados.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es un objeto que representa la sesión de usuario
  /// actual. Puede contener información como el token de autenticación del usuario o el ID de sesión.
  ///   email (String): El parámetro de correo electrónico es una cadena que representa la dirección de
  /// correo electrónico del usuario para el que se solicita el código de validación.
  ///
  /// retorna un `Future<String>` (el codigo en si).
  Future<String> getValidationCode(
    Session session,
    String email,
  ) async {
    return await authService.getValidationCode(session: session, email: email);
  }


  Future<String> validarTokenPorMail(
    Session session,
    String token,
  ) async {
    return await authService.validarTokenPorMail(session: session, token: token,);
  }
}
