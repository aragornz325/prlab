import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_flutter/prlab_configuracion/base.dart';
import 'package:prlab_flutter/utilidades/funciones/validators.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';
import 'package:serverpod_auth_client/module.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

part 'bloc_login_event.dart';
part 'bloc_login_state.dart';

// TODO(Gon): Agregar documentacion
/// Bloc que maneja los estados o logica de la pagina de login
class BlocLogin extends Bloc<BlocLoginEvento, BlocLoginEstado> {
  BlocLogin({
    required this.emailAuth,
  }) : super(const BlocLoginEstadoInicial()) {
    on<BlocLoginEventoIniciarSesion>(_iniciarSesion);
    on<BlocLoginEventoHabilitarBotonLogin>(_habilitarBotonLogin);
    on<BlocLoginEventoEnviarCodigoAlMailDelUsuario>(
      _enviarCodigoAlMailDelUsuario,
    );
    on<BlocLoginEventoCambiarLongitudCodigo>(_cambiarLongitudCodigo);
    on<BlocLoginEventoValidarCodigo>(_validarCodigo);
  }

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
      final userInfo = await emailAuth.signIn(
        event.email,
        event.password,
      );

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

  ///evento donde enviamos el codigo de recuperacion de la cuenta o cambio de
  ///contraseña
  FutureOr<void> _enviarCodigoAlMailDelUsuario(
    BlocLoginEventoEnviarCodigoAlMailDelUsuario event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    emit(BlocLoginEstadoCargando.desde(state));
    try {
      ///hacer la validacion de si el codigo es correcto que se emita este
      ///estado
      final response = await emailAuth.initiatePasswordReset(event.email);

      if (response) {
        emit(
          BlocLoginEstadoExitosoAlValidarOTP.desde(state),
        );
      } else {
        throw UnimplementedError(
          'Error al mandar el codigo de cambiar contraseña al mail del usuario',
        );
      }
    } catch (e, st) {
      emit(
        BlocLoginEstadoError.desde(
          state,
          // TODO(Gon): Preguntar al back que devuelve para handlear los errores
          mensajeDeError: MensajesDeErrorDelLogin.invalidCredentials,
        ),
      );
      if (kDebugMode) {
        debugger();
        throw UnimplementedError('Implementa un error para esto: $e $st');
      }
    }
  }

  /// Chequea el codigo enviado al back y lo verifica si esta bien
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
        // TODO(Gon): Verificar si esto esta bien(creo que tambien
        // puede saltar si el codigo es invalido)
        throw UnimplementedError(
          'Error al mandar el codigo de cambiar contraseña al back',
        );
      }
    } catch (e, st) {
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

  /// La función `_habilitarBoton` verifica si el correo electrónico es válido
  ///  y la longitud de la contraseña es mayor a 7, y emite un estado exitoso
  ///  con el botón habilitado si se cumplen lascondiciones.
  Future<void> _habilitarBotonLogin(
    BlocLoginEventoHabilitarBotonLogin event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    try {
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

  /// La funcion cambia el valor de la variable para despues usar
  /// ese valor para saber si ingreso el codigo completo
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

  /// Repo de los llamados a server pod
  final EmailAuthController emailAuth;
}
