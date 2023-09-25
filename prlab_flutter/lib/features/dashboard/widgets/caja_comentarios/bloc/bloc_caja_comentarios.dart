import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_flutter/features/dashboard/widgets/caja_comentarios/widgets/pr_comentario.dart';
import 'package:meta/meta.dart';

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
      /// TODO(anyone): sacar y reemplazar por el llamado al back
      final comentarios = <Comentario>[
        Comentario(
            linkDeImagen: '',
            apellido: 'Completo',
            estaAprobado: false,
            fechaDeComentarioEnviado: DateTime.now(),
            nombre: 'Nombre',
            nombreDeLaCompania: 'flutter',
            idComentario: 1,
            comentario: ''),
        Comentario(
            linkDeImagen: '',
            apellido: 'Completo',
            estaAprobado: false,
            fechaDeComentarioEnviado: DateTime.now(),
            nombre: 'Nombre',
            nombreDeLaCompania: 'flutter',
            idComentario: 2,
            comentario: ''),
        Comentario(
            linkDeImagen: '',
            apellido: 'Completo',
            estaAprobado: false,
            fechaDeComentarioEnviado: DateTime.now(),
            nombre: 'Nombre',
            nombreDeLaCompania: 'flutter',
            idComentario: 3,
            comentario: ''),
        Comentario(
            linkDeImagen: '',
            apellido: 'Completo',
            estaAprobado: false,
            fechaDeComentarioEnviado: DateTime.now(),
            nombre: 'Nombre',
            nombreDeLaCompania: 'flutter',
            idComentario: 4,
            comentario: ''),
        Comentario(
            linkDeImagen: '',
            apellido: 'Completo',
            estaAprobado: false,
            fechaDeComentarioEnviado: DateTime.now(),
            nombre: 'Nombre',
            nombreDeLaCompania: 'flutter',
            idComentario: 5,
            comentario: ''),
        Comentario(
            linkDeImagen: '',
            apellido: 'Completo',
            estaAprobado: true,
            fechaDeComentarioEnviado: DateTime.now(),
            nombre: 'Nombre',
            nombreDeLaCompania: 'flutter',
            idComentario: 6,
            comentario:
                'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.'),
        Comentario(
            linkDeImagen: '',
            apellido: 'Completo',
            estaAprobado: true,
            fechaDeComentarioEnviado: DateTime.now(),
            nombre: 'Nombre',
            nombreDeLaCompania: 'flutter',
            idComentario: 7,
            comentario:
                'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.'),
      ]..sort(
          (a, b) =>
              a.fechaDeComentarioEnviado.compareTo(b.fechaDeComentarioEnviado),
        );

      // TODO(anyone): hacer funcion para traer todos los comentario

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
      // TODO(anyone): hacer funcion para crear un nuevo comentario
      // decirle al back que retorne el comentario para reemplazar por los
      // parámetros del nuevo comentario

      final nuevoComentario = Comentario(
        idComentario: 0,
        linkDeImagen: '',
        nombre: 'Nombre',
        apellido: 'Apellido',
        nombreDeLaCompania: 'Flutter',
        fechaDeComentarioEnviado: DateTime.now(),
        estaAprobado: false,
        comentario: state.comentario,
      );
      final comentarios = <Comentario>[
        nuevoComentario,
        ...state.comentarios,
      ];

      emit(BlocCajaComentariosEstadoComentarioCreadoExitosamente.desde(state));

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
      // TODO(anyone): hacer funcion para eliminar un nuevo comentario
      final comentarios = List<Comentario>.from(state.comentarios)
        ..removeWhere(
          (c) => c.idComentario == event.idComentario,
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
      // TODO(anyone): hacer funcion para aprobar un nuevo comentario
      // decirle al back que hagan un copywith de comentario

      final comentarios = List<Comentario>.from(state.comentarios);
      // TODO(anyone): se puede mejorar de otra forma no me anduvo jeje
      for (int i = 0; i < comentarios.length; i++) {
        if (comentarios[i].idComentario == event.idComentario) {
          comentarios[i] = comentarios[i]
              .copyWith(estaAprobado: !comentarios[i].estaAprobado);
          break;
        }
      }

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
