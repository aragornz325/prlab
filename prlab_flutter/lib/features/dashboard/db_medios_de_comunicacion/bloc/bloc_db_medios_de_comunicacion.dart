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

    add(BlocDbMediosDeComunicacionEventoObtenerPeriodistas());
  }

  Future<void> _obtenerPeriodistas(
    BlocDbMediosDeComunicacionEventoObtenerPeriodistas event,
    Emitter<BlocDbMediosDeComunicacionEstado> emit,
  ) async {
    emit(BlocDbMediosDeComunicacionEstadoCargando.desde(state));

    try {
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
          avatar: 'UNKNOWN',
          valoracion: 50,
          estaSeleccionado: true,
          urlDeImage: 'UNKNOWN',
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
          avatar: 'UNKNOWN',
          valoracion: 90,
          estaSeleccionado: true,
          urlDeImage: 'UNKNOWN',
          idioma: 'Spanigh',
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
          avatar: 'UNKNOWN',
          valoracion: 90,
          estaSeleccionado: true,
          urlDeImage: 'UNKNOWN',
          idioma: 'Spanigh',
          telefono: '11 4585-2435',
          facebook: 'Julian Julian Julian',
          instagram: '@julian_nidus',
          twitter: '@julian_nidus',
          youtube: '@julian_nidus',
          descripcion:
              'This is a description This is a description This is a description This is a description This is a description This is a description This is a description This is a description',
        ),
        Periodista(
          id: 4,
          name: 'Julian Julian Julian Julian',
          anchor: 'Nidus',
          location: 'Argentina',
          topicCovered: ['Software'],
          email: 'julian@nidus.com',
          avatar: 'UNKNOWN',
          valoracion: 90,
          estaSeleccionado: true,
          urlDeImage: 'UNKNOWN',
          idioma: 'Spanigh',
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
}
