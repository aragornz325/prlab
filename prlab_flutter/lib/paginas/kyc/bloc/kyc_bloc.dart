import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'kyc_event.dart';
part 'kyc_state.dart';

class BlocKyc extends Bloc<BlocEventKyc, BlocKycEstado> {
  BlocKyc() : super(const BlocKycEstadoInicial()) {
    on<BlocKycEventoGuardarInformacionDeKyc>(_onGuardarInformacionDeKyc);
    on<BlocKycEventoSetearInformacionDeKyc>(_onSetearInformacionDeKyc);
  }

  Future<void> _onGuardarInformacionDeKyc(
    BlocKycEventoGuardarInformacionDeKyc event,
    Emitter<BlocKycEstado> emit,
  ) async {
    emit(BlocKycEstadoCargando.desde(state));

    try {
      // TODO(Andreas):
      // Este codigo es seudo, cuando tengamos el endpoint descomentar esto y modificarlo

      /* client.user.createKyc(
      state.nombre,
      state.apellido,
      state.edad,
      state.nombreDeCompania,
      state.localidadDeCompania,
      state.numeroDeContacto,
    ); */

      const respuesta = true;
      emit(BlocKycEstadoExitoso.desde(state));
    } catch (e) {
      emit(BlocKycEstadoFallido.desde(state));
    }
  }

  Future<void> _onSetearInformacionDeKyc(
    BlocKycEventoSetearInformacionDeKyc event,
    Emitter<BlocKycEstado> emit,
  ) async {
    emit(
      BlocKycEstadoExitoso.desde(
        state,
        nombre: event.nombre,
        apellido: event.apellido,
        fecha: event.fecha,
        nombreDeCompania: event.nombreDeCompania,
        localidad: event.localidadDeCompania,
        numeroContacto: event.numeroDeContacto,
      ),
    );
  }
}
