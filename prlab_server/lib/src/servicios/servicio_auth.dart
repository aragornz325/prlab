// ignore: lines_longer_than_80_chars
// ignore_for_file: unnecessary_await_in_return, avoid_dynamic_calls, overridden_fields

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:prlab_server/src/odms/odm_auth.dart';
import 'package:prlab_server/src/servicio.dart';
import 'package:prlab_server/utils/config/constants.dart';
import 'package:serverpod/serverpod.dart';

/// La clase [ServicioAuth] es responsable de manejar la funcionalidad 
/// relacionada con la autenticación.
class ServicioAuth extends Servicio<OdmAuth> {
  @override
  final odm = OdmAuth();

  /// Retorna el código de validación asociado a una dirección de [email].
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [email] ([String]): Dirección de email a validarse.
  Future<String> getValidationCode(
    Session session,{
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

  /// Verifica un token.
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [token] ([String]): JSON Web token que contiene una dirección de email.
  Future<String> validarTokenPorMail(
    Session session,{
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

  /// Valida un código para restauración de contraseña.
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [codigo] ([String]): Un código para restaurar contraseña.
  Future<bool> validarCodigoResetPassword(
    Session session,{
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

  /// Elimina un código OTP de la Base de Datos.
  ///
  /// Args:
  ///   [session] ([Session]): Requerido por Serverpod. Un objeto de sesión que
  /// contiene datos de la conexión.
  ///   [codigo] ([String]): Un código para restaurar contraseña guardado en la 
  /// Base de Datos.
  Future<bool> eliminarOTPResetPassword(
    Session session,{
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
