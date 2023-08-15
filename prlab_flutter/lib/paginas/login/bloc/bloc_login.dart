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
  }

  /// Repositorio editado para Serverpod
  final EmailAuthControllerCustomPRLab emailAuthControllerCustomPRLab;

  /// Funcion que inicia sesion donde llamamos al repo `emailAuth` que es de
  /// server pod y la funcion signIn y pasamos nuestros events
  Future<void> _iniciarSesion(
    BlocLoginEventoIniciarSesion event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    emit(
      const BlocLoginEstadoCargando(estaIniciandoSesion: true),
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
          const BlocLoginEstadoError(
            errorMessage: MensajesDeErrorDelLogin.userNotFound,
          ),
        );
      }

      emit(const BlocLoginEstadoExitoso());
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

      return emit(BlocLoginEstadoError(errorMessage: loginErrorMessages));
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
          const BlocLoginEstadoExitoso(botonHabilitado: true),
        );
      } else {
        emit(
          const BlocLoginEstadoExitoso(),
        );
      }
    } catch (e, st) {
      emit(
        const BlocLoginEstadoError(
          errorMessage: MensajesDeErrorDelLogin.invalidCredentials,
        ),
      );
      if (kDebugMode) {
        debugger();
        throw UnimplementedError('Implementa un error para esto: $e $st');
      }
    }
  }
}
