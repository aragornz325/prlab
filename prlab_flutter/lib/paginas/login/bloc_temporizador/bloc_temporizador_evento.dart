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

/// {@template BlocTemporizadorEventoReiniciar}
/// Reinicia el contador del temporizador.
/// {@macro BlocTemporizadorEventoReiniciar}
class BlocTemporizadorEventoReiniciar extends BlocTemporizadorEvento {}

/// {@template BlocTemporizadorEventoCortarEjecucion}
/// Corta/cancela la ejecución del temporizador para que no
/// siga corriendo el proceso una vez que ya no se utiliza.
/// {@macro BlocTemporizadorEventoCortarEjecucion}
class BlocTemporizadorEventoCortarEjecucion extends BlocTemporizadorEvento {}
