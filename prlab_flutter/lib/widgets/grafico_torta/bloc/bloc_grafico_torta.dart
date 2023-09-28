import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'bloc_grafico_torta_evento.dart';
part 'bloc_grafico_torta_estado.dart';

/// {@template BlocGraficoTorta}
/// TODO(mati): documentar
/// {@endtemplate}
class BlocGraficoTorta
    extends Bloc<BlocGraficoTortaEvento, BlocGraficoTortaEstado> {
  /// {@macro BlocGraficoTorta}
  BlocGraficoTorta() : super(BlocGraficoTortaEstadoInicial()) {
    on<BlocGraficoTortaEventoTraerDatos>(_traerDatos);
  }

  /// Trae los datos para el gráfico de tortas.
  Future<void> _traerDatos(
    BlocGraficoTortaEventoTraerDatos event,
    Emitter<BlocGraficoTortaEstado> emit,
  ) async {
    emit(BlocGraficoTortaEstadoCargando.desde(state));
    try {
      final listaDePorcentaje = <double>[
        8,
        2,
        3,
      ];

      emit(
        BlocGraficoTortaEstadoExitoso.desde(
          state,
          porcentajes: listaDePorcentaje,
        ),
      );
    } catch (e, st) {
      // TODO(anyone): Preguntar al back que devuelve para handlear los errores
      if (kDebugMode) {
        debugger();
        print(st);
      }

      emit(
        BlocGraficoTortaEstadoFallido.desde(
          state,
          mensajeDeError: '$e, $st',
        ),
      );
    }
  }
}
