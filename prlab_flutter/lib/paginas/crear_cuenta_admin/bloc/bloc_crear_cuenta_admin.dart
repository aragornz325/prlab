import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';

part 'bloc_crear_cuenta_admin_event.dart';
part 'bloc_crear_cuenta_admin_state.dart';

/// bloc maneja los estados y logica de crear cuenta admin
class BlocCrearCuentaAdmin
    extends Bloc<BlocCrearCuentaAdminEvent, BlocCrearCuentaAdminEstado> {
  BlocCrearCuentaAdmin() : super(BlocCrearCuentaAdminEstadoInicial()) {
    on<BlocCrearCuentaAdminEventEnviarEmail>(_onEnviarEmail);
    on<BlocCrearCuentaAdminEventVerificarEmail>(_onVerificarEmail);
  }

  /// Funcion que envia el email ingresado al back para crear una
  /// nueva `Admin`
  Future<void> _onEnviarEmail(
    BlocCrearCuentaAdminEventEnviarEmail event,
    Emitter<BlocCrearCuentaAdminEstado> emit,
  ) async {
    emit(
      BlocCrearCuentaAdminEstadoCargando(
        email: state.email,
        esEmailValido: state.esEmailValido,
      ),
    );
    try {
      final respuesta = await client.mailer.envioMailRegistro(state.email);
      if (respuesta) {
        emit(
          BlocCrearCuentaAdminEstadoExitosoEmailEnviado(
            email: state.email,
            esEmailValido: state.esEmailValido,
          ),
        );
      } else {
        emit(
          const BlocCrearCuentaAdminEstadoFallido(
            errorMessage:
                BlocCrearCuentaAdminEstadoFallidoMensaje.errorToSendEmail,
          ),
        );
      }
    } catch (e, st) {
      emit(
        const BlocCrearCuentaAdminEstadoFallido(
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
  Future<void> _onVerificarEmail(
    BlocCrearCuentaAdminEventVerificarEmail event,
    Emitter<BlocCrearCuentaAdminEstado> emit,
  ) async {
    try {
      if (EmailValidator.validate(event.email) && event.email.isNotEmpty) {
        emit(
          BlocCrearCuentaAdminEstadoExitoso(
            esEmailValido: true,
            email: event.email,
          ),
        );
      } else {
        emit(
          BlocCrearCuentaAdminEstadoExitoso(
            email: state.email,
          ),
        );
      }
    } catch (e, st) {
      emit(
        const BlocCrearCuentaAdminEstadoFallido(
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
