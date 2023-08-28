import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:prlab_flutter/features/lista_articulos_y_recortes/widgets/pr_articulo.dart';

part 'bloc_lista_articulos_y_recortes_estados.dart';
part 'bloc_lista_articulos_y_recortes_evento.dart';

/// {@template BlocAdministracionContenido}
/// El [Bloc] que puede filtrar de distintas el filtrado de los artículos y
/// obtiene la lista de los articulos
/// {@endtemplate}
class BlocListaArticulosYRecortes extends Bloc<
    BlocListaArticulosYRecortesEvento, BlocListaArticulosYRecortesEstado> {
  BlocListaArticulosYRecortes()
      : super(const BlocListaArticulosYRecortesEstadoInicial()) {
    on<BlocListaArticulosYRecortesEventoFiltrar>(_onFiltrarListaArticulos);
    on<BlocListaArticulosYRecortesEventoTraerArticulos>(
      _onTraerListaDeArticulos,
    );
  }

  /// Trae la lista de los articulos
  Future<void> _onTraerListaDeArticulos(
    BlocListaArticulosYRecortesEventoTraerArticulos event,
    Emitter<BlocListaArticulosYRecortesEstado> emit,
  ) async {
    emit(BlocListaArticulosYRecortesEstadoCargando.desde(state));
    try {
      // TODO(mati): sacar por la lista del back y hacer una variable arriba para pasarle la lista del modelo del back
      final listaPrArticulos = [
        PRArticulo(
          fecha: DateTime.now(),
          nombre: 'Flutter article',
          status: 'Draft',
          tieneAutor: false,
        ),
        PRArticulo(
          fecha: DateTime.now(),
          nombre: 'Flutter article',
          status: 'Draft',
          tieneAutor: false,
        ),
        PRArticulo(
          fecha: DateTime.now(),
          nombre: 'Flutter article',
          status: 'Draft',
          tieneAutor: false,
        ),
        PRArticulo(
          fecha: DateTime.now(),
          nombre: 'Flutter article',
          status: 'Draft',
          tieneAutor: false,
        ),
        PRArticulo(
          fecha: DateTime.now(),
          nombre: 'Flutter article',
          status: 'Draft',
          tieneAutor: false,
        ),
        PRArticulo(
          fecha: DateTime.now(),
          nombre: 'Flutter article',
          status: 'Draft',
          tieneAutor: false,
        ),
      ];

      // TODO(anyone): hacer el evento del back la lista de esos articulos
      emit(
        BlocListaArticulosYRecortesEstadoExitoso.desde(
          state,
          articulos: listaPrArticulos,
        ),
      );
    } catch (e, st) {
      emit(
        BlocListaArticulosYRecortesEstadoFallido.desde(
          state,
          errorMessage: e.toString(),
        ),
      );

      if (kDebugMode) {
        debugger();
        throw UnimplementedError('Implementa un error para esto: $e $st');
      }
    }
  }

  /// Filtra por el tipo de articulo.
  Future<void> _onFiltrarListaArticulos(
    BlocListaArticulosYRecortesEventoFiltrar event,
    Emitter<BlocListaArticulosYRecortesEstado> emit,
  ) async {
    if (state.articulos.isNotEmpty) {
      emit(BlocListaArticulosYRecortesEstadoCargando.desde(state));
      try {
        // TODO(anyone): hacer el evento del back para filtrar u otro
        emit(BlocListaArticulosYRecortesEstadoExitoso.desde(state));
      } catch (e, st) {
        emit(
          BlocListaArticulosYRecortesEstadoFallido.desde(
            state,
            errorMessage: e.toString(),
          ),
        );

        if (kDebugMode) {
          debugger();
          throw UnimplementedError('Implementa un error para esto: $e $st');
        }
      }
    }
  }
}
