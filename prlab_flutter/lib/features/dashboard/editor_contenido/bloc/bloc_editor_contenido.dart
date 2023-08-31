import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

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
    on<BlocEditorContenidoActualizarDescripcion>(_onActualizarDescripcion);
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
  void _onActualizarDescripcion(
    BlocEditorContenidoActualizarDescripcion event,
    Emitter<BlocEditorContenidoEstado> emit,
  ) {
    emit(
      BlocEditorContenidoEstadoActualizandoDescripcion.desde(
        state,
        descripcionDeArticulo: event.descripcionDeArticulo,
      ),
    );
  }
}