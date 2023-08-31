import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_client/prlab_client.dart';

part 'bloc_administracion_marcas_estado.dart';
part 'bloc_administracion_marcas_evento.dart';

/// {@template BlocAdministracionMarcas}
/// Bloc que maneja los estados y lógica de la pagina de
/// administración de marcas
/// {@endtemplate}
class BlocAdministracionMarcas extends Bloc<BlocAdministracionMarcasEvento,
    BlocAdministracionMarcasEstado> {
  /// {@macro BlocAdministracionMarcas}
  BlocAdministracionMarcas()
      : super(const BlocAdministracionMarcasEstadoInicial()) {
    on<BlocAdministracionMarcasEventoInicializar>(_onInicializar);
  }

  /// Inicializa la pagina trayendo lo necesario para el correcto funcionamiento
  /// de la misma
  Future<void> _onInicializar(
    BlocAdministracionMarcasEventoInicializar event,
    Emitter<BlocAdministracionMarcasEstado> emit,
  ) async {
    emit(
      BlocAdministracionMarcasEstadoCargando.desde(state),
    );

    try {
      // TODO(anyone):
      // Este endpoint no funciona, y el user id deberia
      // pasarse desde el session desde el back, no pasarlo, pedir cambiar eso
      // en el endpoint.

      /*
      final respuesta = await client.marca.listarMarcasDeUsuario(
        idUsuario: sessionManager.signedInUser?.id ?? 0,
      );
      */
      final marcas = [
        Marca(
          id: 1,
          nombre: 'Flutter',
          sitioWeb: 'flutter.com',
          staff: [1],
          fechaCreacion: DateTime.now(),
          ultimaModificacion: DateTime.now(),
          fechaEliminacion: DateTime.now(),
        ),
        Marca(
          id: 2,
          nombre: 'Vanz',
          sitioWeb: 'vanz.com',
          staff: [1],
          fechaCreacion: DateTime.now(),
          ultimaModificacion: DateTime.now(),
          fechaEliminacion: DateTime.now(),
        ),
      ];

      emit(
        BlocAdministracionMarcasEstadoExitosoGeneral.desde(
          state,
          marcas: marcas,
        ),
      );
    } catch (e, st) {
      if (kDebugMode) {
        debugger();
        print(st);
      }

      emit(
        BlocAdministracionMarcasEstadoError.desde(
          state,
          mensajeDeError: MensajesDeErrorDeAdministracionMarcas.internalError,
        ),
      );
    }
  }
}
