import 'package:prlab_server/src/repositories/auth_repository.dart';
import 'package:serverpod/serverpod.dart';

/// La clase AuthService es responsable de manejar la funcionalidad relacionada con la autenticación.
class AuthService {
  final authRepository = AuthRepository();

  /// La función `getValidationCode` devuelve un Future que recupera un código de validación del
  /// `AuthRepository` mediante una sesión y un correo electrónico.
  ///
  /// Args:
  ///   session (Session): Un parámetro requerido de tipo Sesión. Representa la sesión de usuario actual
  /// y es necesaria para fines de autenticación.
  ///   email (String): El parámetro de correo electrónico es una cadena obligatoria que representa la
  /// dirección de correo electrónico para la que se solicita el código de validación.
  ///
  /// Returns:
  ///   El método devuelve un `Future<String>`.
  Future<String> getValidationCode({
    required Session session,
    required String email,
  }) async {
    return await authRepository.getValidationCode(
        session: session, email: email);
  }
}
