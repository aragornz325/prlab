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
  BlocEditorContenido() : super(const BlocEditorContenidoEstadoInicial()) {
    on<BlocEditorContenidoEventoObtenerArticulo>(_onObtenerArticulo);
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
    try {
      final respuesta = await client.articulo.obtenerArticulo(
        event.idArticulo,
      );

      emit(
        BlocEditorContenidoEstadoExitoso.desde(
          state,
          articulo: respuesta,
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

  /// Trae el articulo a editar o continuar su creacion y actualiza los datos
  /// en el estado del [BlocEditorContenido].
  Future<void> _onObtenerArticulo(
    BlocEditorContenidoEventoObtenerArticulo event,
    Emitter<BlocEditorContenidoEstado> emit,
  ) async {
    emit(BlocEditorContenidoEstadoCargando.desde(state));

    try {
      // final articulo = await _backRepository.getArticulo( event.idArticulo);
      final articulo = _listaPrArticulos[1];
      emit(
        BlocEditorContenidoEstadoExitoso.desde(
          state,
          articulo: articulo,
          listaSeccionesArticulo: _listaPrArticulos,
        ),
      );
    } catch (error) {
      emit(
        BlocEditorContenidoEstadoError.desde(
          state,
          mensajeDeError: MensajesDeErrorDeAdministracionMarcas.internalError,
        ), // TODO(SAM): checkear error
      );
    }
  }

  final _listaPrArticulos = [
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
      titulo: 'Flutter articulo',
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
