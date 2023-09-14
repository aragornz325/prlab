import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/assets.dart';

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
    on<BlocEditorContenidoEventoGuardarDatosArticulo>(_onGuardarDatosArticulo);
    on<BlocEditorContenidoEventoEliminarPaginaArticulo>(
      _onEliminarPaginaArticulo,
    );
    on<BlocEditorContenidoEventoEliminarImagen>(_onEliminarImagen);

    add(BlocEditorContenidoEventoObtenerArticulo(idArticulo: idArticulo));
  }

  List<PaginaSeccionArticulo> listaPaginasDeArticulo = <PaginaSeccionArticulo>[
    // TODO(SAM): Luego remover

    PaginaSeccionArticulo(
      icono: Assets.assets_icons_otras_casas_png,
      titulo: 'Home page', //  l10n.pageEditContentArticleTitleHomePage
      contenido: 'content 1',
      id: 1,
    ),
    PaginaSeccionArticulo(
      icono: Assets.assets_icons_leaderboard_png,
      titulo: 'Metrics page', // l10n.pageEditContentArticleTitleMetricsPage,
      contenido: 'content 2',
      id: 2,
    ),
    PaginaSeccionArticulo(
      icono: Assets.assets_icons_link_png,
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
      final respuesta = await client.articulo.obtenerArticulo(
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

  /// Se encarga principalmente de guardar los datos del
  /// artículo que fue editado.
  Future<void> _onGuardarDatosArticulo(
    BlocEditorContenidoEventoGuardarDatosArticulo event,
    Emitter<BlocEditorContenidoEstado> emit,
  ) async {
    emit(BlocEditorContenidoEstadoCargando.desde(state));
    try {
      if (state.articulo != null) {
        await client.articulo.actualizarArticulo(
          articulo: state.articulo!,
        );
        emit(
          BlocEditorContenidoEstadoActualizandoDescripcion.desde(
            state,
            descripcionDeArticulo: state.articulo?.contenido ?? '',
            tituloArticulo: state.articulo?.titulo ?? '',
          ),
        );
      }
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

  // TODO(ANDRE): Revisar la logica de esta funcion, puede
  // mejorar.

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
      if (event.descripcionDeArticulo != null || event.titulo != null) {
        emit(
          BlocEditorContenidoEstadoActualizandoDescripcion.desde(
            state,
            descripcionDeArticulo: descripcionDeArticulo ?? '',
            tituloArticulo: event.titulo ?? articuloActualizado.titulo,
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
          articulo: state.articulo!,
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
  final String icono;
}

abstract class Entregable {
  // TODO(SAM): Definir los campos de Entregable
}
