import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/bloc/bloc_administracion_marcas.dart';
import 'package:prlab_flutter/utilidades/utilidades.dart';

part 'bloc_editor_contenido_estado.dart';
part 'bloc_editor_contenido_evento.dart';

/// {@template BlocEditorContenido}
/// El [Bloc] que maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
class BlocEditorContenido
    extends Bloc<BlocEditorContenidoEvento, BlocEditorContenidoEstado> {
  /// {@macro BlocEditorContenido}
  BlocEditorContenido(int idArticulo)
      : super(const BlocEditorContenidoEstadoInicial()) {
    on<BlocEditorContenidoEventoObtenerArticulo>(_onObtenerArticulo);
    on<BlocEditorContenidoEventoAgregarImagen>(_onAgregarImagen);
    on<BlocEditorContenidoActualizarArticulo>(_onActualizarArticulo);

    add(BlocEditorContenidoEventoObtenerArticulo(idArticulo: idArticulo));
  }

  /// Se encarga principalmente de traer los datos del
  /// artículo que va a ser editado.
  Future<void> _onObtenerArticulo(
    BlocEditorContenidoEventoObtenerArticulo event,
    Emitter<BlocEditorContenidoEstado> emit,
  ) async {
    emit(BlocEditorContenidoEstadoCargando.desde(state));
    try {
      final respuesta = await client.articulo.obtenerArticulo(
        event.idArticulo,
      );

      emit(
        BlocEditorContenidoEstadoExitoso.desde(
          state,
          articulo: respuesta,
          listaSeccionesArticulo: [
            Articulo(
              titulo: 'Title',
              contenido: 'content',
              id: 2,
            ),
            Articulo(
              titulo: 'Title2',
              contenido: 'content3',
              id: 3,
            ),
          ],
        ),
      );
    } catch (e) {
      emit(
        BlocEditorContenidoEstadoError.desde(
          state,
          mensajeDeError: MensajesDeErrorDeAdministracionMarcas.internalError,
        ),
      );
    }
  }

  /// Permite agregar y guardar las imagenes de ambos logos en la vista
  /// editar contenido  y actualiza los datos en el
  /// estado del [BlocEditorContenido].
  Future<void> _onAgregarImagen(
    BlocEditorContenidoEventoAgregarImagen event,
    Emitter<BlocEditorContenidoEstado> emit,
  ) async {
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

  // TODO(ANDRE): Revisar la logica de esta funcion, puede mejorar.
  /// Refresca la descripción y el título del artículo que se esta
  /// editando dentro del estado de [BlocEditorContenidoEstado].
  Future<void> _onActualizarArticulo(
    BlocEditorContenidoActualizarArticulo event,
    Emitter<BlocEditorContenidoEstado> emit,
  ) async {
    final articulo = state.articulo;

    if (articulo == null) {
      return emit(
        BlocEditorContenidoEstadoError.desde(
          state,
          mensajeDeError: MensajesDeErrorDeAdministracionMarcas.internalError,
        ),
      );
    }

    final descripcionDeArticulo =
        event.descripcionDeArticulo?.replaceAll(r'\', '');

    final articuloActualizado = articulo
      ..contenido = descripcionDeArticulo?.substring(
            1,
            descripcionDeArticulo.length - 1,
          ) ??
          state.articulo?.contenido
      ..titulo = event.titulo ?? state.articulo?.titulo ?? '';

    try {
      await client.articulo.actualizarArticulo(
        articulo: articuloActualizado,
      );

      if (event.descripcionDeArticulo != null) {
        emit(
          BlocEditorContenidoEstadoActualizandoDescripcion.desde(
            state,
            descripcionDeArticulo: descripcionDeArticulo ?? '',
          ),
        );
      }
    } catch (e) {
      emit(
        BlocEditorContenidoEstadoError.desde(
          state,
          mensajeDeError: MensajesDeErrorDeAdministracionMarcas.unknown,
        ),
      );
    }
  }
}
