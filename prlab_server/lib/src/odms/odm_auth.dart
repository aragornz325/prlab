// ignore_for_file: avoid_escaping_inner_quotes, lines_longer_than_80_chars

import 'package:prlab_server/src/generated/error_pr_lab.dart';
import 'package:prlab_server/src/odm.dart';
import 'package:prlab_server/utils/manejo_de_errores/manejo_de_errores.dart';
import 'package:serverpod/database.dart';
import 'package:serverpod/server.dart';

/// La clase AuthRepository es responsable de manejar las operaciones contra la
/// DB relacionadas con la autenticación.

class OdmAuth extends ODM {
  /// La función [getValidationCode] recupera el código de verificación
  /// asociado con un correo electrónico determinado de la tabla
  /// serverpod_email_create_request de la base de datos.
  ///
  /// Args:
  ///   [session] ([Session]): El parámetro [session] es del tipo Session y es
  /// obligatorio. Representa la sesión o conexión actual a la base de datos.
  ///   [email] ([String]): El parámetro de correo electrónico es una cadena
  /// obligatoria que representa la
  /// dirección de correo electrónico para la que se recupera el código de
  /// validación.

  Future<String> getValidationCode({
    required Session session,
    required String email,
  }) async {
    final result = await ejecutarOperacionOdm(
      session,
      (Session session) => session.db.query(
        'SELECT "verificationCode" FROM serverpod_email_create_request WHERE email = \'$email\'',
      ),
    );

    if (result.isEmpty) {
      const error = ErrorPrLab.errorElementoNoEncontrado;
      throw ExceptionPrLab(mensaje: error.mensaje, errorType: error);
    }

    return result.first.first;
  }

  /// La función [guardarTokenEnDb] guarda un token y un correo electrónico en
  /// una tabla de base de datos llamada [registro_token_email].
  ///
  /// Args:
  ///   [session] ([Session]): El parámetro de sesión es un objeto que representa
  /// la sesión actual o la conexión a la base de datos. Es necesario para
  /// ejecutar la consulta de la base de datos.
  ///   [token] ([String]): Una cadena que representa el token que debe guardarse
  /// en la base de datos.
  ///   [email] ([String]): El parámetro de correo electrónico es una cadena
  /// obligatoria que representa la dirección de correo electrónico asociada
  /// con el token.
  ///

  Future<bool> guardarTokenEnDb({
    required Session session,
    required String token,
    required String email,
    required int tipoDeInvitacion,
  }) async {
    await ejecutarOperacionOdm(
      session,
      (Session session) => session.db.transaction((Transaction txn) async {
        final checkearToken = await session.db
            .query('SELECT token FROM invitaciones WHERE email = \'$email\'');

        if (checkearToken.isNotEmpty) {
          await session.db
              .query('DELETE FROM invitaciones WHERE email = \'$email\'');
        }

        await session.db.query(
          'INSERT INTO invitaciones (email, token, "tipoDeInvitacion") VALUES (\'$email\', \'$token\', \'$tipoDeInvitacion\')',
        );
      }),
    );

    return true;
  }

  /// La función [traerTokenPorEmail] recupera un token de una tabla de base de
  /// datos en función del correo electrónico proporcionado.
  ///
  /// Args:
  ///   [session] ([Session]): El parámetro de sesión es de tipo Sesión y es
  /// obligatorio. Se utiliza para acceder a la base de datos y realizar
  /// consultas.
  ///   [email] ([String]): El parámetro de correo electrónico es una cadena
  /// obligatoria que representa la dirección de correo electrónico para la que
  /// queremos recuperar el token.

  Future<String> traerTokenPorEmail({
    required Session session,
    required String email,
  }) async {
    final List<List<dynamic>> result = await ejecutarOperacionOdm(
      session,
      (Session session) => session.db
          .query('SELECT token FROM invitaciones WHERE email = \'$email\''),
    );

    if (result.isEmpty) {
      const error = ErrorPrLab.errorElementoNoEncontrado;
      throw ExceptionPrLab(mensaje: error.mensaje, errorType: error);
    }

    return result.first.first;
  }

  /// La función [validarCodigoResetPassword] verifica si un código de
  /// verificación dado es válido consultando una tabla de base de datos.
  ///
  /// Args:
  ///   [session] ([Session]): Este parametro es de tipo Sesión y es
  /// obligatorio. Representa la sesión o conexión actual a la base de datos.
  ///   [codigo] ([String]): Este parametro es una cadena requerida que
  /// representa el código de verificación para restablecer una contraseña.
  ///

  Future<List<dynamic>> validarCodigoResetPassword({
    required Session session,
    required String codigo,
  }) async {
    final result = await ejecutarOperacionOdm(
      session,
      (Session session) => session.db.query(
        'SELECT * FROM serverpod_email_reset WHERE "verificationCode" = \'$codigo\'',
      ),
    );

    if (result.isEmpty) {
      const error = ErrorPrLab.errorElementoNoEncontrado;
      throw ExceptionPrLab(mensaje: error.mensaje, errorType: error);
    }

    return result;
  }

  /// La función [eliminarOTPResetPassword] elimina un registro de la tabla
  /// [serverpod_email_reset] según un código de verificación determinado.
  ///
  /// Args:
  ///   [session] ([Session]): El parámetro "sesion" es de tipo Sesión y es
  /// obligatorio. Representa la sesión actual o la conexión a la base de datos.
  ///   [codigo] ([String]): El parámetro "código" es una cadena obligatoria que
  /// representa el código de verificación utilizado para restablecer una
  /// contraseña.
  ///
  Future<List<dynamic>> eliminarOTPResetPassword({
    required Session session,
    required String codigo,
  }) async =>
      ejecutarOperacionOdm(
        session,
        (Session session) => session.db.query(
          'DELETE FROM serverpod_email_reset WHERE "verificationCode" = \'$codigo\'',
        ),
      );

  /// La función [checkearCodigoOTP] verifica si un código de verificación dado
  /// existe en la base de datos.
  ///
  /// Args:
  ///   [session] ([Session]): El parámetro de sesión es de tipo Sesión y es
  /// obligatorio. Representa la sesión o conexión actual a la base de datos.
  ///   [codigo] ([String]): El parámetro código es una cadena requerida que
  /// representa el código OTP (contraseña de un solo uso) que debe verificarse.
  ///
  Future<bool> checkearCodigoOTP({
    required Session session,
    required String codigo,
  }) async {
    final codigoEnDb = await ejecutarOperacionOdm(
      session,
      (Session session) => session.db.query(
        'SELECT * FROM serverpod_email_reset WHERE "verificationCode" = \'$codigo\'',
      ),
    );

    if (codigoEnDb.isEmpty) {
      session.log('codigo $codigo no encontrado en la db');
      return false;
    } else {
      return true;
    }
  }
}
