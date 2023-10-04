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
    on<BlocListaArticulosYRecortesEventoEliminarArticulo>(
      _onEliminacionDeArticulo,
    );
    on<BlocListaArticulosYRecortesEventoFiltrarBuscador>(
      _onFiltrarBuscadorDeArticulo,
    );
  }

  /// Trae la lista de los articulos
  Future<void> _onTraerListaDeArticulos(
    BlocListaArticulosYRecortesEventoTraerArticulos event,
    Emitter<BlocListaArticulosYRecortesEstado> emit,
  ) async {
    emit(BlocListaArticulosYRecortesEstadoCargando.desde(state));

    var articulos = <EntregableArticulo>[];

    try {
      final idMarca = event.idMarca;

      if (idMarca != null) {
        articulos = await client.entregableArticulo.listarArticulosPorMarca(
          idMarca,
        );
      } else {
        articulos = await client.entregableArticulo.traerArticulosPorUsuario();
      }

      emit(
        BlocListaArticulosYRecortesEstadoExitoso.desde(
          state,
          articulos: articulos,
          articulosFiltrados: articulos,
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
    emit(BlocListaArticulosYRecortesEstadoCargando.desde(state));
    try {
      final idMarca = event.idMarca;

      if (event.sinFiltro) {
        emit(
          BlocListaArticulosYRecortesEstadoExitoso.desde(
            state,
            articulosFiltrados: state.articulos,
          ),
        );
      } else if (state.borrador ||
          state.comentario ||
          state.programado ||
          state.publicado ||
          state.aprobado) {
        final status = <int>[];

        if (state.borrador) status.add(1);
        if (state.comentario) status.add(2);
        if (state.aprobado) status.add(3);
        if (state.programado) status.add(4);
        if (state.publicado) status.add(5);

        // Elimina los estados de la lista status si sus variables
        // correspondientes son false.
        status.removeWhere((e) {
          if (e == 1) return !state.borrador;
          if (e == 2) return !state.comentario;
          if (e == 3) return !state.aprobado;
          if (e == 4) return !state.programado;
          if (e == 5) return !state.publicado;
          return false;
        });
        if (idMarca != null) {
          final respuesta =
              await client.entregableArticulo.listarArticuloMarcayEstado(
            idMarca: idMarca,
            idStatus: status,
          );
          emit(
            BlocListaArticulosYRecortesEstadoExitoso.desde(
              state,
              articulosFiltrados: respuesta,
            ),
          );
        } else {
          final respuesta =
              await client.entregableArticulo.traerEntregableporFiltro(
            status: status,
            idAutor: sessionManager.signedInUser?.id ?? 0,
          );

          emit(
            BlocListaArticulosYRecortesEstadoExitoso.desde(
              state,
              articulosFiltrados: respuesta,
            ),
          );
        }
      } else {
        emit(
          BlocListaArticulosYRecortesEstadoExitoso.desde(
            state,
            articulosFiltrados: state.articulos,
          ),
        );
      }
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

  /// Elimina un articulo en específico
  Future<void> _onFiltrarBuscadorDeArticulo(
    BlocListaArticulosYRecortesEventoFiltrarBuscador event,
    Emitter<BlocListaArticulosYRecortesEstado> emit,
  ) async {
    emit(BlocListaArticulosYRecortesEstadoCargando.desde(state));

    try {
      // TODO(anyone):revisar codigo seguramente se pueda mejorar
      // TODO(anyone):el buscador lo tiene que manejar el back por la paginacion
      final articulos = List<EntregableArticulo>.from(state.articulos);

      var articulosFiltrados =
          List<EntregableArticulo>.from(state.articulosFiltrados);

      if (event.nombreDelArticuloAFiltrar != null &&
          event.nombreDelArticuloAFiltrar != '') {
        articulosFiltrados = articulos
            .where(
              (articulo) => articulo.titulo.toLowerCase().contains(
                    event.nombreDelArticuloAFiltrar!.toLowerCase(),
                  ),
            )
            .toList();
      } else {
        articulosFiltrados = state.articulos;
      }

      emit(
        BlocListaArticulosYRecortesEstadoExitoso.desde(
          state,
          articulosFiltrados: articulosFiltrados,
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

  /// Elimina un articulo en específico
  Future<void> _onEliminacionDeArticulo(
    BlocListaArticulosYRecortesEventoEliminarArticulo event,
    Emitter<BlocListaArticulosYRecortesEstado> emit,
  ) async {
    emit(BlocListaArticulosYRecortesEstadoCargando.desde(state));

    try {
      final listaArticulos =
          List<EntregableArticulo>.from(state.articulosFiltrados)
            ..removeWhere((e) => e.id == event.idArticulo);

      await client.entregableArticulo.eliminarArticulo(
        event.idArticulo,
      );

      emit(
        BlocListaArticulosYRecortesEstadoExitoso.desde(
          state,
          articulosFiltrados: listaArticulos,
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
        aprobado: event.aprobado,
        programado: event.programado,
        publicado: event.publicado,
      ),
    );
  }
}
