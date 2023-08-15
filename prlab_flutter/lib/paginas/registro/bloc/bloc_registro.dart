import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_event.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/utilidades/email_auth_controller_custom_prlab.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';

/// Bloc que maneja los estados o logica de la pagina de registro
class BlocRegistro extends Bloc<BlocRegistroEvento, BlocRegistroEstado> {
  BlocRegistro({
    required this.emailAuthControllerCustomPRLab,
  }) : super(
          const BlocRegistroEstadoInicial(),
        ) {
    on<BlocRegistroEventoVerificarToken>(_onVerificarToken);
    on<BlocRegistroEventoAceptarTerminos>(_onAceptarTerminos);
    on<BlocRegistroEventoEnviarDatosRegistro>(_onEnviarDatosRegistro);
  }
  final EmailAuthControllerCustomPRLab emailAuthControllerCustomPRLab;
  // final Client client;

  /// Evento que acepta (o declina) los terminos y guarda el estado del checkbox

  Future<void> _onAceptarTerminos(
    BlocRegistroEventoAceptarTerminos event,
    Emitter<BlocRegistroEstado> emit,
  ) async {
    emit(
      BlocRegistroEstadoExitoso.desde(
        state,
        terminosAceptados: event.terminosAceptados,
      ),
    );
  }

  /// Evento que envia los datos de registro y registra al usuario.

  Future<void> _onEnviarDatosRegistro(
    BlocRegistroEventoEnviarDatosRegistro event,
    Emitter<BlocRegistroEstado> emit,
  ) async {
    try {
      final respuesta =
          await emailAuthControllerCustomPRLab.createAccountRequest(
        event.email,
        event.email,
        event.password,
      );

      if (!respuesta) {
        return emit(
          BlocRegistroErrorState.desde(
            state,
            errorMessage: MensajesDeErrorRegistro.credencialesInvalidas,
          ),
        );
      }

      final codigo = await client.auth.getValidationCode(
        event.email,
      );

      await emailAuthControllerCustomPRLab.validateAccount(
        event.email,
        codigo,
      );

      final usuario = await emailAuthControllerCustomPRLab.signIn(
        event.email,
        event.password,
      );

      if (usuario == null) {
        emit(
          BlocRegistroErrorState.desde(
            state,
            errorMessage: MensajesDeErrorRegistro.credencialesInvalidas,
          ),
        );

        return;
      }

      emit(
        BlocRegistroEstadoExitoso.desde(
          state,
          terminosAceptados: state.terminosAceptados,
          email: event.email,
          password: event.password,
        ),
      );
    } catch (e, st) {
      emit(
        BlocRegistroErrorState.desde(
          state,
          errorMessage: MensajesDeErrorRegistro.usuarioNoEncontrado,
        ),
      );

      if (kDebugMode) {
        debugger();
        throw UnimplementedError('Implementa un error para esto: $e $st');
      }
    }
  }

  /// Evento que envia los datos de registro y registra al usuario.

  Future<void> _onVerificarToken(
    BlocRegistroEventoVerificarToken event,
    Emitter<BlocRegistroEstado> emit,
  ) async {
    emit(
      BlocRegistroEstadoCargandoValidacionDeToken.desde(state),
    );

    try {
      final email = await client.auth.validarTokenPorMail(
        event.token,
      );

      emit(
        BlocRegistroEstadoExitoso.desde(state, email: email),
      );
    } catch (e, st) {
      emit(
        BlocRegistroEstadoErrorTokenInvalido.desde(
          state,
          errorMessage: MensajesDeErrorRegistro.usuarioNoEncontrado,
        ),
      );

      if (kDebugMode) {
        debugger();
        throw UnimplementedError('Implementa un error para esto: $e $st');
      }
    }
  }

  /// Funcion que devuelve el mensaje de error traducido al idioma adecuado.
  String traerMensajeDeError(
    BuildContext context,
    MensajesDeErrorRegistro loginErrorMessages,
  ) {
    final l10n = context.l10n;
    return switch (loginErrorMessages) {
      MensajesDeErrorRegistro.credencialesInvalidas =>
        l10n.alert_dialog_code_in, // TODO(sam): revisar mensajes de error
      MensajesDeErrorRegistro.usuarioNoEncontrado => l10n.alert_dialog_code_in,
    };
  }
}
