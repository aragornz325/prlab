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

/// {@template BlocLoginEventoCambiarLongitudCodigo}
/// Cambia el tamaño del codigo para poder usar su longitud
/// {@endtemplate}
class BlocLoginEventoCambiarLongitudCodigo extends BlocLoginEvento {
  /// {@macro BlocLoginEventoCambiarLongitudCodigo}
  const BlocLoginEventoCambiarLongitudCodigo({
    required this.longitudCodigo,
  });

  /// tamaño del codigo (indica cuantos digitos ingreso el usuario)
  final int longitudCodigo;
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
  const BlocLoginEventoValidarCodigo({
    required this.codigo,
  });

  /// Codigo ingresado por el usuario
  final String codigo;
}

/// {@template BLocLoginEventoEmpezarTemporizador}
/// Evento para que empiece el temporizador del cronometro
/// {@endtemplate}
class BLocLoginEventoEmpezarTemporizador extends BlocLoginEvento {}

/// {@template BlocLoginEventoPausarTemporizador}
/// Evento para pausar el tiempo del cronometro
/// {@endtemplate}
class BlocLoginEventoPausarTemporizador extends BlocLoginEvento {}

/// {@template BlocLoginEventoResetearTemporizador}
/// Evento para resetear el tiempo del cronometro
/// {@endtemplate}
class BlocLoginEventoResetearTemporizador extends BlocLoginEvento {}

/// {@template BlocLoginEventoTiempoEjecucion}
/// Evento para estar corriendo o ejecutando la duracion del cronometro
/// {@endtemplate}
class BlocLoginEventoTiempoEjecucion extends BlocLoginEvento {
  /// {@macro BlocLoginEventoTiempoEjecucion}
  const BlocLoginEventoTiempoEjecucion(this.duracionTimer);

  /// Duracion del timer
  final int duracionTimer;
}

/// {@template BlocLoginEventoTiempoCompletado}
/// Evento que el cronometro ya a finalizado o completado
/// {@endtemplate}
class BlocLoginEventoTiempoCompletado extends BlocLoginEvento {}
