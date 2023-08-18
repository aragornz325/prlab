part of 'bloc_recuperar_password.dart';

/// {@template BlocRecuperarPasswordEstado}
/// Estado que maneja el la información para el recupero de contraseña.
/// {@endtemplate}
@immutable
sealed class BlocRecuperarPasswordEstado {
  /// {@macro BlocRecuperarPasswordEstado}
  const BlocRecuperarPasswordEstado._({
    this.password = '',
    this.passwordRepetida = '',
  });

  BlocRecuperarPasswordEstado.desde(
    BlocRecuperarPasswordEstado otro, {
    String? password,
    String? passwordRepetida,
  }) : this._(
          password: password ?? otro.password,
          passwordRepetida: passwordRepetida ?? otro.passwordRepetida,
        );

  /// Contraseña que va suplantar la contraseña previa del usuario.
  final String password;

  /// Campo de texto para validar que efectivamente la contraseña se
  /// haya escrito 2 veces, esto minimiza errores de tipeo por
  /// parte del usuario.
  final String passwordRepetida;

  /// Si los campos de texto de contraseñas fueron completados.
  bool get estanCompletasLasContrasenias =>
      password.isNotEmpty && passwordRepetida.isNotEmpty;

  // Si está o no en estado de carga.
  bool get esEstadoCargando => this is BlocRecuperarPasswordEstadoCargando;

  // Si está o no en estado fallido.
  bool get esEstadoFallido => this is BlocRecuperarPasswordEstadoFallido;

  // Si está o no en estado exitoso.
  bool get esEstadoExitoso => this is BlocRecuperarPasswordEstadoExitoso;
}

/// {@template BlocRecuperarPasswordEstadoInicial}
/// Estado inicial del [BlocRecuperarPassword].
/// {@endtemplate}
class BlocRecuperarPasswordEstadoInicial extends BlocRecuperarPasswordEstado {
  /// {@macro BlocRecuperarPasswordEstadoInicial}
  const BlocRecuperarPasswordEstadoInicial() : super._();
}

/// {@template BlocRecuperarPasswordEstadoCargando}
/// Estado cargando del [BlocRecuperarPassword].
/// {@endtemplate}
class BlocRecuperarPasswordEstadoCargando extends BlocRecuperarPasswordEstado {
  /// {@macro BlocRecuperarPasswordEstadoCargando}
  BlocRecuperarPasswordEstadoCargando.desde(super.otro) : super.desde();
}

/// {@template BlocRecuperarPasswordEstadoRecolectarData}
/// Estado de recolar data del [BlocRecuperarPassword].
/// Sirve para actualizar los datos de los campos de contraseña
/// dentro del estado [BlocRecuperarPasswordEstado].
/// {@endtemplate}
class BlocRecuperarPasswordEstadoRecolectarData
    extends BlocRecuperarPasswordEstado {
  /// {@macro BlocRecuperarPasswordEstadoRecolectarData}
  BlocRecuperarPasswordEstadoRecolectarData.desde(
    super.otro, {
    super.password,
    super.passwordRepetida,
  }) : super.desde();
}

/// {@template BlocRecuperarPasswordEstadoExitoso}
/// Estado de exito del [BlocRecuperarPassword].
/// {@endtemplate}
class BlocRecuperarPasswordEstadoExitoso extends BlocRecuperarPasswordEstado {
  /// {@macro BlocRecuperarPasswordEstadoExitoso}
  BlocRecuperarPasswordEstadoExitoso.desde(super.otro) : super.desde();
}

/// {@template BlocRecuperarPasswordEstadoFallido}
/// Estado de fallo del [BlocRecuperarPassword].
/// {@endtemplate}
class BlocRecuperarPasswordEstadoFallido extends BlocRecuperarPasswordEstado {
  /// {@macro BlocRecuperarPasswordEstadoFallido}
  BlocRecuperarPasswordEstadoFallido.desde(super.otro) : super.desde();
}
