import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_flutter/prlab_configuracion/base.dart';
import 'package:prlab_flutter/utilidades/email_auth_controller_custom_prlab.dart';
import 'package:prlab_flutter/utilidades/funciones/validators.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';
import 'package:serverpod_auth_client/module.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

part 'bloc_login_event.dart';
part 'bloc_login_state.dart';

/// {@template BlocLoginEstadoExitosoAlValidarOTP}
/// Bloc que maneja los estados y logica de la pagina de login
/// {@endtemplate}
class BlocLogin extends Bloc<BlocLoginEvento, BlocLoginEstado> {
  /// {@macro BlocLogin}
  BlocLogin({
    required this.emailAuthControllerCustomPRLab,
    required this.emailAuth,
  }) : super(const BlocLoginEstadoInicial()) {
    on<BlocLoginEventoIniciarSesion>(_iniciarSesion);
    on<BlocLoginEventoHabilitarBotonLogin>(_habilitarBotonLogin);
    on<BlocLoginEventoEnviarCodigoAlUsuario>(
      _enviarCodigoAlUsuario,
    );
    on<BlocLoginEventoCambiarLongitudCodigo>(_cambiarLongitudCodigo);
    on<BlocLoginEventoValidarCodigo>(_validarCodigo);

    //!!
    // TODO(anyone): EXTRAER ESTO A UN BLOC SEPARADO PARA SACAR LA LOGICA DEL TIMER
    //!!
    /// Manejo del temporizador y cronometro
    on<BLocLoginEventoEmpezarTemporizador>(_empezarCronometro);
    on<BlocLoginEventoResetearTemporizador>(_resetearCronometro);
    on<BlocLoginEventoTiempoEjecucion>(_corriendoCronometro);
    on<BlocLoginEventoTiempoCompletado>(_cronometroCompletado);
  }
  static const int _duracion = 60;

  late Timer _time;
  int _tiempoCorriendoDuracion = _duracion;

  /// Inicia sesión con el email y contraseña emite un loading para que
  /// aparezca un circularprogress en el boton de login
  Future<void> _iniciarSesion(
    BlocLoginEventoIniciarSesion event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    emit(
      BlocLoginEstadoCargando.desde(state, estaIniciandoSesion: true),
    );
    try {
      final respuesta = await emailAuthControllerCustomPRLab.iniciarSesion(
        event.email,
        event.password,
      );

      final userInfo = respuesta.userInfo;
      if (userInfo == null) {
        return emit(
          // TODO(Gon): Preguntar al back que devuelve para handlear los errores
          BlocLoginEstadoError.desde(
            state,
            mensajeDeError: MensajesDeErrorDelLogin.userNotFound,
          ),
        );
      }

      emit(BlocLoginEstadoExitosoInicioSesion.desde(state));
    } catch (e, st) {
      // TODO(Gon): Preguntar al back que devuelve para handlear los errores
      if (kDebugMode) {
        debugger();
        print(st);
      }
      MensajesDeErrorDelLogin loginErrorMessages;

      switch (e) {
        case AuthenticationFailReason.invalidCredentials:
          loginErrorMessages = MensajesDeErrorDelLogin.invalidCredentials;

        case AuthenticationFailReason.internalError:
          loginErrorMessages = MensajesDeErrorDelLogin.internalError;

        case AuthenticationFailReason.tooManyFailedAttempts:
          loginErrorMessages = MensajesDeErrorDelLogin.tooManyFailedAttempts;

        case AuthenticationFailReason.userCreationDenied:
          loginErrorMessages = MensajesDeErrorDelLogin.userCreationDenied;

        default:
          loginErrorMessages = MensajesDeErrorDelLogin.unknown;
      }

      return emit(
        BlocLoginEstadoError.desde(
          state,
          mensajeDeError: loginErrorMessages,
        ),
      );
    }
  }

  /// Envia el codigo de recuperacion de contraseña al mail del usuario
  FutureOr<void> _enviarCodigoAlUsuario(
    BlocLoginEventoEnviarCodigoAlUsuario event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    emit(BlocLoginEstadoCargando.desde(state));
    try {
      final response = await emailAuth.initiatePasswordReset(event.email);

      if (response) {
        emit(
          BlocLoginEstadoExitosoAlValidarOTP.desde(state),
        );
      } else {
        // TODO(Gon): Preguntar al back que devuelve para handlear los errores
        throw UnimplementedError(
          'Error al mandar el codigo de cambiar contraseña al mail del usuario',
        );
      }
    } catch (e, st) {
      // TODO(Gon): Preguntar al back que devuelve para handlear los errores
      emit(
        BlocLoginEstadoError.desde(
          state,
          mensajeDeError: MensajesDeErrorDelLogin.invalidCredentials,
        ),
      );
      if (kDebugMode) {
        debugger();
        throw UnimplementedError('Implementa un error para esto: $e $st');
      }
    }
  }

