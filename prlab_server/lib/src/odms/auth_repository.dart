// ignore_for_file: avoid_escaping_inner_quotes, lines_longer_than_80_chars

import 'package:prlab_server/src/odm.dart';
import 'package:serverpod/database.dart';
import 'package:serverpod/server.dart';

/// La clase AuthRepository es responsable de manejar las operaciones contra la
/// DB relacionadas con la autenticación.

class AuthODM extends ODM {
  /// La función `getValidationCode` recupera el código de verificación
  /// asociado con un correo electrónico determinado de la tabla
  /// serverpod_email_create_request de la base de datos.
  ///
  /// Args:
  ///   session (Session): El parámetro `session` es del tipo `Session` y es
  /// obligatorio. Representa la sesión o conexión actual a la base de datos.
  ///   email (String): El parámetro de correo electrónico es una cadena
  /// obligatoria que representa la
  /// dirección de correo electrónico para la que se recupera el código de
  /// validación.
  ///
  /// retorna un `Future<String>` (el codigo en si).

  Future<String> getValidationCode({
    required Session session,
    required String email,
  }) async {
    try {
      super.session = session;
      final List<List<dynamic>> result = await performOdmOperation(
        (Session session) => session.db.query(
          'SELECT "verificationCode" FROM serverpod_email_create_request WHERE email = \'$email\'',
        ),
      );

      return result.first.first;

      // final result = await session.db.query(
      //     'SELECT "verificationCode" FROM serverpod_email_create_request WHERE email = \'$email\'');
      // if (result.isEmpty) {
      //   return 'Email not found';
      // } else {
      //   return result.first.first;
      // }
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `guardarTokenEnDb` guarda un token y un correo electrónico en
  /// una tabla de base de datos llamada `registro_token_email`.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es un objeto que representa
  /// la sesión actual o la conexión a la base de datos. Es necesario para
  /// ejecutar la consulta de la base de datos.
  ///   token (String): Una cadena que representa el token que debe guardarse
  /// en la base de datos.
  ///   email (String): El parámetro de correo electrónico es una cadena
  /// obligatoria que representa la dirección de correo electrónico asociada
  /// con el token.
  ///

  Future<bool> guardarTokenEnDb({
    required Session session,
    required String token,
    required String email,
    required int tipoInvitacion,
  }) async {
    try {
      final int tipoDeInvitacion = tipoInvitacion;
      await session.db.transaction((Transaction txn) async {
        final List<List<dynamic>> checkearToken = await session.db
            .query('SELECT token FROM invitaciones WHERE email = \'$email\'');

        if (checkearToken.isNotEmpty) {
          await session.db
              .query('DELETE FROM invitaciones WHERE email = \'$email\'');
        }

        await session.db.query(
          'INSERT INTO invitaciones (email, token, tipo_de_invitacion) VALUES (\'$email\', \'$token\', \'$tipoDeInvitacion\')',
        );
      });

      return true;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `traerTokenPorEmail` recupera un token de una tabla de base de
  /// datos en función del correo electrónico proporcionado.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es
  /// obligatorio. Se utiliza para acceder a la base de datos y realizar
  /// consultas.
  ///   email (String): El parámetro de correo electrónico es una cadena
  /// obligatoria que representa la dirección de correo electrónico para la que
  /// queremos recuperar el token.

  Future<String> traerTokenPorEmail({
    required Session session,
    required String email,
  }) async {
    try {
      final List<List<dynamic>> result = await session.db
          .query('SELECT token FROM invitaciones WHERE email = \'$email\'');
      return result.first.first;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `validarCodigoResetPassword` verifica si un código de
  /// verificación dado es válido consultando una tabla de base de datos.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es
  /// obligatorio. Representa la sesión o conexión actual a la base de datos.
  ///   codigo (String): El parámetro "codigo" es una cadena requerida que
  /// representa el código de verificación para restablecer una contraseña.
  ///

  Future<List<dynamic>> validarCodigoResetPassword({
    required Session session,
    required String codigo,
  }) async {
    try {
      final List<List<dynamic>> codigoEnDb = await session.db.query(
        'SELECT * FROM serverpod_email_reset WHERE "verificationCode" = \'$codigo\'',
      );

      return codigoEnDb;
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `eliminarOTPResetPassword` elimina un registro de la tabla
  /// `serverpod_email_reset` según un código de verificación determinado.
  ///
  /// Args:
  ///   sesion (Session): El parámetro "sesion" es de tipo Sesión y es
  /// obligatorio. Representa la sesión actual o la conexión a la base de datos.
  ///   codigo (String): El parámetro "código" es una cadena obligatoria que
  /// representa el código de verificación utilizado para restablecer una
  /// contraseña.
  ///
  Future<List<dynamic>> eliminarOTPResetPassword({
    required Session session,
    required String codigo,
  }) async {
    try {
      return await session.db.query(
        'DELETE FROM serverpod_email_reset WHERE "verificationCode" = \'$codigo\'',
      );
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  /// La función `checkearCodigoOTP` verifica si un código de verificación dado
  /// existe en la base de datos.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es
  /// obligatorio. Representa la sesión o conexión actual a la base de datos.
  ///   codigo (String): El parámetro `codigo` es una cadena requerida que
  /// representa el código OTP (contraseña de un solo uso) que debe verificarse.
  ///
  Future<bool> checkearCodigoOTP({
    required Session session,
    required String codigo,
  }) async {
    try {
      final List<List<dynamic>> codigoEnDb = await session.db.query(
        'SELECT * FROM serverpod_email_reset WHERE "verificationCode" = \'$codigo\'',
      );

      if (codigoEnDb.isEmpty) {
        session.log('codigo $codigo no encontrado en la db');
        return false;
      } else {
        return true;
      }
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
