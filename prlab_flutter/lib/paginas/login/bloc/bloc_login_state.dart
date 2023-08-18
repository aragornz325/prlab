part of 'bloc_login.dart';

/// {@template BlocLoginEvento}
/// Maneja los distintos estados y varibles guardadas en los mismos
/// {@endtemplate}
class BlocLoginEstado extends Equatable {
  /// {@macro BlocLoginEstado}
  const BlocLoginEstado._({
    this.botonHabilitado = false,
    this.estaIniciandoSesion = false,
    this.duracionTimer = 60,
    this.longitudCodigo = 0,
  });

  BlocLoginEstado.desde(
    BlocLoginEstado otro, {
    bool? botonHabilitado,
    bool estaIniciandoSesion = false,
    int? duracionTimer,
    int? longitudCodigo,
  }) : this._(
          botonHabilitado: botonHabilitado ?? otro.botonHabilitado,
          estaIniciandoSesion: estaIniciandoSesion,
          duracionTimer: duracionTimer ?? otro.duracionTimer,
          longitudCodigo: longitudCodigo ?? otro.longitudCodigo,
        );

  /// Bool para habilitar el boton o no dependiendo del contenido
  /// de los textfields
  final bool botonHabilitado;

  /// Bool para diferenciar los estados de cargando
  /// normales a cuando esta iniciando sesión
  final bool estaIniciandoSesion;

  /// Duracion del temporizador
  final int duracionTimer;

  /// Tamaño del codigo (indica cuantos digitos ingreso el usuario)
  final int longitudCodigo;

  /// Getter que verifica si el estado actual es el estado cargando
  /// y apreto el boton de iniciar sesion
  bool get estaCargandoInicioDeSesion =>
      estaIniciandoSesion && this is BlocLoginEstadoCargando;

  @override
  List<Object> get props => [
        botonHabilitado,
        estaIniciandoSesion,
        duracionTimer,
        longitudCodigo,
      ];
}

/// {@template BlocLoginEstadoInicial}
/// Estado inicial de los componentes de la pantalla login
/// {@endtemplate}
class BlocLoginEstadoInicial extends BlocLoginEstado {
  /// {@macro BlocLoginEstadoInicial}
  const BlocLoginEstadoInicial() : super._();
}

/// {@template BlocLoginEstadoCargando}
/// Estado de cargando de los componentes de la pantalla login
/// {@endtemplate}
class BlocLoginEstadoCargando extends BlocLoginEstado {
  /// {@macro BlocLoginEstadoCargando}
  BlocLoginEstadoCargando.desde(
    super.otro, {
    super.estaIniciandoSesion,
  }) : super.desde();
}

/// {@template BlocLoginEstadoExitosoInicioSesion}
/// Estado exitoso emitido al iniciar sesión
/// {@endtemplate}
class BlocLoginEstadoExitosoInicioSesion extends BlocLoginEstado {
  /// {@macro BlocLoginEstadoExitosoInicioSesion}
  BlocLoginEstadoExitosoInicioSesion.desde(
    super.otro, {
    super.botonHabilitado,
    super.longitudCodigo,
  }) : super.desde();
}

/// {@template BlocLoginEstadoExitosoAlValidarOTP}
/// Estado exitoso emitido al validar el codigo de verificacion
/// {@endtemplate}
class BlocLoginEstadoExitosoAlValidarOTP extends BlocLoginEstado {
  /// {@macro BlocLoginEstadoExitosoAlValidarOTP}
  BlocLoginEstadoExitosoAlValidarOTP.desde(super.otro) : super.desde();
}

/// {@template BlocLoginEstadoError}
/// Estado de error de los componentes de la pantalla login
/// {@endtemplate}
class BlocLoginEstadoError extends BlocLoginEstado {
  /// {@macro BlocLoginEstadoError}
  BlocLoginEstadoError.desde(
    super.otro, {
    required this.mensajeDeError,
  }) : super.desde();

  /// Mensaje de error
  final MensajesDeErrorDelLogin mensajeDeError;
}

/// temporizador cuando se inicializa y se inicia. Toma un entero `duración`
///  como parámetro que
/// representa la duración total del temporizador.
class BLocLoginEstadoIniciarCronometro extends BlocLoginEstado {
  /// {@macro BLocLoginEstadoIniciarCronometro}
  BLocLoginEstadoIniciarCronometro.desde(
    super.otro, {
    super.duracionTimer,
  }) : super.desde();
}

//  Toma un entero `duración` como parámetro que
/// representa el tiempo restante del temporizador.
class BlocLoginEstadoCronometroCorriendo extends BlocLoginEstado {
  /// {@macro BlocLoginEstadoCronometroCorriendo}
  BlocLoginEstadoCronometroCorriendo.desde(
    super.otro, {
    super.duracionTimer,
  }) : super.desde();
}

//  No toma ningún parámetro ya que
/// simplemente indica que el temporizador ha terminado la cuenta regresiva.
class BlocLoginEstadoCronometroCompletado extends BlocLoginEstado {
  /// {@macro BlocLoginEstadoCronometroCompletado}
  BlocLoginEstadoCronometroCompletado.desde(
    super.otro, {
    super.duracionTimer,
  }) : super.desde();
}

/// Tipos de errores de login
enum MensajesDeErrorDelLogin {
  userNotFound,
  invalidCredentials,
  userCreationDenied,
  internalError,
  tooManyFailedAttempts,
  unknown;
}
