import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/utilidades/utilidades.dart';

part 'bloc_caja_comentarios_estado.dart';
part 'bloc_caja_comentarios_evento.dart';

/// {@template BlocCajaComentarios}
/// Maneja toda la lógica de los comentarios de los articulos ya sea para,
/// obtenerlos,modificar,agregar o eliminar.
/// {@endtemplate}
class BlocCajaComentarios
    extends Bloc<BlocCajaComentariosEvento, BlocCajaComentariosEstado> {
  /// {@macro BlocCajaComentarios}
  BlocCajaComentarios() : super(const BlocCajaComentariosEstadoInicial()) {
    on<BlocCajaComentariosEventoTraerComentarios>(_traerComentarios);
    on<BlocCajaComentariosEventoCrearComentario>(_crearComentario);
    on<BlocCajaComentariosEventoEliminarComentario>(_eliminarComentario);
    on<BlocCajaComentariosEventoDesplegarComentario>(_desplegarComentario);
    on<BlocCajaComentariosEventoAgregarTextoDeComentario>(
      _agregarTextoDeComentario,
    );
    on<BlocCajaComentariosEventoAlternarAprobacionComentario>(
      _alternarAprobacionComentario,
    );
  }

  /// Función para traer todos los comentario de dicho articulo
  Future<void> _traerComentarios(
    BlocCajaComentariosEventoTraerComentarios event,
    Emitter<BlocCajaComentariosEstado> emit,
  ) async {
    emit(BlocCajaComentariosEstadoCargando.desde(state));
    try {
      final comentarios = await client.comentario
          .listarComentariosPorArticulo(idArticulo: event.idArticulo)
        ..sort(
          (a, b) => (b.fechaCreacion )
              .compareTo(a.fechaCreacion),
        );

      emit(
        BlocCajaComentariosEstadoExitoso.desde(
          state,
          comentarios: comentarios,
        ),
      );
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

  /// Función para crear un nuevo comentario
  Future<void> _crearComentario(
    BlocCajaComentariosEventoCrearComentario event,
    Emitter<BlocCajaComentariosEstado> emit,
  ) async {
    emit(BlocCajaComentariosEstadoCargando.desde(state));
    try {
      final nuevoComentario = Comentario(
        fechaCreacion: DateTime.now(),
        textoComentario: state.comentario,
        idEntregable: event.idArticulo,
        idAutor: sessionManager.signedInUser?.id ?? 0,
        nombre: '',
        apellido: '',
        completado: false,
        idAutorCompletado: 0,
      );

      final respuesta =
          await client.comentario.crearComentario(comentario: nuevoComentario);

      final comentarios = <Comentario>[
        respuesta,
        ...state.comentarios,
      ];

      emit(
        BlocCajaComentariosEstadoComentarioCreadoExitosamente.desde(state),
      );

      emit(
        BlocCajaComentariosEstadoExitoso.desde(
          state,
          comentarios: comentarios,
        ),
      );
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
      await client.comentario.eliminarComentario(
        idComentario: event.idComentario,
      );

      final comentarios = List<Comentario>.from(state.comentarios)
        ..removeWhere(
          (c) => c.id == event.idComentario,
        );

      emit(
        BlocCajaComentariosEstadoExitoso.desde(
          state,
          comentarios: comentarios,
        ),
      );
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
  Future<void> _alternarAprobacionComentario(
    BlocCajaComentariosEventoAlternarAprobacionComentario event,
    Emitter<BlocCajaComentariosEstado> emit,
  ) async {
    emit(BlocCajaComentariosEstadoCargando.desde(state));
    try {
      final comentario = List<Comentario>.from(state.comentarios)
          .firstWhere((c) => c.id == event.idComentario);

      /// TODO(anyone):por ahora hasta que se pueda desplegar el comentario
      final nuevoComentario = Comentario(
        idEntregable: comentario.idEntregable,
        textoComentario: comentario.textoComentario,
        idAutor: comentario.idAutor,
        completado: !comentario.completado,
        idAutorCompletado: sessionManager.signedInUser?.id ?? 0,
        apellido: comentario.apellido,
        compania: comentario.compania,
        fechaCreacion: comentario.fechaCreacion,
        id: comentario.id,
        imageUrl: comentario.imageUrl,
        nombre: comentario.nombre,
      );

      await client.comentario.modificarComentario(
        comentario: nuevoComentario,
      );
      comentario.completado = !comentario.completado;

      final comentarios = List<Comentario>.from(state.comentarios);

      emit(
        BlocCajaComentariosEstadoExitoso.desde(
          state,
          comentarios: comentarios,
        ),
      );
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

  /// Función para agregar el texto del campo de texto del usuario para luego
  /// crearlo
  Future<void> _agregarTextoDeComentario(
    BlocCajaComentariosEventoAgregarTextoDeComentario event,
    Emitter<BlocCajaComentariosEstado> emit,
  ) async {
    emit(
      BlocCajaComentariosEstadoExitoso.desde(
        state,
        comentario: event.comentario,
      ),
    );
  }

  /// Función para desplegar un comentario en caso de que el usuario quiera
  /// agregar un nuevo comentario se ejecutara esta función
  Future<void> _desplegarComentario(
    BlocCajaComentariosEventoDesplegarComentario event,
    Emitter<BlocCajaComentariosEstado> emit,
  ) async {
    emit(
      BlocCajaComentariosEstadoExitoso.desde(
        state,
        desplegarComentario: event.deplegarComentario,
      ),
    );
  }
}
