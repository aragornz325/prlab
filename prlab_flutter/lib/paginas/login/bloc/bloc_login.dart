import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_flutter/prlab_configuracion/base.dart';
import 'package:prlab_flutter/utilidades/funciones/expresion_regular.dart';
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
    required this.emailAuth,
  }) : super(const BlocLoginEstadoInicial()) {
    on<BlocLoginEventoIniciarSesion>(_iniciarSesion);
    on<BlocLoginEventoHabilitarBotonLogin>(_habilitarBotonLogin);
    on<BlocLoginEventoEnviarCodigoAlUsuario>(
      _enviarCodigoAlUsuario,
    );
    on<BlocLoginEventoAgregarCodigoAlEstado>(_cambiarLongitudCodigo);
    on<BlocLoginEventoValidarCodigo>(_validarCodigo);
  }

  /// Inicia sesión con el email y contraseña
  /// en caso de ser exitoso, se devuelve la info del usuario y se lo redirige
  /// al dashboard correspondiente, en caso de fallo tira el error respectivo.
  Future<void> _iniciarSesion(
    BlocLoginEventoIniciarSesion event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    emit(
      BlocLoginEstadoCargando.desde(state, estaIniciandoSesion: true),
    );
    try {
      final userInfo = await emailAuth.signIn(
        event.email,
        event.password,
      );

      if (userInfo == null) {
        return emit(
          // TODO(Gon): Preguntar al back que devuelve para handlear los errores
          BlocLoginEstadoError.desde(
            state,
            mensajeDeError: MensajesDeErrorDelLogin.unknown,
          ),
        );
      }

      emit(BlocLoginEstadoExitosoIniciarSesion.desde(state));
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
        emit(
          BlocLoginEstadoError.desde(
            state,
            mensajeDeError: MensajesDeErrorDelLogin.unknown,
          ),
        );
      }
    } catch (e, st) {
      // TODO(Gon): Preguntar al back que devuelve para handlear los errores
      emit(
        BlocLoginEstadoError.desde(
          state,
          mensajeDeError: MensajesDeErrorDelLogin.unknown,
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
          await client.auth.validarCodigoResetPassword(state.codigo);
      if (respuesta) {
        emit(
          BlocLoginEstadoExitosoAlValidarOTP.desde(state),
        );
      } else {
        // TODO(Gon): Preguntar al back que devuelve para handlear los errores
        emit(
          BlocLoginEstadoError.desde(
            state,
            mensajeDeError: MensajesDeErrorDelLogin.unknown,
          ),
        );
      }
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

  /// Verifica si el correo electrónico y contraseña son válidos, y emite
  /// un estado exitoso para habilitar el botón.
  void _habilitarBotonLogin(
    BlocLoginEventoHabilitarBotonLogin event,
    Emitter<BlocLoginEstado> emit,
  ) {
    emit(
      BlocLoginEstadoExitosoGeneral.desde(
        state,
        botonHabilitado: true,
        email: event.email,
      ),
    );
    if (event.password.length > PRLabConfiguracion.minimoDeCaracteresPassword) {
      emit(
        BlocLoginEstadoExitosoGeneral.desde(
          state,
          botonHabilitado: true,
        ),
      );
    } else {
      emit(
        BlocLoginEstadoExitosoGeneral.desde(
          state,
          botonHabilitado: false,
        ),
      );
    }
  }

  /// Cambia el valor de la variable que es utilizada para saber si ingreso
  /// el codigo completo
  void _cambiarLongitudCodigo(
    BlocLoginEventoAgregarCodigoAlEstado event,
    Emitter<BlocLoginEstado> emit,
  ) {
    emit(
      BlocLoginEstadoExitosoGeneral.desde(
        state,
        codigo: event.codigo,
      ),
    );
  }

  /// Repo de los llamados a server pod
  final EmailAuthController emailAuth;
}
