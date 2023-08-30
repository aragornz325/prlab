import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_client/prlab_client.dart';

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
    on<BlocListaArticulosYRecortesEventoSeleccionEntreRecortesYArticulos>(
      _onCambiarListaArticulosORecorte,
    );
  }

  /// Trae la lista de los articulos
  Future<void> _onTraerListaDeArticulos(
    BlocListaArticulosYRecortesEventoTraerArticulos event,
    Emitter<BlocListaArticulosYRecortesEstado> emit,
  ) async {
    emit(BlocListaArticulosYRecortesEstadoCargando.desde(state));
    try {
      // TODO(anyone): sacar por la lista del back y hacer una variable arriba para pasarle la lista del modelo del back
      final listaPrArticulos = [
        Articulo(
          titulo: 'Flutter article',
          fechaCreacion: DateTime.now(),
          ultimaModificacion: DateTime.now(),
          contenido: 'contenido?',
          fechaEliminacion: DateTime.now(),
          id: 2,
          idAutor: 2,
          idProyecto: 2,
          idStatus: 2,
        ),
        Articulo(
          titulo: 'Flutter article',
          fechaCreacion: DateTime.now(),
          ultimaModificacion: DateTime.now(),
          contenido: 'contenido?',
          fechaEliminacion: DateTime.now(),
          id: 3,
          idAutor: 3,
          idProyecto: 3,
          idStatus: 3,
        ),
        Articulo(
          titulo: 'Flutter article',
          fechaCreacion: DateTime.now(),
          ultimaModificacion: DateTime.now(),
          contenido: 'contenido?',
          fechaEliminacion: DateTime.now(),
          id: 4,
          idAutor: 4,
          idProyecto: 4,
          idStatus: 4,
        ),
        Articulo(
          titulo: 'Flutter article',
          fechaCreacion: DateTime.now(),
          ultimaModificacion: DateTime.now(),
          contenido: 'contenido?',
          fechaEliminacion: DateTime.now(),
          id: 5,
          idAutor: 5,
          idProyecto: 5,
          idStatus: 5,
        ),
        Articulo(
          titulo: 'Flutter article',
          fechaCreacion: DateTime.now(),
          ultimaModificacion: DateTime.now(),
          contenido: 'contenido?',
          fechaEliminacion: DateTime.now(),
          id: 6,
          idAutor: 6,
          idProyecto: 6,
          idStatus: 6,
        ),
        Articulo(
          titulo: 'Flutter article',
          fechaCreacion: DateTime.now(),
          ultimaModificacion: DateTime.now(),
          contenido: 'contenido?',
          fechaEliminacion: DateTime.now(),
          id: 7,
          idAutor: 7,
          idProyecto: 7,
          idStatus: 7,
        ),
        Articulo(
          titulo: 'Flutter article',
          fechaCreacion: DateTime.now(),
          ultimaModificacion: DateTime.now(),
          contenido: 'contenido?',
          fechaEliminacion: DateTime.now(),
          id: 8,
          idAutor: 8,
          idProyecto: 8,
          idStatus: 8,
        ),
        Articulo(
          titulo: 'Flutter article',
          fechaCreacion: DateTime.now(),
          ultimaModificacion: DateTime.now(),
          contenido: 'contenido?',
          fechaEliminacion: DateTime.now(),
          id: 9,
          idAutor: 9,
          idProyecto: 9,
          idStatus: 9,
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
    BlocListaArticulosYRecortesEventoSeleccionEntreRecortesYArticulos event,
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
}
