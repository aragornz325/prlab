import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/utilidades/utilidades.dart';
part 'bloc_drawer_estado.dart';
part 'bloc_drawer_evento.dart';

/// {@template BlocDrawer}
/// Bloc que maneja los estados y lógica del componente PRDrawer de [BlocDrawer]
/// {@endtemplate}
class BlocDrawer extends Bloc<BlocDrawerEvento, BlocDrawerEstado> {
  /// {@macro BlocDrawer}
  BlocDrawer()
      : super(
          const BlocDrawerEstadoInicial(),
        ) {
    on<BlocDrawerEventCerrarSesion>(_cerrarSesion);
  }

  /// Trata de cerrar la sesión de un usuario.
  ///
  /// En caso de error, devuelve un mensaje de fallo
  /// de cierre de sesión.
  Future<void> _cerrarSesion(
    BlocDrawerEventCerrarSesion event,
    Emitter<BlocDrawerEstado> emit,
  ) async {
    emit(
      BlocDrawerEstadoCargando.desde(state),
    );
    try {
      final cerroSesion = await sessionManager.signOut();
      if (cerroSesion) {
        emit(
          BlocDrawerEstadoExitosoGeneral.desde(
            state,
            cerroSesion: cerroSesion,
          ),
        );
      } else {
        emit(
          BlocDrawerEstadoError.desde(
            state,
            mensajeDeError: MensajesDeError
                .falloCerrarSesion, // TODO(ANYONE): Verificar mensajes de error
            // 'No se pudo cerrar sesión',
          ),
        );
      }
    } catch (e, st) {
      if (kDebugMode) {
        debugger();
        print(st);
      }

      emit(
        BlocDrawerEstadoError.desde(
          state,
          mensajeDeError: MensajesDeError.falloCerrarSesion,
        ),
      );
    }
  }
}
