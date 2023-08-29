import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/utilidades/utilidades.dart';

part 'bloc_kyc_estado.dart';
part 'bloc_kyc_evento.dart';

/// {@template BlocKyc}
/// El [Bloc] que maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
class BlocKyc extends Bloc<BlocKcyEvento, BlocKycEstado> {
  /// {@macro BlocKyc}
  BlocKyc() : super(const BlocKycEstadoInicial()) {
    on<BlocKycEventoInsertarAgregarIdUsuario>(_onInsertarIdUsuario);
    on<BlocKycEventoInsertarInformacionDeKyc>(_onInsertarInformacionDeKyc);
    on<BlocKycEventoRecolectarInformacionDeKyc>(_onRecolectarInformacionDeKyc);
  }

  /// Guarda en el estado el id del usuario
  Future<void> _onInsertarIdUsuario(
    BlocKycEventoInsertarAgregarIdUsuario event,
    Emitter<BlocKycEstado> emit,
  ) async {
    emit(
      BlocKycEstadoRecolectandoDatos.desde(
        state,
        idUsuario: event.idUsuario,
      ),
    );
  }

  /// Inserta los datos que el usuario completo en los campos de texto
  /// del formulario del kyc en la base de datos.
  Future<void> _onInsertarInformacionDeKyc(
    BlocKycEventoInsertarInformacionDeKyc event,
    Emitter<BlocKycEstado> emit,
  ) async {
    emit(BlocKycEstadoCargando.desde(state));

    try {
      final cliente = Cliente(
        idUsuario: state.idUsuario,
        nombre: state.nombre,
        apellido: state.apellido,
        // TODO(anyone): sacar esto y cambiar por el del calendario.
        fechaDeNacimiento: DateTime.now(),
        nombreDeOrganizacion: state.nombreDeCompania,
        domicilio: state.localidad,
        telefono: state.numeroContacto,
        fechaCreacion: DateTime.now(),
        ultimaModificacion: DateTime.now(),
      );
      await client.cliente.completarKyc(cliente);

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
