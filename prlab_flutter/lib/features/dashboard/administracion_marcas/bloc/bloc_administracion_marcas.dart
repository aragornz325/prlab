import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'bloc_administracion_marcas_evento.dart';
part 'bloc_administracion_marcas_estado.dart';

/// {@template BlocAdministracionMarcas}
/// Bloc que maneja los estados y logica de la pagina de
/// administracion de marcas
/// {@endtemplate}
class BlocAdministracionMarcas extends Bloc<BlocAdministracionMarcasEvento,
    BlocAdministracionMarcasEstado> {
  /// {@macro BlocAdministracionMarcas}
  BlocAdministracionMarcas()
      : super(const BlocAdministracionMarcasEstadoInicial()) {
    on<BlocAdministracionMarcasEventoInicializar>(_inicializar);
  }

  /// Inicializa la pagina trayendo todo lo necesario para el correcto funcionamineto de la misma
  Future<void> _inicializar(
    BlocAdministracionMarcasEventoInicializar event,
    Emitter<BlocAdministracionMarcasEstado> emit,
  ) async {
    emit(
      BlocAdministracionMarcasEstadoCargando.desde(state),
    );
    try {} catch (e, st) {
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
