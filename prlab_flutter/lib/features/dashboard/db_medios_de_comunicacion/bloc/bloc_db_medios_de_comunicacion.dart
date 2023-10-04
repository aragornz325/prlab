import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/widgets.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';

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

    on<BlocDbMediosDeComunicacionEventoObtenerListadoDeFiltros>(
      _obtenerListadoDeFiltros,
    );
    on<BlocDbMediosDeComunicacionEventoActualizarFiltros>(_actualizarFiltros);
    add(BlocDbMediosDeComunicacionEventoObtenerPeriodistas());
    add(BlocDbMediosDeComunicacionEventoObtenerListadoDeFiltros());
  }

  /// Trata de obtener la lista de periodistas que estan en la base
  /// de datos.
  Future<void> _obtenerPeriodistas(
    BlocDbMediosDeComunicacionEventoObtenerPeriodistas event,
    Emitter<BlocDbMediosDeComunicacionEstado> emit,
  ) async {
    try {
      final periodistas = await client.periodista.listarPeriodistas(
        idPaises: state.paises.idsSeleccionados,
        idCiudades: state.ciudades.idsSeleccionados,
        idIdiomas: state.lenguajes.idsSeleccionados,
        idTemas: state.temas.idsSeleccionados,
        idTiposDeMedio: state.tipoDeMedio.idsSeleccionados,
        idPuestos: state.puestos.idsSeleccionados,
        nombres: state.nombrePeriodista,
        nombreDeMedio: state.nombreDeMedio,
      );

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

  Future<void> _actualizarFiltros(
    BlocDbMediosDeComunicacionEventoActualizarFiltros event,
    Emitter<BlocDbMediosDeComunicacionEstado> emit,
  ) async {
    emit(
      BlocDbMediosDeComunicacionEstadoActualizandoFiltros.desde(
        state,
        paises: event.paises,
        ciudades: event.ciudades,
        lenguajes: event.lenguajes,
        puestos: event.roles,
        temas: event.temas,
        tipoDeMedio: event.tipoDeMedio,
        nombrePeriodista: event.nombrePeriodista,
        nombreDeMedio: event.nombreDeMedio,
      ),
    );
  }

  Future<void> _obtenerListadoDeFiltros(
    BlocDbMediosDeComunicacionEventoObtenerListadoDeFiltros event,
    Emitter<BlocDbMediosDeComunicacionEstado> emit,
  ) async {
    emit(BlocDbMediosDeComunicacionEstadoCargandoFiltros.desde(state));
    try {
      final filtros =
          await client.periodista.obtenerListaDeFiltrosConRecuento();

      final paises = filtros.paises
          .map(
            (e) => CategoriaFiltroSeleccionable.fromCategoriaFiltro(
              e,
              state.paises.firstWhereOrNull(
                (element) => element.id == e.id,
              ),
            ),
          )
          .toList();

      final ciudades = filtros.ciudades
          .map(
            (e) => CategoriaFiltroSeleccionable.fromCategoriaFiltro(
              e,
              state.ciudades.firstWhereOrNull(
                (element) => element.id == e.id,
              ),
            ),
          )
          .toList();

      final lenguajes = filtros.idiomas
          .map(
            (e) => CategoriaFiltroSeleccionable.fromCategoriaFiltro(
              e,
              state.lenguajes.firstWhereOrNull(
                (element) => element.id == e.id,
              ),
            ),
          )
          .toList();

      final puestos = filtros.puestos
          .map(
            (e) => CategoriaFiltroSeleccionable.fromCategoriaFiltro(
              e,
              state.puestos.firstWhereOrNull(
                (element) => element.id == e.id,
              ),
            ),
          )
          .toList();

      final temas = filtros.temas
          .map(
            (e) => CategoriaFiltroSeleccionable.fromCategoriaFiltro(
              e,
              state.temas.firstWhereOrNull(
                (element) => element.id == e.id,
              ),
            ),
          )
          .toList();

      final tipoDeMedio = filtros.tiposDeMedio
          .map(
            (e) => CategoriaFiltroSeleccionable.fromCategoriaFiltro(
              e,
              state.tipoDeMedio.firstWhereOrNull(
                (element) => element.id == e.id,
              ),
            ),
          )
          .toList();

      emit(
        BlocDbMediosDeComunicacionEstadoTrayendoFiltros.desde(
          state,
          paises: paises,
          ciudades: ciudades,
          lenguajes: lenguajes,
          puestos: puestos,
          temas: temas,
          tipoDeMedio: tipoDeMedio,
        ),
      );
    } catch (e) {
      emit(BlocDbMediosDeComunicacionEstadoFallido.desde(state));
    }
  }
}

/// Extiende del modelo CategoriaFiltro para agregarle un bool
/// 'estaSeleccionado' para poder manipular los filtros.
class CategoriaFiltroSeleccionable extends CategoriaFiltro {
  CategoriaFiltroSeleccionable({
    required this.estaSeleccionado,
    required super.id,
    required super.nombre,
    required super.recuento,
  });

  factory CategoriaFiltroSeleccionable.fromCategoriaFiltro(
    CategoriaFiltro filtro,
    CategoriaFiltroSeleccionable? otro,
  ) {
    return CategoriaFiltroSeleccionable(
      estaSeleccionado: otro?.estaSeleccionado ?? false,
      id: filtro.id,
      nombre: filtro.nombre,
      recuento: filtro.recuento,
    );
  }

  final bool estaSeleccionado;
}

extension CategoriaFiltroX on List<CategoriaFiltroSeleccionable> {
  List<int> get idsSeleccionados =>
      where((element) => element.estaSeleccionado).map((e) => e.id).toList();
}
