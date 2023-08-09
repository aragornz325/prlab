import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_flutter/utilidades/emailauthcontroller_editado.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

part 'bloc_login_event.dart';
part 'bloc_login_state.dart';

///Bloc que maneja los estados o logica de la pagina de login
class BlocLogin extends Bloc<BlocLoginEvento, BlocLoginEstado> {
  BlocLogin({
    required this.emailAuth,
    required this.emailAuthControllerCustomPRLab,
  }) : super(
          const BlocLoginEstadoInicial(),
        ) {
    on<BlocLoginEventoIniciarSesion>(_iniciarSesion);
  }

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
        respuesta!.userInfo!,
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
            errorMessage: 'Error al iniciar sesion',
          ),
        );
      }
    } catch (e, st) {
      emit(
        BlocLoginEstadoError(
          errorMessage: e.toString(),
        ),
      );
      if (kDebugMode) {
        debugger();
        throw UnimplementedError('Implementa un error para esto: $e $st');
      }
    }
  }

  /// Repo de Serverpod
  final EmailAuthController emailAuth;

  /// Repo editado para Serverpod
  final EmailAuthControllerCustomPRLab emailAuthControllerCustomPRLab;
}
