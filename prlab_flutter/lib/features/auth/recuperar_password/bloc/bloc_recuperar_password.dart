import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';

part 'bloc_recuperar_password_estado.dart';
part 'bloc_recuperar_password_evento.dart';

/// {@template BlocRecuperarPassword}
/// El [Bloc] que maneja el la información para el recupero de contraseña.
/// {@endtemplate}
class BlocRecuperarPassword
    extends Bloc<BlocRecuperarPasswordEvento, BlocRecuperarPasswordEstado> {
  /// {@macro BlocRecuperarPassword}
  BlocRecuperarPassword({required String codigoOTP})
      : super(BlocRecuperarPasswordEstadoInicial(codigoOTP)) {
    on<BlocRecuperarPasswordEventoRecolectarData>(_onRecolectarData);
    on<BlocRecuperarPasswordEventoCambiarPassword>(_onCambiarPassword);
  }

  /// Recolecta y actualiza los datos de los campos de contraseña
  /// dentro de la página de recuperar contraseña.
  void _onRecolectarData(
    BlocRecuperarPasswordEventoRecolectarData event,
    Emitter<BlocRecuperarPasswordEstado> emit,
  ) {
    emit(
      BlocRecuperarPasswordEstadoRecolectarData.desde(
        state,
        password: event.password,
        passwordRepetida: event.passwordRepetida,
      ),
    );
  }

  /// Cambiar la contraseña del usuario por la que completo en
  /// los campos de textos de la pagina recuperar contraseña.
  Future<void> _onCambiarPassword(
    BlocRecuperarPasswordEventoCambiarPassword event,
    Emitter<BlocRecuperarPasswordEstado> emit,
  ) async {
    emit(BlocRecuperarPasswordEstadoCargando.desde(state));

    try {
      final respuesta = await client.modules.auth.email.resetPassword(
        state.codigoOTP,
        state.password,
      );
      if (!respuesta) {
        emit(BlocRecuperarPasswordEstadoFallido.desde(state));
      }
      emit(BlocRecuperarPasswordEstadoExitoso.desde(state));
    } catch (e) {
      emit(BlocRecuperarPasswordEstadoFallido.desde(state));
    }
  }
}
