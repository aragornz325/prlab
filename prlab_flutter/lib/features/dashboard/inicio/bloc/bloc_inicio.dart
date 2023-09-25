import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_client/prlab_client.dart';
part 'bloc_inicio_estado.dart';
part 'bloc_inicio_evento.dart';

/// {@template BlocInicio}
/// Bloc que maneja los estados y lógica de la pagina de 'Inicio'
/// {@endtemplate}
class BlocInicio extends Bloc<BlocInicioEvento, BlocInicioEstado> {
  /// {@macro BlocInicio}
  BlocInicio()
      : super(
          const BlocInicioEstadoInicial(),
        ) {
    on<BlocInicioEventoInicializar>(_inicializar);
  }

  /// EventHandler de [BlocInicioEventoInicializar]
  Future<void> _inicializar(
    BlocInicioEventoInicializar event,
    Emitter<BlocInicioEstado> emit,
  ) async {
    emit(
      BlocInicioEstadoCargando.desde(state),
    );
    try {
      // TODO(Gon): Traer los datos del back
      await Future.delayed(const Duration(seconds: 2), () {}).then(
        (value) => emit(
          BlocInicioEstadoExitosoGeneral.desde(
            state,
            listaArticulos: [
              EntregableArticulo(
                titulo: '¡Flutter full-responsive package has been released! ',
                ultimaModificacion: DateTime.now(),
                fechaLanzamiento: DateTime.now(),
              ),
              EntregableArticulo(
                titulo: '¡Flutter full-responsive package has been released! ',
                ultimaModificacion: DateTime.now(),
                fechaLanzamiento: DateTime.now(),
              ),
              EntregableArticulo(
                titulo: '¡Flutter full-responsive package has been released! ',
                ultimaModificacion: DateTime.now(),
                fechaLanzamiento: DateTime.now(),
              ),
              EntregableArticulo(
                titulo: '¡Flutter full-responsive package has been released! ',
                ultimaModificacion: DateTime.now(),
                fechaLanzamiento: DateTime.now(),
              ),
              EntregableArticulo(
                titulo: '¡Flutter full-responsive package has been released! ',
                ultimaModificacion: DateTime.now(),
                fechaLanzamiento: DateTime.now(),
              ),
              EntregableArticulo(
                titulo: '¡Flutter full-responsive package has been released! ',
                ultimaModificacion: DateTime.now(),
                fechaLanzamiento: DateTime.now(),
              ),
            ],
          ),
        ),
      );
    } catch (e, st) {
      if (kDebugMode) {
        debugger();
        print(st);
      }

      emit(
        BlocInicioEstadoError.desde(
          state,
          mensajeDeError: MensajesDeErrorInicio.unknown,
        ),
      );
    }
  }
}
