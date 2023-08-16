import 'package:serverpod/server.dart';

/// La clase AuthRepository es responsable de manejar las operaciones contra la DB
///  relacionadas con la autenticación.
class AuthRepository {
  /// La función `getValidationCode` recupera el código de verificación asociado con un correo
  /// electrónico determinado de la tabla serverpod_email_create_request de la base de datos.
  ///
  /// Args:
  ///   session (Session): El parámetro `session` es del tipo `Session` y es obligatorio. Representa la
  /// sesión o conexión actual a la base de datos.
  ///   email (String): El parámetro de correo electrónico es una cadena obligatoria que representa la
  /// dirección de correo electrónico para la que se recupera el código de validación.
  ///
  /// retorna un `Future<String>` (el codigo en si).

  Future<String> getValidationCode({
    required Session session,
    required String email,
  }) async {
    try {
      final result = await session.db.query(
          'SELECT "verificationCode" FROM serverpod_email_create_request WHERE email = \'$email\'');
      if (result.isEmpty) {
        return 'Email not found';
      } else {
        return result.first.first;
      }
    } catch (e) {
      rethrow;
    }
  }

  /// La función `guardarTokenEnDb` guarda un token y un correo electrónico en una tabla de base de datos
  /// llamada `registro_token_email`.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es un objeto que representa la sesión actual o la
  /// conexión a la base de datos. Es necesario para ejecutar la consulta de la base de datos.
  ///   token (String): Una cadena que representa el token que debe guardarse en la base de datos.
  ///   email (String): El parámetro de correo electrónico es una cadena obligatoria que representa la
  /// dirección de correo electrónico asociada con el token.
  ///

  Future<bool> guardarTokenEnDb({
    required Session session,
    required String token,
    required String email,
    required int tipoInvitacion,
  }) async {
    try {
      final tipo_de_invitacion = tipoInvitacion;
      await session.db.transaction((txn) async {
        final checkearToken = await session.db
            .query('SELECT token FROM invitaciones WHERE email = \'$email\'');

        if (checkearToken.isNotEmpty) {
          await session.db
              .query('DELETE FROM invitaciones WHERE email = \'$email\'');
        }

        await session.db.query(
            'INSERT INTO invitaciones (email, token, tipo_de_invitacion) VALUES (\'$email\', \'$token\', \'$tipo_de_invitacion\')');
      });

      return true;
    } catch (e) {
      rethrow;
    }
  }

  /// La función `traerTokenPorEmail` recupera un token de una tabla de base de datos en función del
  /// correo electrónico proporcionado.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. Se utiliza para
  /// acceder a la base de datos y realizar consultas.
  ///   email (String): El parámetro de correo electrónico es una cadena obligatoria que representa la
  /// dirección de correo electrónico para la que queremos recuperar el token.

  Future<String> traerTokenPorEmail({
    required Session session,
    required String email,
  }) async {
    try {
      final result = await session.db
          .query('SELECT token FROM invitaciones WHERE email = \'$email\'');
      if (result.isEmpty) {
        return 'Email not found';
      } else {
        return result.first.first;
      }
    } catch (e) {
      rethrow;
    }
  }

  /// La función `validarCodigoResetPassword` verifica si un código de verificación dado es válido
  /// consultando una tabla de base de datos.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y es obligatorio. Representa la
  /// sesión o conexión actual a la base de datos.
  ///   codigo (String): El parámetro "codigo" es una cadena requerida que representa el código de
  /// verificación para restablecer una contraseña.
  ///

  Future<bool> validarCodigoResetPassword({
    required Session session,
    required String codigo,
  }) async {
    try {
      final codigoEnDb = await session.db.query(
        'SELECT * FROM serverpod_email_reset WHERE "verificationCode" = \'$codigo\'',
      );
      if (codigoEnDb.isEmpty) {
        throw Exception(
          'Codigo no valido',
        );
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
