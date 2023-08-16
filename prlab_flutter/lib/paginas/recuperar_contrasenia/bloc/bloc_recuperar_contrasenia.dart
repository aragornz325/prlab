import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_recuperar_contrasenia_estado.dart';
part 'bloc_recuperar_contrasenia_evento.dart';

/// {@template bloc_recuperar_contrasenia}
/// El [Bloc] que maneja el la información para el recupero de contraseña.
/// {@endtemplate}
class BlocRecuperarContrasenia extends Bloc<BlocRecuperarContraseniaEvento,
    BlocRecuperarContraseniaEstado> {
  /// {@macro bloc_recuperar_contrasenia}
  BlocRecuperarContrasenia()
      : super(const BlocRecuperarContraseniaEstadoInicial()) {
    on<BlocRecuperarContraseniaEventoRecolectarData>(_onRecolectarData);
    on<BlocRecuperarContraseniaEventoCambiarContrasenia>(_onCambiarContrasenia);
  }

  /// Recolecta y actualiza los datos de los campos de contraseña
  /// dentro de la página de recuperar contraseña.
  void _onRecolectarData(
    BlocRecuperarContraseniaEventoRecolectarData event,
    Emitter<BlocRecuperarContraseniaEstado> emit,
  ) {
    emit(
      BlocRecuperarContraseniaEstadoRecolectarData.desde(
        state,
        contrasenia: event.contrasenia,
        contraseniaRepetida: event.contraseniaRepetida,
      ),
    );
  }

  /// Cambiar la contraseña del usuario por la que completo en
  /// los campos de textos de la pagina recuperar contraseña.
  Future<void> _onCambiarContrasenia(
    BlocRecuperarContraseniaEventoCambiarContrasenia event,
    Emitter<BlocRecuperarContraseniaEstado> emit,
  ) async {
    emit(BlocRecuperarContraseniaEstadoCargando.desde(state));

    try {
      // TODO(Andre): Completar con la llamada al backend.
      emit(BlocRecuperarContraseniaEstadoExitoso.desde(state));
    } catch (e) {
      emit(BlocRecuperarContraseniaEstadoFallido.desde(state));
    }
  }
}