  /// Valida el codigo ingresado por el usuario para poder seguir con el flujo
  FutureOr<void> _validarCodigo(
    BlocLoginEventoValidarCodigo event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    emit(BlocLoginEstadoCargando.desde(state));
    try {
      final respuesta =
          await client.auth.validarCodigoResetPassword(event.codigo);
      if (respuesta) {
        emit(
          BlocLoginEstadoExitosoAlValidarOTP.desde(state),
        );
      } else {
        // TODO(Gon): Preguntar al back que devuelve para handlear los errores
        throw UnimplementedError(
          'Error al mandar el codigo de cambiar contraseña al back',
        );
      }
    } catch (e, st) {
      // TODO(Gon): Preguntar al back que devuelve para handlear los errores
      emit(
        BlocLoginEstadoError.desde(
          state,
          mensajeDeError: MensajesDeErrorDelLogin.internalError,
        ),
      );
      if (kDebugMode) {
        debugger();
        throw UnimplementedError('Error al restablecer la contraseña: $e $st');
      }
    }
  }

  /// Verifica si el correo electrónico y contraseña son válidos, y emite
  /// un estado exitoso para habilitar el botón.
  void _habilitarBotonLogin(
    BlocLoginEventoHabilitarBotonLogin event,
    Emitter<BlocLoginEstado> emit,
  ) {
    if (Validators.emailRegExp.hasMatch(event.email) &&
        event.password.length >
            PRLabConfiguracion.minimoDeCaracteresContrasenia) {
      emit(
        BlocLoginEstadoExitosoInicioSesion.desde(
          state,
          botonHabilitado: true,
        ),
      );
    } else {
      emit(
        BlocLoginEstadoExitosoInicioSesion.desde(state),
      );
    }
  }

  /// Cambia el valor de la variable que es utilizadapara saber si ingreso
  /// el codigo completo
  void _cambiarLongitudCodigo(
    BlocLoginEventoCambiarLongitudCodigo event,
    Emitter<BlocLoginEstado> emit,
  ) {
    emit(
      BlocLoginEstadoExitosoInicioSesion.desde(
        state,
        longitudCodigo: event.longitudCodigo,
      ),
    );
  }

  /// Funcion que empieza a correr el cronometro
  FutureOr<void> _empezarCronometro(
    BLocLoginEventoEmpezarTemporizador event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    _tiempoCorriendoDuracion = _duracion;
    emit(
      BlocLoginEstadoCronometroCorriendo.desde(
        state,
        duracionTimer: _tiempoCorriendoDuracion,
      ),
    );

    final timeStreamController = StreamController<int>();

    _time = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_tiempoCorriendoDuracion > 0) {
        _tiempoCorriendoDuracion--;
        timeStreamController.sink.add(_tiempoCorriendoDuracion);
      } else {
        timeStreamController.close();
        add(BlocLoginEventoTiempoCompletado());
      }
    });

    await for (final int duracion in timeStreamController.stream) {
      emit(
        BlocLoginEstadoCronometroCorriendo.desde(
          state,
          duracionTimer: duracion,
        ),
      );
    }
  }

  /// Funcion para resetear el cronometro o que vuelva a 60 seg
  FutureOr<void> _resetearCronometro(
    BlocLoginEventoResetearTemporizador event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    _time.cancel();
    emit(
      BLocLoginEstadoIniciarCronometro.desde(
        state,
        duracionTimer: _duracion,
      ),
    );
  }

  /// Funcion que corre el cronometro o muestra que el cronometro esta corriendo
  FutureOr<void> _corriendoCronometro(
    BlocLoginEventoTiempoEjecucion event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    emit(
      BlocLoginEstadoCronometroCorriendo.desde(
        state,
        duracionTimer: _tiempoCorriendoDuracion,
      ),
    );

    final timerStreamController = StreamController<int>();

    _time = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_tiempoCorriendoDuracion > 0) {
        _tiempoCorriendoDuracion--;
        timerStreamController.sink.add(_tiempoCorriendoDuracion);
      } else {
        timerStreamController.close();
        _time.cancel();
        add(BlocLoginEventoTiempoCompletado());
      }
    });

    await for (final int duracion in timerStreamController.stream) {
      emit(
        BlocLoginEstadoCronometroCorriendo.desde(
          state,
          duracionTimer: duracion,
        ),
      );
    }
  }

  /// Funcion que termina el cronometro o muestra que el cronometro fue
  /// completado
  FutureOr<void> _cronometroCompletado(
    BlocLoginEventoTiempoCompletado event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    // Por ahora no hace nada si termino pero agregarle
    // que vuelva o que le avise que se acabo el tiempo para que
    // reenviar el codigo de verificacion
    if (_time.isActive) {
      _time.cancel();
    }
    emit(
      BlocLoginEstadoCronometroCompletado.desde(
        state,
        duracionTimer: state.duracionTimer,
      ),
    );
  }

  ///cancela el cronometro y lo pausa para que no siga
  @override
  Future<void> close() {
    _time.cancel();
    return super.close();
  }

  /// Repo de los llamados a server pod
  final EmailAuthController emailAuth;

  /// Repositorio editado para Serverpod
  final EmailAuthControllerCustomPRLab emailAuthControllerCustomPRLab;
}
