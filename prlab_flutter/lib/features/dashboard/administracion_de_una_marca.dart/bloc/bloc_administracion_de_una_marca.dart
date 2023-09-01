import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/utilidades/utilidades.dart';

part 'bloc_administracion_de_una_marca_estado.dart';
part 'bloc_administracion_de_una_marca_evento.dart';

/// {@template BlocAdministracionDeUnaMarca}
/// Bloc que maneja los estados y lógica de la pagina de
/// 'AdministracionDeUnaMarca'
/// {@endtemplate}
class BlocAdministracionDeUnaMarca extends Bloc<
    BlocAdministracionDeUnaMarcaEvento, BlocAdministracionDeUnaMarcaEstado> {
  /// {@macro BlocAdministracionDeUnaMarca}
  BlocAdministracionDeUnaMarca(int marcaId)
      : super(
          BlocAdministracionDeUnaMarcaEstadoInicial(marcaId),
        ) {
    on<BlocAdministracionDeUnaMarcaEventoInicializar>(_onInicializar);

    add(BlocAdministracionDeUnaMarcaEventoInicializar());
  }

  /// EventHandler de [BlocAdministracionDeUnaMarcaEventoInicializar]
  Future<void> _onInicializar(
    BlocAdministracionDeUnaMarcaEventoInicializar event,
    Emitter<BlocAdministracionDeUnaMarcaEstado> emit,
  ) async {
    emit(
      BlocAdministracionDeUnaMarcaEstadoCargando.desde(state),
    );
    try {
      final respuesta = await client.marca.obtenerMarcaPorId(
        state.idMarca,
      );

      emit(
        BlocAdministracionDeUnaMarcaEstadoExitosoGeneral.desde(
          state,
          marca: respuesta,
        ),
      );
    } catch (e, st) {
      if (kDebugMode) {
        debugger();
        print(st);
      }

      emit(
        BlocAdministracionDeUnaMarcaEstadoError.desde(
          state,
          mensajeDeError: MensajesDeErrorAdministracionDeUnaMarca.unknown,
        ),
      );
    }
  }
}
