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

  /// Evento que acepta (o declina) los terminos y guarda el estado del checkbox

  Future<void> _onAceptarTerminos(
    BlocRegistroEventoAceptarTerminos event,
    Emitter<BlocRegistroEstado> emit,
  ) async {
    emit(
      const BlocRegistroEstadoCargando(),
    );

    emit(
      BlocRegistroEstadoExitoso(
        terminosAceptados: event.terminosAceptados,
        email: state.email,
        password: state.password,
      ),
    );
  }

  /// Evento que envia los datos de registro y registra al usuario.

  Future<void> _onEnviarDatosRegistro(
    BlocRegistroEventoEnviarDatosRegistro event,
    Emitter<BlocRegistroEstado> emit,
  ) async {
    emit(
      const BlocRegistroEstadoCargando(),
    );
    try {
      final respuesta =
          await emailAuthControllerCustomPRLab.createAccountRequest(
        event.email,
        event.email,
        event.password,
      );
      if (respuesta) {
        final codigo = await client.auth.getValidationCode(
          event.email,
        );
        await emailAuthControllerCustomPRLab.validateAccount(
          event.email,
          codigo,
        );
        final usuario = await emailAuthControllerCustomPRLab.signIn(
          state.email,
          state.password,
        );

        if (usuario != null) {
          emit(
            BlocRegistroEstadoExitoso(
              terminosAceptados: state.terminosAceptados,
              email: event.email,
              password: event.password,
            ),
          );
        } else {
          emit(
            const BlocRegistroErrorState(
              errorMessage: MensajesDeErrorRegistro.credencialesInvalidas,
            ),
          );
        }
      } else {
        emit(
          const BlocRegistroErrorState(
            errorMessage: MensajesDeErrorRegistro.credencialesInvalidas,
          ),
        );
      }
    } catch (e, st) {
      emit(
        const BlocRegistroErrorState(
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
      const BlocRegistroEstadoCargando(),
    );
    try {
      final email = await client.auth.validarTokenPorMail(
        event.token,
      );

      emit(
        BlocRegistroEstadoExitoso(
          email: email,
        ),
      );
    } catch (e, st) {
      emit(
        const BlocRegistroErrorState(
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
        l10n.alert_dialgo_code_in, //Todo(sam): revisar mensajes de error
      MensajesDeErrorRegistro.usuarioNoEncontrado => l10n.alert_dialgo_code_in,
    };
  }
}
