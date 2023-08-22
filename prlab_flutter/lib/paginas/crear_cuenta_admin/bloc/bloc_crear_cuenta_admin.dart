import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_flutter/utilidades/funciones/functions.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';

part 'bloc_crear_cuenta_admin_evento.dart';
part 'bloc_crear_cuenta_admin_estado.dart';

/// {@template BlocCrearCuentaAdmin}
/// Verifica el email y envia ese email/correo donde se envia una invitación al
/// usuario para que se cree una nueva cuenta
/// {@endtemplate}
class BlocCrearCuentaAdmin
    extends Bloc<BlocCrearCuentaAdminEvent, BlocCrearCuentaAdminEstado> {
  /// {@macro BlocCrearCuentaAdmin}
  BlocCrearCuentaAdmin() : super(const BlocCrearCuentaAdminEstadoInicial()) {
    on<BlocCrearCuentaAdminEventEnviarEmail>(_onEnviarEmail);
    on<BlocCrearCuentaAdminEventVerificarEmail>(_onVerificarEmail);
  }

  /// Envia el email ingresado al back para crear una
  /// nueva admin y que continue con la creación de su cuenta
  Future<void> _onEnviarEmail(
    BlocCrearCuentaAdminEventEnviarEmail event,
    Emitter<BlocCrearCuentaAdminEstado> emit,
  ) async {
    emit(BlocCrearCuentaAdminEstadoCargando.desde(state));
    try {
      // TODO(mati): ver que quieren hacer con el tipo de invitacion
      await client.mail.envioMailRegistro(state.email, 1);

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

  /// Cambia el booleano del esEmailValido con la cual cambiamos el
  /// color del boton y se habilita el poder enviar el email
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
