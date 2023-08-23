import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro_event.dart';
import 'package:prlab_flutter/features/auth/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

import 'package:prlab_flutter/utilidades/serverpod_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

/// {@template BlocRegistro}
/// El [Bloc] maneja el formulario de información del usuario
/// en el momento que el usuario se esta registrando, validando token y
/// recolectando datos.
/// {@endtemplate}

class BlocRegistro extends Bloc<BlocRegistroEvento, BlocRegistroEstado> {
  /// {@macro BlocRegistro}
  BlocRegistro({
    required EmailAuthController emailAuth,
  })  : _emailAuth = emailAuth,
        super(const BlocRegistroEstadoInicial()) {
    on<BlocRegistroEventoVerificarToken>(_onVerificarToken);
    on<BlocRegistroEventoAceptarTerminos>(_onAceptarTerminos);
    on<BlocRegistroEventoEnviarDatosRegistro>(_onEnviarDatosRegistro);
    on<BlocRegistroEventoRecolectarDatosRegistro>(
      _onRecolectarInformacionDeRegistro,
    );
  }

  final EmailAuthController _emailAuth;

  /// Acepta (o declina) los terminos y guarda el estado del checkbox
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

  /// Envia los datos de registro, los agrega del evento al estado
  ///  y registra al usuario.
  Future<void> _onEnviarDatosRegistro(
    BlocRegistroEventoEnviarDatosRegistro event,
    Emitter<BlocRegistroEstado> emit,
  ) async {
    try {
      final respuesta = await _emailAuth.createAccountRequest(
        event.email,
        event.email,
        event.password,
      );

      if (!respuesta) {
        return emit(
          BlocRegistroEstadoError.desde(
            state,
            errorMessage: MensajesDeErrorRegistro.credencialesInvalidas,
          ),
        );
      }

      final codigo = await client.auth.getValidationCode(
        event.email,
      );

      await _emailAuth.validateAccount(
        event.email,
        codigo,
      );

      final usuario = await _emailAuth.signIn(
        event.email,
        event.password,
      );

      if (usuario == null) {
        emit(
          BlocRegistroEstadoError.desde(
            state,
            errorMessage: MensajesDeErrorRegistro.credencialesInvalidas,
          ),
        );

        return;
      }

      emit(
        BlocRegistroEstadoUsuarioRegistradoConExito.desde(
          state,
        ),
      );
    } catch (e, st) {
      emit(
        BlocRegistroEstadoError.desde(
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

  /// Verifica el token que le llego al usuario al mail
  /// devolviendo el mail del usuario en caso de una validacion exitosa.

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
        BlocRegistroEstadoExitoso.desde(
          state,
          email: email,
        ),
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
        l10n.alertDialogCodeIn, // TODO(sam): revisar mensajes de error
      MensajesDeErrorRegistro.usuarioNoEncontrado => l10n.alertDialogCodeIn,
    };
  }

  /// Recolecta los datos que el usuario completo
  /// en los campos de texto del formulario del registro para ir
  /// actualizando los datos en el estado del [BlocRegistroEstado].
  Future<void> _onRecolectarInformacionDeRegistro(
    BlocRegistroEventoRecolectarDatosRegistro event,
    Emitter<BlocRegistroEstado> emit,
  ) async {
    emit(
      BlocRegistroEstadoRecolectandoDatos.desde(
        state,
        email: event.email,
        password: event.password,
        passwordConfirmada: event.confirmarPassword,
        terminosAceptados: event.terminosAceptados,
      ),
    );
  }
}
