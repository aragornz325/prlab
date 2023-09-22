import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'bloc_caja_comentarios_estado.dart';
part 'bloc_caja_comentarios_evento.dart';

/// {@template BlocCajaDesplegarComentario}
///
/// {@endtemplate}
class BlocCajaDesplegarComentario
    extends Bloc<BlocCajaComentariosEvento, BlocCajaComentariosEstado> {
  /// {@macro BlocCajaDesplegarComentario}
  BlocCajaDesplegarComentario()
      : super(const BlocCajaComentariosEstadoInicial()) {
    on<BlocCajaComentariosEventoCrearComentario>(_crearComentario);
    on<BlocCajaComentariosEventoEliminarComentario>(_eliminarComentario);
    on<BlocCajaComentariosEventoAprobarComentario>(_aprobarComentario);
    on<BlocCajaComentariosEventoDesplegarComentario>(_desplegarComentario);
  }

  /// Función para crear un nuevo comentario
  Future<void> _crearComentario(
    BlocCajaComentariosEventoCrearComentario event,
    Emitter<BlocCajaComentariosEstado> emit,
  ) async {
    emit(BlocCajaComentariosEstadoCargando.desde(state));
    try {
      // TODO(anyone): hacer funcion para crear un nuevo comentario
      emit(BlocCajaComentariosEstadoExitoso.desde(state));
    } catch (e, st) {
      emit(
        BlocCajaComentariosEstadoFallido.desde(
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

  /// Función para eliminar un comentario
  Future<void> _eliminarComentario(
    BlocCajaComentariosEventoEliminarComentario event,
    Emitter<BlocCajaComentariosEstado> emit,
  ) async {
    emit(BlocCajaComentariosEstadoCargando.desde(state));
    try {
      // TODO(anyone): hacer funcion para crear un nuevo comentario
      emit(BlocCajaComentariosEstadoExitoso.desde(state));
    } catch (e, st) {
      emit(
        BlocCajaComentariosEstadoFallido.desde(
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

  /// Función para aprobar un comentario y que este comentario
  Future<void> _aprobarComentario(
    BlocCajaComentariosEventoAprobarComentario event,
    Emitter<BlocCajaComentariosEstado> emit,
  ) async {
    emit(BlocCajaComentariosEstadoCargando.desde(state));
    try {
      // TODO(anyone): hacer funcion para crear un nuevo comentario
      emit(BlocCajaComentariosEstadoExitoso.desde(state));
    } catch (e, st) {
      emit(
        BlocCajaComentariosEstadoFallido.desde(
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

  /// Función para desplegar un comentario en caso de que el usuario quiera
  /// agregar un nuevo comentario se ejecutara esta función
  Future<void> _desplegarComentario(
    BlocCajaComentariosEventoDesplegarComentario event,
    Emitter<BlocCajaComentariosEstado> emit,
  ) async {
    emit(BlocCajaComentariosEstadoCargando.desde(state));
    try {
      // TODO(anyone): hacer funcion para crear un nuevo comentario
      emit(BlocCajaComentariosEstadoExitoso.desde(state));
    } catch (e, st) {
      emit(
        BlocCajaComentariosEstadoFallido.desde(
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
