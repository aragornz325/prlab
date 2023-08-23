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
    on<BlocAdministracionMarcasEventoTraerInfo>(_traerInfo);
  }

// TODO(Gon): Documentar
  Future<void> _traerInfo(
    BlocAdministracionMarcasEventoTraerInfo event,
    Emitter<BlocAdministracionMarcasEstado> emit,
  ) async {
    emit(
      BlocAdminstracionMarcasEstadoCargando.desde(state),
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
