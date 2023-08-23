import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
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

  /// La función `validarTokenPorMail` valida un token decodificándolo, recuperando el correo
  /// electrónico de la carga útil del token, comparando el token con el almacenado en la base de datos
  /// y verificando el token usando una clave secreta.
  ///
  /// Args:
  ///   session (Session): Un objeto de sesión que contiene información sobre la sesión de usuario
  /// actual.
  ///   token (String): El token es una cadena que representa un JWT (JSON Web Token). Se utiliza con
  /// fines de autenticación y autorización.
  ///
  /// Returns:
  ///   El método `validarTokenPorMail` devuelve un el correo electronico del token
  Future<String> validarTokenPorMail({
    required Session session,
    required String token,
  }) async {
    try {
      final tokenAbierto = JWT.decode(token);
      final emailToken = tokenAbierto.payload['email'];
      final tokenDb = await authRepository.traerTokenPorEmail(
          session: session, email: emailToken);

      if (tokenDb.isEmpty) {
        throw Exception('Token no valido');
      }

      if (token != tokenDb) {
        throw Exception('Token no valido');
      }

      JWT.verify(token, SecretKey('sweetHomeAlabama'));
      
      return emailToken;
    } catch (e) {
      rethrow;
    }
  }

  /// La función `validarCodigoResetPassword` toma una sesión y un código como parámetros y llama a la
  /// función `validarCodigoResetPassword` desde el `authRepository` para validar el código para
  /// restablecer la contraseña.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. Representa la
  /// sesión de usuario actual o la sesión de autenticación.
  ///   codigo (String): El parámetro "codigo" es una cadena requerida que representa el código de
  /// restablecimiento de contraseña.
  ///
  Future<bool> validarCodigoResetPassword({
    required Session session,
    required String codigo,
  }) async {
    try {
      final validarEnDb = await authRepository.validarCodigoResetPassword(
        session: session,
        codigo: codigo,
      );
      if (validarEnDb.isEmpty) {
        throw Exception('Codigo no valido');
      } else {
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  /// La función `eliminarOTPResetPassword` es una función de Dart que toma una sesión y un código, e
  /// intenta eliminar el código de la base de datos, devolviendo verdadero si tiene éxito.
  ///
  /// Args:
  ///   session (Session): Un parámetro requerido de tipo Sesión, que representa la información de la
  /// sesión del usuario.
  ///   codigo (String): El parámetro "codigo" es un String requerido que representa el código OTP
  /// (One-Time Password) para restablecer la contraseña.
  ///
  Future<bool> eliminarOTPResetPassword({
    required Session session,
    required String codigo,
  }) async {
    try {
      session.log('chequeando codigo: $codigo');
      final checkearCodigoOTP = await authRepository.checkearCodigoOTP(
        session: session,
        codigo: codigo,
      );

      if (checkearCodigoOTP == false) {
        throw Exception('el codigo no existe');
      }

      await authRepository.eliminarOTPResetPassword(
        session: session,
        codigo: codigo,
      );
      session.log('codigo otp $codigo eliminado');
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
