part of 'bloc_recuperar_password.dart';

/// {@template BlocRecuperarPasswordEvento}
/// Evento que maneja el la información para el recupero de contraseña.
/// {@endtemplate}
@immutable
sealed class BlocRecuperarPasswordEvento {}

/// {@template BlocRecuperarPasswordEventoRecolectarData}
/// Evento que recolecta los valores de las contraseñas de los campos
/// de texto y las actualiza dentro del estado.
/// {@endtemplate}
class BlocRecuperarPasswordEventoRecolectarData
    extends BlocRecuperarPasswordEvento {
  /// {@macro BlocRecuperarPasswordEventoRecolectarData}
  BlocRecuperarPasswordEventoRecolectarData({
    this.password,
    this.passwordRepetida,
  });

  // TODO(anyone): Documentar
  final String? password;

  final String? passwordRepetida;
}

/// {@template BlocRecuperarPasswordEventoCambiarPassword}
/// Evento que recolecta los valores de las contraseñas de los campos
/// de texto y las actualiza dentro del estado.
/// {@endtemplate}
class BlocRecuperarPasswordEventoCambiarPassword
    extends BlocRecuperarPasswordEvento {
  /// {@macro BlocRecuperarPasswordEventoCambiarPassword}
  BlocRecuperarPasswordEventoCambiarPassword();
}
