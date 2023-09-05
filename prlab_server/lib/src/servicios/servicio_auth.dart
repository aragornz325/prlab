// ignore: lines_longer_than_80_chars
// ignore_for_file: unnecessary_await_in_return, avoid_dynamic_calls, overridden_fields

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:prlab_server/src/odms/odm_auth.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:prlab_server/utils/config/constants.dart';
import 'package:serverpod/serverpod.dart';

/// La clase AuthService es responsable de manejar la funcionalidad relacionada
/// con la autenticación.
class ServicioAuth extends Servicio<OdmAuth> {
  @override
  final odm = OdmAuth();

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
    logger.info('Se obtendra el codigo de validacion para $email');
    return await ejecutarOperacion(
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
      final JWT tokenAbierto = ejecutarOperacionToken(() => JWT.decode(token));
      final String emailToken = tokenAbierto.payload['email'];

      logger.finest('Buscando token en db');
      final String tokenDb = await ejecutarOperacion(
        () => odm.traerTokenPorEmail(session: session, email: emailToken),
      );

      if (tokenDb.isEmpty) {
        logger.shout('Token no encontrado en la db');
        throw Exception('Token no valido');
      }

      if (token != tokenDb) {
        logger.shout('El token no coincide con el de la db');
        throw Exception('Token no valido');
      }

      ejecutarOperacionToken(
        () => JWT.verify(
          token,
          SecretKey(
            ConstantesPrLab.jwtSecret,
          ),
        ),
      );

      logger.finest('Token validado con exito');
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
      final List<dynamic> validarEnDb = await ejecutarOperacion(
        () => odm.validarCodigoResetPassword(
          session: session,
          codigo: codigo,
        ),
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
      logger.info('Eliminando código OTP $codigo...');

      final bool checkearCodigoOTP = await ejecutarOperacion(
        () => odm.checkearCodigoOTP(
          session: session,
          codigo: codigo,
        ),
      );

      if (!checkearCodigoOTP) {
        logger.shout('Codigo no encontrado');
        throw Exception('Codigo no valido');
      }

      await ejecutarOperacion(
        () => odm.eliminarOTPResetPassword(
          session: session,
          codigo: codigo,
        ),
      );

      logger.finest('Código OTP eliminado');

      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
