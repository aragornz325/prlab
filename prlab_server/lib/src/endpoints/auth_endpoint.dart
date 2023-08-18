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
    return await authService.validarTokenPorMail(
      session: session,
      token: token,
    );
  }

  /// La función `validarCodigoResetPassword` toma un objeto `Session` y una cadena `codigo` como
  /// parámetros y devuelve un `Future<bool>` que indica si el código de restablecimiento de contraseña
  /// es válido.
  ///
  /// Args:
  ///   session (Session): Un objeto Session que representa la sesión de usuario actual.
  ///   codigo (String): El parámetro "codigo" es una cadena que representa el código de restablecimiento
  /// de contraseña que debe validarse.
  ///
  Future<bool> validarCodigoResetPassword(
    Session session,
    String codigo,
  ) {
    return authService.validarCodigoResetPassword(
      session: session,
      codigo: codigo,
    );
  }

  /// La función `eliminarOTPResetPassword` llama al método `eliminarOTPResetPassword` desde
  /// `authService` y devuelve `Future<bool>`.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y representa la información de la
  /// sesión del usuario. Se utiliza para autenticar y autorizar al usuario para la operación.
  ///   codigo (String): El parámetro "codigo" es una cadena que representa el código utilizado para
  /// restablecer la contraseña.
  ///
  Future<bool> eliminarOTPResetPassword(
    Session session,
    String codigo,
  ) {
    return authService.eliminarOTPResetPassword(
      session: session,
      codigo: codigo,
    );
  }
}
