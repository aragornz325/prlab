import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_flutter/prlab_configuracion/base.dart';
import 'package:prlab_flutter/utilidades/email_auth_controller_custom_prlab.dart';
import 'package:prlab_flutter/utilidades/funciones/validators.dart';
import 'package:serverpod_auth_client/module.dart';

part 'bloc_login_event.dart';
part 'bloc_login_state.dart';

/// Bloc que maneja los estados o logica de la pagina de login
class BlocLogin extends Bloc<BlocLoginEvento, BlocLoginEstado> {
  BlocLogin({
    required this.emailAuthControllerCustomPRLab,
  }) : super(const BlocLoginEstadoInicial()) {
    on<BlocLoginEventoIniciarSesion>(_iniciarSesion);
    on<BlocLoginEventoHabilitarBoton>(_habilitarBoton);

    ///manejo del temporizador y cronometro
    on<BLocLoginEventoEmpezarTemporizador>(_empezarCronometro);
    on<BlocLoginEventoPausarTemporizador>(_pausarCronometro);
    on<BlocLoginEventoTemporizadorResetearTemporizador>(_resetearCronometro);
    on<BlocLoginEventoTiempoEjecucion>(_corriendoCronometro);
    on<BlocLoginEventoTiempoCompletado>(_cronometroCompletado);
  }
  static const int _duracion = 60;

  late Timer _time;
  int _tiempoCorriendoDuracion = _duracion;

  /// Repositorio editado para Serverpod
  final EmailAuthControllerCustomPRLab emailAuthControllerCustomPRLab;

  /// Funcion que inicia sesion donde llamamos al repo `emailAuth` que es de
  /// server pod y la funcion signIn y pasamos nuestros events
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

      emit(BlocLoginEstadoExitoso.desde(state));
    } catch (e, st) {
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

  /// La función `_habilitarBoton` verifica si el correo electrónico es válido
  ///  y la longitud de la contraseña es mayor a 7, y emite un estado exitoso
  ///  con el botón habilitado si se cumplen lascondiciones.
  Future<void> _habilitarBoton(
    BlocLoginEventoHabilitarBoton event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    try {
      if (Validators.emailRegExp.hasMatch(event.email) &&
          event.password.length >
              PRLabConfiguracion.minimoDeCaracteresContrasenia) {
        emit(
          BlocLoginEstadoExitoso.desde(state, botonHabilitado: true),
        );
      } else {
        emit(
          BlocLoginEstadoExitoso.desde(state),
        );
      }
    } catch (e, st) {
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

  ///funcion que empieza a correr el cronometro
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

  ///funcion que pausa el cronometro
  FutureOr<void> _pausarCronometro(
    BlocLoginEventoPausarTemporizador event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    _time.cancel();
    emit(
      BlocLoginEstadoCronometroPausado.desde(
        state,
        duracionTimer: _tiempoCorriendoDuracion,
      ),
    );
  }

  ///funcion para resetear el cronometro o que vuelva a 60 seg
  FutureOr<void> _resetearCronometro(
    BlocLoginEventoTemporizadorResetearTemporizador event,
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

  ///funcion que corre el cronometro o muestra que el cronometro esta corriendo
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

  ///funcion que termina el cronometro o muestra que el cronometro fue
  ///completado
  FutureOr<void> _cronometroCompletado(
    BlocLoginEventoTiempoCompletado event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    // TODO(Gon): por ahora no hace nada si termino pero agregarle
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
}
