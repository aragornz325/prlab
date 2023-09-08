import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/card_periodista/model_periodista.dart';

part 'bloc_db_medios_de_comunicacion_estado.dart';
part 'bloc_db_medios_de_comunicacion_evento.dart';

/// {@template BlocDbMediosDeComunicacion}
/// Se encarga de manejar los procesos que sucenden
/// en la lista de periodista, como filtros, obtención de
/// información de periodistas entre otras cosas.
/// {@endtemplate}
class BlocDbMediosDeComunicacion extends Bloc<BlocDbMediosDeComunicacionEvento,
    BlocDbMediosDeComunicacionEstado> {
  /// {@macro BlocDbMediosDeComunicacion}
  BlocDbMediosDeComunicacion()
      : super(BlocDbMediosDeComunicacionEstadoInicial()) {
    on<BlocDbMediosDeComunicacionEventoObtenerPeriodistas>(_obtenerPeriodistas);
    on<BlocDbMediosDeComunicacionEventoObtenerDetallePeriodista>(
      _obtenerDetallePeriodista,
    );
    on<BlocDbMediosDeComunicacionEventoObtenerArticulosDelPeriodista>(
      _obtenerArticulosDelPeriodista,
    );

    add(BlocDbMediosDeComunicacionEventoObtenerPeriodistas());
  }

  /// Trata de obtener la lista de periodistas que estan en la base
  /// de datos.
  Future<void> _obtenerPeriodistas(
    BlocDbMediosDeComunicacionEventoObtenerPeriodistas event,
    Emitter<BlocDbMediosDeComunicacionEstado> emit,
  ) async {
    emit(BlocDbMediosDeComunicacionEstadoCargando.desde(state));

    try {
      // TODO(Andre): Cambiar por endpoint del backend.
      final periodistas = [
        Periodista(
          id: 1,
          name: 'John John John John',
          anchor: 'PRLab',
          location: 'Netherlands',
          topicCovered: [
            'Marketing',
            'Marketing',
            'Marketing',
            'Marketing',
          ],
          email: 'john@prlab.com',
          avatar:
              'https://upload.wikimedia.org/wikipedia/commons/e/e0/PlaceholderLC.png',
          valoracion: 50,
          estaSeleccionado: true,
          urlDeImage:
              'https://upload.wikimedia.org/wikipedia/commons/e/e0/PlaceholderLC.png',
          idioma: 'English',
          telefono: '11 2485-2435',
          facebook: 'John John John John',
          instagram: '@john_prlab',
          twitter: '@john_prlab',
          youtube: '@john_prlab',
          descripcion:
              'This is a description This is a description This is a description This is a description This is a description This is a description This is a description This is a description',
        ),
        Periodista(
          id: 2,
          name: 'Julian Julian Julian Julian',
          anchor: 'Nidus',
          location: 'Argentina',
          topicCovered: ['Software'],
          email: 'julian@nidus.com',
          avatar:
              'https://upload.wikimedia.org/wikipedia/commons/e/e0/PlaceholderLC.png',
          valoracion: 90,
          estaSeleccionado: true,
          urlDeImage:
              'https://upload.wikimedia.org/wikipedia/commons/e/e0/PlaceholderLC.png',
          idioma: 'Spanish',
          telefono: '11 4585-2435',
          facebook: 'Julian Julian Julian',
          instagram: '@julian_nidus',
          twitter: '@julian_nidus',
          youtube: '@julian_nidus',
          descripcion:
              'This is a description This is a description This is a description This is a description This is a description This is a description This is a description This is a description',
        ),
        Periodista(
          id: 3,
          name: 'Julian Julian Julian Julian',
          anchor: 'Nidus',
          location: 'Argentina',
          topicCovered: ['Software'],
          email: 'julian@nidus.com',
          avatar:
              'https://upload.wikimedia.org/wikipedia/commons/e/e0/PlaceholderLC.png',
          valoracion: 90,
          estaSeleccionado: true,
          urlDeImage:
              'https://upload.wikimedia.org/wikipedia/commons/e/e0/PlaceholderLC.png',
          idioma: 'Spanish',
          telefono: '11 4585-2435',
          facebook: 'Julian Julian Julian',
          instagram: '@julian_nidus',
          twitter: '@julian_nidus',
          youtube: '@julian_nidus',
          descripcion:
              'This is a description This is a description This is a description This is a description This is a description This is a description This is a description This is a description',
        ),
      ];

      emit(
        BlocDbMediosDeComunicacionEstadoExitoso.desde(
          state,
          periodistas: periodistas,
        ),
      );
    } catch (e) {
      emit(BlocDbMediosDeComunicacionEstadoFallido.desde(state));
    }
  }

  /// Trata información mas detallada de un periodista.
  Future<void> _obtenerDetallePeriodista(
    BlocDbMediosDeComunicacionEventoObtenerDetallePeriodista event,
    Emitter<BlocDbMediosDeComunicacionEstado> emit,
  ) async {
    emit(BlocDbMediosDeComunicacionEstadoCargando.desde(state));

    try {
      // TODO(Andre): Cambiar por endpoint del backend
      final periodista = state.periodistas.firstWhere(
        (e) => e.id == event.idPeriodista,
      );

      emit(
        BlocDbMediosDeComunicacionDetallePeriodistaEstadoExitoso.desde(
          state,
          periodista,
        ),
      );
    } catch (e) {
      emit(BlocDbMediosDeComunicacionEstadoFallido.desde(state));
    }
  }

  /// Trata de obtener la lista de articulos ya publicados por un periodista
  /// a traves del `idPeriodista`.
  Future<void> _obtenerArticulosDelPeriodista(
    BlocDbMediosDeComunicacionEventoObtenerArticulosDelPeriodista event,
    Emitter<BlocDbMediosDeComunicacionEstado> emit,
  ) async {
    emit(BlocDbMediosDeComunicacionEstadoCargando.desde(state));

    try {
      // TODO(Andre):
      // Pedir modelo de este tipo de articulo que hace referencia
      // a aquellos que fueron publicados por un periodista y terminar
      // de manejar esta logica aca y mostrar la lista en el popup de
      // detalle del periodista.
    } catch (e) {
      emit(BlocDbMediosDeComunicacionEstadoFallido.desde(state));
    }
  }
}
