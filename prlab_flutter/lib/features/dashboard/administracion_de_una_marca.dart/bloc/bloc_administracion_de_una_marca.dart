import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
part 'bloc_administracion_de_una_marca_evento.dart';
part 'bloc_administracion_de_una_marca_estado.dart';

/// {@template BlocAdministracionDeUnaMarca}
/// Bloc que maneja los estados y lógica de la pagina de
/// 'AdministracionDeUnaMarca'
/// {@endtemplate}
class BlocAdministracionDeUnaMarca extends Bloc<
    BlocAdministracionDeUnaMarcaEvento, BlocAdministracionDeUnaMarcaEstado> {
  /// {@macro BlocAdministracionDeUnaMarca}
  BlocAdministracionDeUnaMarca()
      : super(
          const BlocAdministracionDeUnaMarcaEstadoInicial(),
        ) {
    on<BlocAdministracionDeUnaMarcaEventoInicializar>(_inicializar);
  }

  /// EventHandler de [BlocAdministracionDeUnaMarcaEventoInicializar]
  Future<void> _inicializar(
    BlocAdministracionDeUnaMarcaEventoInicializar event,
    Emitter<BlocAdministracionDeUnaMarcaEstado> emit,
  ) async {
    emit(
      BlocAdministracionDeUnaMarcaEstadoCargando.desde(state),
    );
    try {
      // TODO(Gon): Inicializar la pag todavia no se si tiene
      // que traer una lista de la pag anterior o pedirla al back
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
