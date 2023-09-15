import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/utilidades/utilidades.dart';
import 'package:serverpod_client/serverpod_client.dart' as i1;

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

    add(BlocAdministracionMarcasEventoInicializar());
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
      final idUsuario = sessionManager.signedInUser?.id;

      if (idUsuario == null) {
        return emit(
          BlocAdministracionMarcasEstadoError.desde(
            state,
            mensajeDeError: MensajesDeErrorDeAdministracionMarcas.userNotFound,
          ),
        );
      }

      final respuesta = await client.marca.listarMarcasPorUsuario(
        idUsuario: idUsuario,
      );

      emit(
        BlocAdministracionMarcasEstadoExitosoGeneral.desde(
          state,
          marcas: respuesta,
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
