// ignore: lines_longer_than_80_chars
// ignore_for_file: unnecessary_await_in_return, avoid_dynamic_calls, overridden_fields

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:prlab_server/src/odms/odm_auth.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:serverpod/serverpod.dart';
import 'package:simple_logger/simple_logger.dart';

/// La clase AuthService es responsable de manejar la funcionalidad relacionada
/// con la autenticación.
class ServicioAuth extends Servicio<OdmAuth> {
  @override
  final OdmAuth odm = OdmAuth();

  /// La función `getValidationCode` devuelve un Future que recupera un código
  /// de validación del `AuthRepository` mediante una sesión y un correo
  /// electrónico.
  ///
  /// Args:
  ///   session (Session): Un parámetro requerido de tipo Sesión. Representa la
  /// sesión de usuario actual
  /// y es necesaria para fines de autenticación.
  ///   email (String): El parámetro de correo electrónico es una cadena
  /// obligatoria que representa la dirección de correo electrónico para la que
  /// se solicita el código de validación.
  ///
  /// Returns:
  ///   El método devuelve un `Future<String>`.
  Future<String> getValidationCode({
    required Session session,
    required String email,
  }) async {
    logger.d('probando el logger');
    sLogger.shout(() => 'probando el logger');
    return await performOperation(
      () => odm.getValidationCode(
        session: session,
        email: email,
      ),
    );
  }

  /// La función `validarTokenPorMail` valida un token decodificándolo,
  /// recuperando el correo electrónico de la carga útil del token, comparando
  /// el token con el almacenado en la base de datos y verificando el token
  /// usando una clave secreta.
  ///
  /// Args:
  ///   session (Session): Un objeto de sesión que contiene información sobre
  /// la sesión de usuario actual.
  ///   token (String): El token es una cadena que representa un JWT (JSON Web
  /// Token). Se utiliza con fines de autenticación y autorización.
  ///
  /// Returns:
  ///   El método `validarTokenPorMail` devuelve un el correo electronico del
  /// token.
  Future<String> validarTokenPorMail({
    required Session session,
    required String token,
  }) async {
    try {
      final JWT tokenAbierto = JWT.decode(token);
      final String emailToken = tokenAbierto.payload['email'];
      final String tokenDb =
          await odm.traerTokenPorEmail(session: session, email: emailToken);

      if (tokenDb.isEmpty) {
        throw Exception('Token no valido');
      }

      if (token != tokenDb) {
        throw Exception('Token no valido');
      }

      JWT.verify(token, SecretKey('sweetHomeAlabama'));

      return emailToken;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `validarCodigoResetPassword` toma una sesión y un código como
  /// parámetros y llama a la función `validarCodigoResetPassword` desde el
  /// `authRepository` para validar el código para restablecer la contraseña.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es
  /// obligatorio. Representa la sesión de usuario actual o la sesión de
  /// autenticación.
  ///   codigo (String): El parámetro "codigo" es una cadena requerida que
  /// representa el código de restablecimiento de contraseña.
  Future<bool> validarCodigoResetPassword({
    required Session session,
    required String codigo,
  }) async {
    try {
      final List<dynamic> validarEnDb = await odm.validarCodigoResetPassword(
        session: session,
        codigo: codigo,
      );
      if (validarEnDb.isEmpty) {
        throw Exception('Codigo no valido');
      } else {
        return true;
      }
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `eliminarOTPResetPassword` es una función de Dart que toma una
  /// sesión y un código, e intenta eliminar el código de la base de datos,
  /// devolviendo verdadero si tiene éxito.
  ///
  /// Args:
  ///   session (Session): Un parámetro requerido de tipo Sesión, que
  /// representa la información de la sesión del usuario.
  ///   codigo (String): El parámetro "codigo" es un String requerido que
  /// representa el código OTP (One-Time Password) para restablecer la
  /// contraseña.
  Future<bool> eliminarOTPResetPassword({
    required Session session,
    required String codigo,
  }) async {
    try {
      session.log('chequeando codigo: $codigo');
      final bool checkearCodigoOTP = await odm.checkearCodigoOTP(
        session: session,
        codigo: codigo,
      );

      if (!checkearCodigoOTP) {
        throw Exception('el codigo no existe');
      }

      await odm.eliminarOTPResetPassword(
        session: session,
        codigo: codigo,
      );
      session.log('codigo otp $codigo eliminado');
      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
