part of 'bloc_login.dart';

/// {@template BlocLoginEvento}
/// Padre de los eventos de la pagina login, maneja el inicio de sesion
/// y el envio del codigo de verificacion
/// {@endtemplate}
abstract class BlocLoginEvento extends Equatable {
  /// {@macro BlocLoginEvento}
  const BlocLoginEvento();

  @override
  List<Object> get props => [];
}

/// {@template BlocLoginEventoIniciarSesion}
/// Maneja la informacion del usuario para poder iniciar sesión
/// {@endtemplate}
class BlocLoginEventoIniciarSesion extends BlocLoginEvento {
  /// {@macro BlocLoginEventoIniciarSesion}
  const BlocLoginEventoIniciarSesion({
    required this.password,
    required this.email,
  });

  /// Email del usuario
  final String email;

  /// Contraseña del usuario
  final String password;
}

/// {@template BlocLoginEventoHabilitarBotonLogin}
/// Hablita el boton de iniciar sesión segun si se cumplen las validaciones
/// {@endtemplate}
class BlocLoginEventoHabilitarBotonLogin extends BlocLoginEvento {
  /// {@macro BlocLoginEventoHabilitarBotonLogin}
  const BlocLoginEventoHabilitarBotonLogin({
    required this.password,
    required this.email,
  });

  /// Email del usuario
  final String email;

  /// Contraseña del usuario
  final String password;
}

/// {@template BlocLoginEventoHabilitarBotonOlvidastePassword}
/// Hablita el boton de iniciar sesión segun si se cumplen las validaciones
/// {@endtemplate}
class BlocLoginEventoHabilitarBotonOlvidePassword extends BlocLoginEvento {
  /// {@macro BlocLoginEventoHabilitarBotonOlvidastePassword}
  const BlocLoginEventoHabilitarBotonOlvidePassword({
    required this.email,
  });

  /// Email del usuario
  final String email;
}

/// {@template BlocLoginEventoAgregarCodigoAlEstado}
/// Cambia el tamaño del codigo para poder usar su longitud
/// {@endtemplate}
class BlocLoginEventoAgregarCodigoAlEstado extends BlocLoginEvento {
  /// {@macro BlocLoginEventoAgregarCodigoAlEstado}
  const BlocLoginEventoAgregarCodigoAlEstado({
    required this.codigo,
  });

  /// tamaño del codigo (indica cuantos digitos ingreso el usuario)
  final String codigo;
}

/// {@template BlocLoginEventoEnviarCodigoAlMailDelUsuario}
/// Envia un correo electronico con el codigo al usuario
/// {@endtemplate}
class BlocLoginEventoEnviarCodigoAlUsuario extends BlocLoginEvento {
  /// {@macro BlocLoginEventoEnviarCodigoAlMailDelUsuario}
  const BlocLoginEventoEnviarCodigoAlUsuario({
    required this.email,
  });

  /// Email del usuario
  final String email;
}

/// {@template BlocLoginEventoValidarCodigo}
/// Valida el codigo ingresado por el usuario para poder seguir con el flujo
/// de recuperar contraseña
/// {@endtemplate}
class BlocLoginEventoValidarCodigo extends BlocLoginEvento {
  /// {@macro BlocLoginEventoValidarCodigo}
  const BlocLoginEventoValidarCodigo();
}
