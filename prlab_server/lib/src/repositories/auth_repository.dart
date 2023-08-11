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
}
