part of 'bloc_login.dart';

class BlocLoginEstado extends Equatable {
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

/// Estado inicial de los componentes de la pantalla login
class BlocLoginEstadoInicial extends BlocLoginEstado {
  const BlocLoginEstadoInicial() : super._();
}

/// Estado de cargando de los componentes de la pantalla login
class BlocLoginEstadoCargando extends BlocLoginEstado {
  BlocLoginEstadoCargando.desde(
    super.otro, {
    super.estaIniciandoSesion,
  }) : super.desde();
}

/// Estado exitoso de los componentes de la pantalla login
class BlocLoginEstadoExitosoInicioSesion extends BlocLoginEstado {
  BlocLoginEstadoExitosoInicioSesion.desde(
    super.otro, {
    super.botonHabilitado,
    super.longitudCodigo,
  }) : super.desde();
}

/// Estado exitoso de los componentes de la pantalla login
class BlocLoginEstadoExitosoAlValidarOTP extends BlocLoginEstado {
  BlocLoginEstadoExitosoAlValidarOTP.desde(super.otro) : super.desde();
}

/// Estado de error de los componentes de la pantalla login (se puede emitir
/// cuando hay un error la iniciar sesion)
class BlocLoginEstadoError extends BlocLoginEstado {
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
  BLocLoginEstadoIniciarCronometro.desde(
    super.otro, {
    super.duracionTimer,
  }) : super.desde();
}

//  Toma un entero `duración` como parámetro que
/// representa el tiempo restante del temporizador.
class BlocLoginEstadoCronometroCorriendo extends BlocLoginEstado {
  BlocLoginEstadoCronometroCorriendo.desde(
    super.otro, {
    super.duracionTimer,
  }) : super.desde();
}

//  No toma ningún parámetro ya que
/// simplemente indica que el temporizador ha terminado la cuenta regresiva.
class BlocLoginEstadoCronometroCompletado extends BlocLoginEstado {
  BlocLoginEstadoCronometroCompletado.desde(
    super.otro, {
    super.duracionTimer,
  }) : super.desde();
}

/// emum de los tipos de errores de login a mostrar
enum MensajesDeErrorDelLogin {
  userNotFound,
  invalidCredentials,
  userCreationDenied,
  internalError,
  tooManyFailedAttempts,
  unknown;
}
