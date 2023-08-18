part of 'bloc_temporizador.dart';

/// {@template BlocTemporizadorEvento}
/// Maneja el timer que se encarga de dejar un tiempo
/// limite para ingresar el OTP enviado para el
/// recupero de contraseña.
/// {@endtemplate}
@immutable
sealed class BlocTemporizadorEvento {}

/// {@template BlocTemporizadorEventoEmpezar}
/// Arranca el contador del temporizador.
/// {@macro BlocTemporizadorEventoEmpezar}
class BlocTemporizadorEventoEmpezar extends BlocTemporizadorEvento {}

/// {@template BlocTemporizadorEventoPausar}
/// Pausa el contador del temporizador.
/// {@macro BlocTemporizadorEventoPausar}
class BlocTemporizadorEventoPausar extends BlocTemporizadorEvento {}

/// {@template BlocTemporizadorEventoResetear}
/// Resetea el contador del temporizador.
/// {@macro BlocTemporizadorEventoResetear}
class BlocTemporizadorEventoResetear extends BlocTemporizadorEvento {}

/// {@template BlocTemporizadorEventoActualizarTiempoDeEjecucion}
/// Actualiza en el estado cuanto tiempo en segundos
/// falta para que se termine la ejecución
/// {@macro BlocTemporizadorEventoActualizarTiempoDeEjecucion}
class BlocTemporizadorEventoActualizarTiempoDeEjecucion
    extends BlocTemporizadorEvento {
  BlocTemporizadorEventoActualizarTiempoDeEjecucion(this.duracionTimer);

  /// Duración del timer
  final int duracionTimer;
}

/// {@template BlocTemporizadorEventoCortarEjecucion}
/// Corta/cancela la ejecución del temporizador para que no
/// siga corriendo el proceso una vez que ya no se utiliza.
/// {@macro BlocTemporizadorEventoCortarEjecucion}
class BlocTemporizadorEventoCortarEjecucion extends BlocTemporizadorEvento {}
