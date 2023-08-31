import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_client/prlab_client.dart';

part 'bloc_editor_contenido_estado.dart';
part 'bloc_editor_contenido_evento.dart';

/// {@template BlocEditorContenido}
/// El [Bloc] que maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
class BlocEditorContenido
    extends Bloc<BlocEditorContenidoEvento, BlocEditorContenidoEstado> {
  /// {@macro BlocEditorContenido}
  BlocEditorContenido() : super(const BlocEditorContenidoEstadoInicial()) {
    on<BlocEditorContenidoEventoAgregarImagen>(_onAgregarImagen);
    on<BlocEditorContenidoEventoInicializar>(_onInicializar);
    on<BlocEditorContenidoActualizarDescripcion>(_onActualizarDescripcion);
  }

  /// Se encarga principalmente de traer los datos del
  /// artículo que va a ser editado.
  Future<void> _onInicializar(
    BlocEditorContenidoEventoInicializar event,
    Emitter<BlocEditorContenidoEstado> emit,
  ) async {
    // TODO(anyone):
    // Este endpoint no funciona
    /*
       final respuesta = await client.articulo.obtenerArticulo(
      event.articuloId,
    );
      */

    final articulo = Articulo(
      id: 0,
      titulo: 'Primer Art',
      contenido: 'Nada',
      idProyecto: 1,
      idMarca: 0,
      idAutor: 0,
      idStatus: 0,
      fechaEliminacion: DateTime.now(),
      ultimaModificacion: DateTime.now(),
      fechaCreacion: DateTime.now(),
    );

    emit(
      BlocEditorContenidoEstadoExitoso.desde(
        state,
        articulo: articulo,
      ),
    );
  }

  /// Permite agregar y guardar las imagenes de ambos logos en la vista
  /// editar contenido  y actualiza los datos en el
  /// estado del [BlocEditorContenido].
  void _onAgregarImagen(
    BlocEditorContenidoEventoAgregarImagen event,
    Emitter<BlocEditorContenidoEstado> emit,
  ) {
    emit(
      BlocEditorContenidoEstadoRecolectandoDatos.desde(
        state,
        logoElegidoCelular:
            event.logoElegidoCelular ?? state.logoElegidoCelular,
        logoElegidoWeb: event.logoElegidoWeb ?? state.logoElegidoWeb,
        logoSecundarioElegidoCelular: event.logoSecundarioElegidoCelular ??
            state.logoSecundarioElegidoCelular,
        logoSecundarioElegidoWeb:
            event.logoSecundarioElegidoWeb ?? state.logoSecundarioElegidoWeb,
      ),
    );
  }

  /// Refresca la descripción del artículo que se esta
  /// editando dentro del estado de [BlocEditorContenidoEstado].
  Future<void> _onActualizarDescripcion(
    BlocEditorContenidoActualizarDescripcion event,
    Emitter<BlocEditorContenidoEstado> emit,
  ) async {
    // TODO(anyone):
    // Este endpoint no existe

    // final respuesta = await client.articulo.actualizarArticulo(
    //   state.articulo,
    // );

    emit(
      BlocEditorContenidoEstadoActualizandoDescripcion.desde(
        state,
        descripcionDeArticulo: event.descripcionDeArticulo,
      ),
    );
  }
}
