import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    on<BlocEditorContenidoEventoActualizarArticulo>(_onActualizarArticulo);
    on<BlocEditorContenidoEventoEliminarPaginaArticulo>(
      _onEliminarPaginaArticulo,
    );
    on<BlocEditorContenidoEventoEliminarImagen>(_onEliminarImagen);

    add(BlocEditorContenidoEventoObtenerArticulo(idArticulo: idArticulo));
  }

  List<PaginaSeccionArticulo> listaPaginasDeArticulo = <PaginaSeccionArticulo>[
    // TODO(SAM): Luego remover

    PaginaSeccionArticulo(
      icono: Icons.cottage_outlined,
      titulo: 'Home page', //  l10n.pageEditContentArticleTitleHomePage
      contenido: 'content 1',
      id: 1,
    ),
    PaginaSeccionArticulo(
      icono: Icons.leaderboard_outlined,
      titulo: 'Metrics page', // l10n.pageEditContentArticleTitleMetricsPage,
      contenido: 'content 2',
      id: 2,
    ),
    PaginaSeccionArticulo(
      icono: Icons.link,
      titulo: 'Coverage page', //l10n.pageEditContentArticleTitleCoveragePage,
      contenido: 'content 3',
      id: 3,
    ),
  ];

  /// Se encarga principalmente de traer los datos del
  /// artículo que va a ser editado.
  Future<void> _onObtenerArticulo(
    BlocEditorContenidoEventoObtenerArticulo event,
    Emitter<BlocEditorContenidoEstado> emit,
  ) async {
    emit(BlocEditorContenidoEstadoCargando.desde(state));

    try {
      final respuesta = await client.entregableArticulo.obtenerArticulo(
        event.idArticulo,
      );
      emit(
        BlocEditorContenidoEstadoExitoso.desde(
          state,
          articulo: respuesta,
          listaPaginasDeArticulo: listaPaginasDeArticulo,
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

  /// Permite eliminar las imagenes de ambos logos en la vista
  /// editar contenido y actualiza los datos en el
  /// estado del [BlocEditorContenido].
  Future<void> _onEliminarImagen(
    BlocEditorContenidoEventoEliminarImagen event,
    Emitter<BlocEditorContenidoEstado> emit,
  ) async {
    emit(
      BlocEditorContenidoEstadoRecolectandoDatos.desde(
        state,
        eliminarLogoPrimario: event.esLogoPrimario,
        eliminarLogoSecundario: event.esLogoSecundario,
      ),
    );
  }

  /// Refresca la descripción y el título del artículo que se esta
  /// editando dentro del estado de [BlocEditorContenidoEstado].
  Future<void> _onActualizarArticulo(
    BlocEditorContenidoEventoActualizarArticulo event,
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

    if (event.seActualizaDesdeStream) {
      return emit(
        BlocEditorContenidoEstadoActualizandoDesdeStream.desde(
          state,
          descripcionDeArticulo:
              event.descripcionDeArticulo ?? articulo.contenido ?? '',
          tituloArticulo: event.titulo ?? articulo.titulo,
        ),
      );
    }

    final articuloActualizado = articulo
      ..contenido = event.descripcionDeArticulo ?? articulo.contenido ?? ''
      ..titulo = event.titulo ?? state.articulo?.titulo ?? '';

    try {
      if (event.descripcionDeArticulo != null || event.titulo != null) {
        emit(
          BlocEditorContenidoEstadoActualizandoDescripcion.desde(
            state,
            descripcionDeArticulo: articuloActualizado.contenido ?? '',
            tituloArticulo: articuloActualizado.titulo,
          ),
        );

        await client.entregableArticulo.sendStreamMessage(
          articuloActualizado,
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

  Future<void> _onEliminarPaginaArticulo(
    BlocEditorContenidoEventoEliminarPaginaArticulo event,
    Emitter<BlocEditorContenidoEstado> emit,
  ) async {
    emit(BlocEditorContenidoEstadoCargando.desde(state));
    try {
      // TODO(SAM): cambiar por  endpoint del back

      listaPaginasDeArticulo
          .removeWhere((pagina) => pagina.id == event.idPagina);

      emit(
        BlocEditorContenidoEstadoExitoso.desde(
          state,
          articulo: state.articulo,
          listaPaginasDeArticulo: listaPaginasDeArticulo,
        ),
      );
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

/// Clase provisoria que simula una pagina de un articulo, que vendria del back
/// que puede ser home, metricas, coverage o alguna otra que se agregue.
class PaginaSeccionArticulo extends Entregable {
  // TODO(SAM): Remover cuando venga la informacion del back.
  PaginaSeccionArticulo({
    required this.titulo,
    required this.contenido,
    required this.id,
    required this.icono,
  });
  final String titulo;
  final String contenido;
  final int id;
  final IconData icono;
}

abstract class Entregable {
  // TODO(SAM): Definir los campos de Entregable
}
