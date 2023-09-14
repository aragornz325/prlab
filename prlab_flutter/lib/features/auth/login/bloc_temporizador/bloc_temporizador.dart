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
    on<BlocTemporizadorEventoReiniciar>(_resetearCronometro);
    on<BlocTemporizadorEventoCortarEjecucion>(_cortarEjecucion);
  }
  // TODO(anyone): Documentar
  static const int _duracion = 60;
  late Timer _timer;

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

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
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
    BlocTemporizadorEventoReiniciar event,
    Emitter<BlocTemporizadorEstado> emit,
  ) async {
    _timer.cancel();

    emit(const BlocTemporizadorEstadoInicial());
  }

  /// Corta/cancela la ejecución del temporizador.
  FutureOr<void> _cortarEjecucion(
    BlocTemporizadorEventoCortarEjecucion event,
    Emitter<BlocTemporizadorEstado> emit,
  ) async {
    // TODO(anyone): por ahora no hace nada si termino pero agregarle
    // que vuelva o que le avise que se acabo el tiempo para que
    // reenviar el codigo de verificacion/
    if (_timer.isActive) {
      _timer.cancel();
    }

    emit(BlocTemporizadorEstadoCompleto.desde(state));
  }

  /// Cancela el cronometro y lo pausa para que no siga.
  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
