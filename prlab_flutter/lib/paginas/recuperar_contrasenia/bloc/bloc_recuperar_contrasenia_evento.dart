part of 'bloc_recuperar_contrasenia.dart';

/// {@template bloc_recuperar_contrasenia_evento}
/// Evento que maneja el la información para el recupero de contraseña.
/// {@endtemplate}
@immutable
sealed class BlocRecuperarContraseniaEvento {}

/// {@template bloc_recuperar_contrasenia_evento_recolectar_data}
/// Evento que recolecta los valores de las contraseñas de los campos
/// de texto y las actualiza dentro del estado.
/// {@endtemplate}
class BlocRecuperarContraseniaEventoRecolectarData
    extends BlocRecuperarContraseniaEvento {
  /// {@macro bloc_recuperar_contrasenia_evento_recolectar_data}
  BlocRecuperarContraseniaEventoRecolectarData({
    this.contrasenia,
    this.contraseniaRepetida,
  });

  final String? contrasenia;

  final String? contraseniaRepetida;
}

/// {@template bloc_recuperar_contrasenia_evento_cambiar_contrasenia}
/// Evento que recolecta los valores de las contraseñas de los campos
/// de texto y las actualiza dentro del estado.
/// {@endtemplate}
class BlocRecuperarContraseniaEventoCambiarContrasenia
    extends BlocRecuperarContraseniaEvento {
  /// {@macro bloc_recuperar_contrasenia_evento_cambiar_contrasenia}
  BlocRecuperarContraseniaEventoCambiarContrasenia();
}
