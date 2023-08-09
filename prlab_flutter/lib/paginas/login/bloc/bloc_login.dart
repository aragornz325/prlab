import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_flutter/utilidades/email_auth_controller_custom_prlab.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';

part 'bloc_login_event.dart';
part 'bloc_login_state.dart';

/// Bloc que maneja los estados o logica de la pagina de login
class BlocLogin extends Bloc<BlocLoginEvento, BlocLoginEstado> {
  BlocLogin({
    required this.emailAuthControllerCustomPRLab,
  }) : super(const BlocLoginEstadoInicial()) {
    on<BlocLoginEventoIniciarSesion>(_iniciarSesion);
  }

  /// Repositorio editado para Serverpod
  final EmailAuthControllerCustomPRLab emailAuthControllerCustomPRLab;

  /// Funcion que inicia sesion donde llamamos al repo `emailAuth` que es de
  /// server pod y la funcion signIn y pasamos nuestros events
  Future<void> _iniciarSesion(
    BlocLoginEventoIniciarSesion event,
    Emitter<BlocLoginEstado> emit,
  ) async {
    try {
      emit(
        const BlocLoginEstadoCargando(),
      );

      final respuesta = await emailAuthControllerCustomPRLab.iniciarSesion(
        event.email,
        event.password,
      );
      await sessionManager.registerSignedInUser(
        respuesta.userInfo!,
        respuesta.keyId!,
        respuesta.key!,
      );

      if (respuesta.userInfo?.id != null) {
        emit(
          const BlocLoginEstadoExitoso(),
        );
      } else {
        emit(
          const BlocLoginEstadoError(
            errorMessage: LoginErrorMessages.userNotFoud,
          ),
        );
      }
    } catch (e, st) {
      emit(
        const BlocLoginEstadoError(
          errorMessage: LoginErrorMessages.invalidCredentials,
        ),
      );
      if (kDebugMode) {
        debugger();
        throw UnimplementedError('Implementa un error para esto: $e $st');
      }
    }
  }
}
