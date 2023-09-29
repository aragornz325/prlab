import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:prlab_flutter/features/auth/login/escritorio/vista_login.dart';

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
      final visitas = <VisitaData>[
        VisitaData(
          fecha: DateTime.now(),
          visitas: 150,
          idArticulo: 1,
          nombre: 'articulo 1',
        ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 40,
        //   idArticulo: 2,
        //   nombre: 'articulo 2',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 30,
        //   idArticulo: 3,
        //   nombre: 'articulo 3',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 100,
        //   idArticulo: 4,
        //   nombre: 'articulo 4',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 500,
        //   idArticulo: 3,
        //   nombre: 'articulo 1',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 100,
        //   idArticulo: 5,
        //   nombre: 'articulo 1',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 20,
        //   idArticulo: 6,
        //   nombre: 'articulo 1',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 20,
        //   idArticulo: 6,
        //   nombre: 'articulo 1',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 60,
        //   idArticulo: 6,
        //   nombre: 'articulo 1',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 50,
        //   idArticulo: 7,
        //   nombre: 'articulo 1',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 40,
        //   idArticulo: 7,
        //   nombre: 'articulo 1',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 30,
        //   idArticulo: 8,
        //   nombre: 'articulo 1',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 20,
        //   idArticulo: 8,
        //   nombre: 'articulo 1',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 20,
        //   idArticulo: 10,
        //   nombre: 'articulo 1',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 20,
        //   idArticulo: 10,
        //   nombre: 'articulo 1',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 20,
        //   idArticulo: 10,
        //   nombre: 'articulo 1',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 20,
        //   idArticulo: 1,
        //   nombre: 'articulo 1',
        // ),
        // VisitaData(
        //   fecha: DateTime.now(),
        //   visitas: 20,
        //   idArticulo: 11,
        //   nombre: 'articulo 1',
        // ),
        VisitaData(
          fecha: DateTime.now(),
          visitas: 20,
          idArticulo: 11,
          nombre: 'articulo 1',
        ),
      ];
      // TODO(mati): hablar con louka sobre esta logica.
      // Crear un mapa para almacenar la suma de visitas por idArticulo
      final sumaVisitasPorArticulo = <int, double>{};

      // Calcular la suma de visitas por idArticulo
      for (final visita in visitas) {
        final idArticulo = visita.idArticulo;
        final visitasActuales = visita.visitas;
        sumaVisitasPorArticulo[idArticulo] =
            (sumaVisitasPorArticulo[idArticulo] ?? 0) + visitasActuales;
      }

      // Calcular el porcentaje total
      final totalVisitas =
          sumaVisitasPorArticulo.values.reduce((a, b) => a + b);

      // Crear una lista de porcentajes
      final porcentajes = <double>[];

      // Calcular los porcentajes y agregarlos a la lista
      for (final idArticulo in sumaVisitasPorArticulo.keys) {
        final visitasArticulo = sumaVisitasPorArticulo[idArticulo]!;
        final porcentaje = (visitasArticulo / totalVisitas) * 100.0;
        final porcentajeRedondeado = porcentaje.round();
        porcentajes.add(porcentajeRedondeado.toDouble());
      }

      emit(
        BlocGraficoTortaEstadoExitoso.desde(
          state,
          porcentajes: porcentajes,
        ),
      );
    } catch (e, st) {
      // TODO(anyone): Preguntar al back que devuelve para handlear los errores
      if (kDebugMode) {
        debugger();
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
