import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:prlab_client/prlab_client.dart';

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
      // TODO(anyone):
      // Este endpoint no existe
      /* 
      final respuesta = await client.marca.obtenerMarcaPorId(
         state.marcaId,
        );
       */

      final marca = Marca(
        id: 1,
        nombre: 'Flutter',
        sitioWeb: 'flutter.com',
        staff: [1],
        fechaCreacion: DateTime.now(),
        ultimaModificacion: DateTime.now(),
        fechaEliminacion: DateTime.now(),
      );

      emit(
        BlocAdministracionDeUnaMarcaEstadoExitosoGeneral.desde(
          state,
          marca: marca,
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
