import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'bloc_kyc_estado.dart';
part 'bloc_kyc_evento.dart';

/// {@template BlocKyc}
/// El [Bloc] que maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
class BlocKyc extends Bloc<BlocKcyEvento, BlocKycEstado> {
  /// {@macro BlocKyc}
  BlocKyc() : super(const BlocKycEstadoInicial()) {
    on<BlocKycEventoInsertarInformacionDeKyc>(_onInsertarInformacionDeKyc);
    on<BlocKycEventoRecolectarInformacionDeKyc>(_onRecolectarInformacionDeKyc);
  }

  /// Inserta los datos que el usuario completo en los campos de texto
  /// del formulario del kyc en la base de datos.
  Future<void> _onInsertarInformacionDeKyc(
    BlocKycEventoInsertarInformacionDeKyc event,
    Emitter<BlocKycEstado> emit,
  ) async {
    emit(BlocKycEstadoCargando.desde(state));

    try {
      // TODO(Andreas):
      // Este codigo es seudo, cuando tengamos el endpoint descomentar esto y
      // modificarlo

      /* client.user.insertarKyc(
      state.nombre,
      state.apellido,
      state.fechaDeNacimiento,
      state.nombreDeCompania,
      state.localidadDeCompania,
      state.numeroDeContacto,
    ); */

      emit(BlocKycEstadoExitoso.desde(state));
    } catch (e) {
      emit(BlocKycEstadoFallido.desde(state));
    }
  }

  /// Recolecta los datos que el usuario completo
  /// en los campos de texto del formulario del kyc para ir
  /// actualizando los datos en el estado del [BlocKycEstado].
  Future<void> _onRecolectarInformacionDeKyc(
    BlocKycEventoRecolectarInformacionDeKyc event,
    Emitter<BlocKycEstado> emit,
  ) async {
    emit(
      BlocKycEstadoRecolectandoDatos.desde(
        state,
        nombre: event.nombre,
        apellido: event.apellido,
        fechaDeNacimiento: event.fechaDeNacimiento,
        nombreDeCompania: event.nombreDeCompania,
        localidad: event.localidadDeCompania,
        numeroContacto: event.numeroDeContacto,
      ),
    );
  }
}
