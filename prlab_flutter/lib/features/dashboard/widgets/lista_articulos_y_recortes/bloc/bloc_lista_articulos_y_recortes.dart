import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/utilidades/utilidades.dart';

part 'bloc_lista_articulos_y_recortes_estados.dart';
part 'bloc_lista_articulos_y_recortes_evento.dart';

/// {@template BlocListaArticulosYRecortes}
/// El [Bloc] que puede filtrar de distintas el filtrado de los artículos y
/// obtiene la lista de los articulos
/// {@endtemplate}
class BlocListaArticulosYRecortes extends Bloc<
    BlocListaArticulosYRecortesEvento, BlocListaArticulosYRecortesEstado> {
  /// {@macro BlocListaArticulosYRecortes}
  BlocListaArticulosYRecortes()
      : super(const BlocListaArticulosYRecortesEstadoInicial()) {
    on<BlocListaArticulosYRecortesEventoFiltrar>(_onFiltrarListaArticulos);
    on<BlocListaArticulosYRecortesEventoTraerArticulos>(
      _onTraerListaDeArticulos,
    );
    on<BlocListaArticulosYRecortesEventoSeleccion>(
      _onCambiarListaArticulosORecorte,
    );
    on<BlocListaArticulosYRecortesEventoFiltradoPorEstado>(
      _onFiltradoPorEstado,
    );
  }

  /// Trae la lista de los articulos
  Future<void> _onTraerListaDeArticulos(
    BlocListaArticulosYRecortesEventoTraerArticulos event,
    Emitter<BlocListaArticulosYRecortesEstado> emit,
  ) async {
    emit(BlocListaArticulosYRecortesEstadoCargando.desde(state));

    var articulos = <Articulo>[];

    try {
      final idMarca = event.idMarca;

      if (idMarca != null) {
        articulos = await client.articulo.listarArticulosPorMarca(
          idMarca,
        );
      } else {
        articulos = await client.articulo.listarArticulos();
      }

      emit(
        BlocListaArticulosYRecortesEstadoExitoso.desde(
          state,
          articulos: articulos,
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

  /// Filtra por el tipo de articulo.D
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

  /// Cambia el index seleccionado para que muestre distintas vista entre
  /// recortes y lista de artículos
  Future<void> _onCambiarListaArticulosORecorte(
    BlocListaArticulosYRecortesEventoSeleccion event,
    Emitter<BlocListaArticulosYRecortesEstado> emit,
  ) async {
    try {
      emit(
        BlocListaArticulosYRecortesEstadoExitoso.desde(
          state,
          index: event.index,
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

  /// Cambia los valores del estado del bloc y el tipo de filtrado por
  /// Estado/Status para filtrar por ciertos valores definidos en el popup de
  /// filtrado.
  Future<void> _onFiltradoPorEstado(
    BlocListaArticulosYRecortesEventoFiltradoPorEstado event,
    Emitter<BlocListaArticulosYRecortesEstado> emit,
  ) async {
    emit(
      BlocListaArticulosYRecortesEstadoExitoso.desde(
        state,
        borrador: event.borrador,
        comentario: event.comentario,
        completo: event.completo,
      ),
    );
  }
}
