part of 'bloc_login.dart';

/// {@template BlocLoginEvento}
/// Maneja los distintos estados y varibles guardadas en los mismos
/// {@endtemplate}
class BlocLoginEstado extends Equatable {
  /// {@macro BlocLoginEstado}
  const BlocLoginEstado._({
    this.botonLoginHabilitado = false,
    this.botonOlvidePasswordHabilitado = false,
    this.estaIniciandoSesion = false,
    this.duracionTimer = 60,
    this.codigo = '',
    this.email = '',
  });

  BlocLoginEstado.desde(
    BlocLoginEstado otro, {
    bool? botonLoginHabilitado,
    bool? botonOlvidePasswordHabilitado,
    bool estaIniciandoSesion = false,
    String? email,
    int? duracionTimer,
    String? codigo,
  }) : this._(
          botonLoginHabilitado:
              botonLoginHabilitado ?? otro.botonLoginHabilitado,
          botonOlvidePasswordHabilitado: botonOlvidePasswordHabilitado ??
              otro.botonOlvidePasswordHabilitado,
          estaIniciandoSesion: estaIniciandoSesion,
          duracionTimer: duracionTimer ?? otro.duracionTimer,
          codigo: codigo ?? otro.codigo,
          email: email ?? otro.email,
        );

  /// Bool para habilitar el boton o no dependiendo del contenido
  /// de los textfields
  final bool botonLoginHabilitado;

  /// Bool para habilitar el boton 'Olvidaste tu contraseña' o no dependiendo
  /// del contenido del textfield
  final bool botonOlvidePasswordHabilitado;

  /// Bool para diferenciar los estados de cargando
  /// normales a cuando esta iniciando sesión
  final bool estaIniciandoSesion;

  /// Duracion del temporizador
  final int duracionTimer;

  /// codigo que te llega del email
  final String codigo;

  /// email del usuario a guardar
  final String email;

  /// Getter que verifica si el estado actual es el estado cargando
  /// y apreto el boton de iniciar sesion
  bool get estaCargandoInicioDeSesion =>
      estaIniciandoSesion && this is BlocLoginEstadoCargando;

  bool get estadoErroneo =>
      this is BlocLoginEstadoError &&
      (this as BlocLoginEstadoError).mensajeDeError ==
          MensajesDeErrorDelLogin.unknown;

  @override
  List<Object> get props => [
        email,
        botonLoginHabilitado,
        botonOlvidePasswordHabilitado,
        estaIniciandoSesion,
        duracionTimer,
        codigo,
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

/// {@template BlocLoginEstadoExitosoGeneral}
// TODO(Gon): Verificar esta docu y naming
/// Existe este estado para separarlo de los demas estados de exito,
/// por ejemplo iniciar sesion o recuperar contraseña
/// {@endtemplate}
class BlocLoginEstadoExitosoGeneral extends BlocLoginEstado {
  /// {@macro BlocLoginEstadoExitosoGeneral}
  BlocLoginEstadoExitosoGeneral.desde(
    super.otro, {
    super.botonLoginHabilitado,
    super.botonOlvidePasswordHabilitado,
    super.codigo,
    super.email,
  }) : super.desde();
}

/// {@template BlocLoginEstadoExitosoInicioSesion}
/// Estado exitoso emitido al iniciar sesión
/// {@endtemplate}
class BlocLoginEstadoExitosoIniciarSesion extends BlocLoginEstado {
  /// {@macro BlocLoginEstadoExitosoInicioSesion}
  BlocLoginEstadoExitosoIniciarSesion.desde(super.otro) : super.desde();
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

/// Tipos de errores de login a mostrar
enum MensajesDeErrorDelLogin {
  userNotFound,
  invalidCredentials,
  userCreationDenied,
  internalError,
  tooManyFailedAttempts,
  unknown;
}
