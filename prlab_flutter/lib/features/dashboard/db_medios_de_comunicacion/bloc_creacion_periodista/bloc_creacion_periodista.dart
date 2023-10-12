import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';

part 'bloc_creacion_periodista_estado.dart';
part 'bloc_creacion_periodista_evento.dart';

/// {@template BlocCreacionPeriodista}
/// Bloc que maneja los estados y lógica del popup de 'CreacionPeriodista'
/// {@endtemplate}
class BlocCreacionPeriodista
    extends Bloc<BlocCreacionPeriodistaEvento, BlocCreacionPeriodistaEstado> {
  /// {@macro BlocCreacionPeriodista}
  BlocCreacionPeriodista()
      : super(
          const BlocCreacionPeriodistaEstadoInicial(),
        ) {
    on<BlocCreacionPeriodistaEventoActualizarDatos>(
      _onActualizarDatosDePeriodistaEnCreacion,
    );
    on<BlocCreacionPeriodistaEventoVaciarLista>(
      _onVaciarLista,
    );
    on<BlocCreacionPeriodistaEventoCrearPeriodista>(
      _onCrearPeriodista,
    );
  }

  /// Actualiza los datos del periodista mientras se esta creando
  void _onActualizarDatosDePeriodistaEnCreacion(
    BlocCreacionPeriodistaEventoActualizarDatos event,
    Emitter<BlocCreacionPeriodistaEstado> emit,
  ) {
    emit(
      BlocCreacionPeriodistaEstadoPeriodistaActualizado.desde(
        state,
        nombre: event.nombre ?? state.nombre,
        apellido: event.apellido ?? state.apellido,
        cargo: event.puesto ?? state.puesto,
        empresa: event.medioDeComunicacion ?? state.medioDeComunicacion,
        email: event.email ?? state.email,
        telefono: event.telefono ?? state.telefono,
        imagenElegidaCelular:
            event.imagenElegidaCelular ?? state.imagenElegidaCelular,
        imagenElegidaWeb: event.imagenElegidaWeb ?? state.imagenElegidaWeb,
        idPais: event.idPais ?? state.idPais,
        idCiudad: event.idCiudad ?? state.idCiudad,
        listaIdiomas: event.listaIdiomas ?? state.listaIdiomas,
        biografia: event.biografia ?? state.biografia,
        listaTemas: event.listaTemas ?? state.listaTemas,
        listaRedes: event.listaRedes ?? state.listaRedes,
      ),
    );
  }

  /// Vacia los datos del periodista, luego de que se creo o cuando el usuario
  /// decide salir del popup.
  void _onVaciarLista(
    BlocCreacionPeriodistaEventoVaciarLista event,
    Emitter<BlocCreacionPeriodistaEstado> emit,
  ) {
    emit(
      BlocCreacionPeriodistaEstadoPeriodistaActualizado.desde(
        state,
        nombre: '',
        apellido: '',
        cargo: '',
        empresa: '',
        eliminarImagen: true,
        email: '',
        telefono: '',
        idPais: 0,
        idCiudad: 0,
        biografia: '',
        listaIdiomas: [],
        listaTemas: [],
        listaRedes: [],
      ),
    );
  }

  /// Crea un periodista con todos los campos ingresados y lo envia a la base
  /// de datos
  Future<void> _onCrearPeriodista(
    BlocCreacionPeriodistaEventoCrearPeriodista event,
    Emitter<BlocCreacionPeriodistaEstado> emit,
  ) async {
    emit(BlocCreacionPeriodistaCreandoPeriodista.desde(state));
    try {
      final imagenCelular = state.imagenElegidaCelular;
      var fileBytesCelularList = <int>[];
      if (imagenCelular!.path != 'a') {
        final fileBytesCelular = await imagenCelular.readAsBytes();
        fileBytesCelularList = fileBytesCelular.toList();
      }

      final imagenWeb = state.imagenElegidaWeb;

      var respuestaImagen = '';

      if (imagenWeb != null) {
        respuestaImagen = await client.almacenamientoArchivosNube.subirImagen(
          bytesImagen: kIsWeb ? imagenWeb.toList() : fileBytesCelularList,
          nombreImagen: 'imagen_${state.nombre}'
              '_'
              '${state.apellido}'
              '_'
              '${DateTime.now().millisecondsSinceEpoch}',
          directorioNube: 'reina',
        );
      }
      final periodista = Periodista(
        urlImagen: respuestaImagen,
        nombres: state.nombre,
        apellidos: state.apellido,
        puesto: state.puesto,
        email: state.email,
        telefono: state.telefono,
        medio: state.medioDeComunicacion,
        biografia: state.biografia,
        temas: state.listaTemas,
        ciudad: state.idCiudad.toString(),
        pais: state.idPais.toString(),
        idiomas: state.listaIdiomas,
        redesSociales: state.listaRedes,
      );

      await client.periodista.crearPeriodista(
        periodista: periodista,
      );
      emit(BlocCreacionPeriodistaEstadoExitoAlCrearPeriodista.desde(state));
      add(const BlocCreacionPeriodistaEventoVaciarLista());
    } catch (e, st) {
      if (kDebugMode) {
        debugger();
        print(st);
      }
    }
  }
}
