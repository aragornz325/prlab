import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'bloc_temporizador_estado.dart';
part 'bloc_temporizador_evento.dart';

/// {@template BlocTemporizador}
/// El [Bloc] que maneja el temporizador que se utiliza
/// para controlar el tiempo limite para volver a enviar
/// un OTP para el cambio de contraseña.
/// {@endtemplate}
class BlocTemporizador
    extends Bloc<BlocTemporizadorEvento, BlocTemporizadorEstado> {
  /// {@macro BlocTemporizador}
  BlocTemporizador() : super(const BlocTemporizadorEstadoInicial()) {
    on<BlocTemporizadorEventoEmpezar>(_empezarCronometro);
    on<BlocTemporizadorEventoResetear>(_resetearCronometro);
    on<BlocTemporizadorEventoActualizarTiempoDeEjecucion>(
      _actualizarTiempoDeEjecucion,
    );
    on<BlocTemporizadorEventoCortarEjecucion>(_cortarEjecucion);
  }

  static const int _duracion = 60;
  late Timer _time;

  /// El tiempo actual faltante para que se termine el cronometro.
  int _tiempoCorriendoDuracion = _duracion;

  /// Inicia a correr el temporizador utilizando
  /// un [Timer] que se va encargando de actualizar
  /// el tiempo restante dentro del estado.
  FutureOr<void> _empezarCronometro(
    BlocTemporizadorEventoEmpezar event,
    Emitter<BlocTemporizadorEstado> emit,
  ) async {
    _tiempoCorriendoDuracion = _duracion;

    emit(
      BlocTemporizadorEstadoCorriendo.desde(
        state,
        duracionTimer: _tiempoCorriendoDuracion,
      ),
    );

    final timeStreamController = StreamController<int>();

    _time = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_tiempoCorriendoDuracion > 0) {
        _tiempoCorriendoDuracion--;
        timeStreamController.sink.add(_tiempoCorriendoDuracion);
      } else {
        timeStreamController.close();
        add(BlocTemporizadorEventoCortarEjecucion());
      }
    });

    await for (final int duracion in timeStreamController.stream) {
      emit(
        BlocTemporizadorEstadoCorriendo.desde(
          state,
          duracionTimer: duracion,
        ),
      );
    }
  }

  /// Cancela la ejecución previa del temporizador
  /// y vuelva a ejecutarlo desde un principio.
  FutureOr<void> _resetearCronometro(
    BlocTemporizadorEventoResetear event,
    Emitter<BlocTemporizadorEstado> emit,
  ) async {
    _time.cancel();

    emit(const BlocTemporizadorEstadoInicial());
  }

  // Va actualizando el tiempo restante de ejecución y lo
  // va guardando dentro del estado.
  FutureOr<void> _actualizarTiempoDeEjecucion(
    BlocTemporizadorEventoActualizarTiempoDeEjecucion event,
    Emitter<BlocTemporizadorEstado> emit,
  ) async {
    emit(
      BlocTemporizadorEstadoCorriendo.desde(
        state,
        duracionTimer: _tiempoCorriendoDuracion,
      ),
    );

    final timerStreamController = StreamController<int>();

    _time = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_tiempoCorriendoDuracion > 0) {
        _tiempoCorriendoDuracion--;
        timerStreamController.sink.add(_tiempoCorriendoDuracion);
      } else {
        timerStreamController.close();
        _time.cancel();
        add(BlocTemporizadorEventoCortarEjecucion());
      }
    });

    await for (final int duracion in timerStreamController.stream) {
      emit(
        BlocTemporizadorEstadoCorriendo.desde(
          state,
          duracionTimer: duracion,
        ),
      );
    }
  }

  /// Corta/cancela la ejecución del temporizador.
  FutureOr<void> _cortarEjecucion(
    BlocTemporizadorEventoCortarEjecucion event,
    Emitter<BlocTemporizadorEstado> emit,
  ) async {
    // TODO(Gon): por ahora no hace nada si termino pero agregarle
    // que vuelva o que le avise que se acabo el tiempo para que
    // reenviar el codigo de verificacion/
    if (_time.isActive) {
      _time.cancel();
    }

    emit(BlocTemporizadorEstadoCompleto.desde(state));
  }

  /// Cancela el cronometro y lo pausa para que no siga.
  @override
  Future<void> close() {
    _time.cancel();
    return super.close();
  }
}
