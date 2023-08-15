import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_flutter/utilidades/funciones/functions.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';

part 'bloc_crear_cuenta_admin_event.dart';
part 'bloc_crear_cuenta_admin_state.dart';

/// bloc maneja los estados y logica de crear cuenta admin
class BlocCrearCuentaAdmin
    extends Bloc<BlocCrearCuentaAdminEvent, BlocCrearCuentaAdminEstado> {
  BlocCrearCuentaAdmin() : super(const BlocCrearCuentaAdminEstadoInicial()) {
    on<BlocCrearCuentaAdminEventEnviarEmail>(_onEnviarEmail);
    on<BlocCrearCuentaAdminEventVerificarEmail>(_onVerificarEmail);
  }

  /// Funcion que envia el email ingresado al back para crear una
  /// nueva `Admin`
  Future<void> _onEnviarEmail(
    BlocCrearCuentaAdminEventEnviarEmail event,
    Emitter<BlocCrearCuentaAdminEstado> emit,
  ) async {
    emit(BlocCrearCuentaAdminEstadoCargando.desde(state));
    try {
      // TODO(anyone): ver que quieren hacer con el tipo_de invitacion
      await client.mailer.envioMailRegistro(state.email, 1);

      emit(BlocCrearCuentaAdminEstadoExitosoEmailEnviado.desde(state));
    } catch (e, st) {
      emit(
        BlocCrearCuentaAdminEstadoFallido.desde(
          state,
          errorMessage:
              BlocCrearCuentaAdminEstadoFallidoMensaje.errorToSendEmail,
        ),
      );

      if (kDebugMode) {
        debugger();
        throw UnimplementedError('Implementa un error para esto: $e $st');
      }
    }
  }

  /// Funcion que cambia el booleano del emailValido con la cual cambiamos el
  /// color del boton y podemos enviar el email
  void _onVerificarEmail(
    BlocCrearCuentaAdminEventVerificarEmail event,
    Emitter<BlocCrearCuentaAdminEstado> emit,
  ) {
    try {
      emit(BlocCrearCuentaAdminEstadoExitoso(email: event.email));
    } catch (e, st) {
      emit(
        BlocCrearCuentaAdminEstadoFallido.desde(
          state,
          errorMessage:
              BlocCrearCuentaAdminEstadoFallidoMensaje.errorToChangeEmail,
        ),
      );
      if (kDebugMode) {
        debugger();
        throw UnimplementedError('Implementa un error para esto: $e $st');
      }
    }
  }
}
