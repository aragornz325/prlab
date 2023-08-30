part of 'bloc_temporizador.dart';

/// {@template BlocTemporizadorEstado}
/// Estado que maneja el temporizador de tiempo
/// limite para completar el OTP para poder ingresar
/// al flujo de recuperar contraseña.
/// {@endtemplate}
@immutable
sealed class BlocTemporizadorEstado {
  /// {@macro BlocTemporizadorEstado}
  const BlocTemporizadorEstado._({
    this.duracionTimer = 60,
  });

  BlocTemporizadorEstado.desde(
    BlocTemporizadorEstado otro, {
    int? duracionTimer,
  }) : this._(
          duracionTimer: duracionTimer ?? otro.duracionTimer,
        );

  /// Indica la cantidad de tiempo restante para la finalización
  /// del cronometro, este valor representa el tiempo en segundos.
  final int duracionTimer;

  /// esta corriedo el temporizador :D
  bool get estaCorriendo => this is BlocTemporizadorEstadoCorriendo;
}

/// {@template BlocTemporizadorEstadoInicial}
/// Estado inicial del [BlocTemporizador].
/// Temporizador cuando se inicializa y se inicia. Toma un entero `duración`
/// como parámetro que representa la duración total del temporizador.
/// {@endtemplate}
class BlocTemporizadorEstadoInicial extends BlocTemporizadorEstado {
  /// {@macro BlocTemporizadorEstadoInicial}
  const BlocTemporizadorEstadoInicial() : super._();
}

/// {@template BlocTemporizadorEstadoCorriendo}
/// Estado de carga del [BlocTemporizador].
/// Toma un entero `duración` como parámetro que
/// representa el tiempo restante del temporizador.
/// {@endtemplate}
class BlocTemporizadorEstadoCorriendo extends BlocTemporizadorEstado {
  /// {@macro BlocTemporizadorEstadoCorriendo}
  BlocTemporizadorEstadoCorriendo.desde(
    super.otro, {
    super.duracionTimer,
  }) : super.desde();
}

/// {@template BlocTemporizadorEstadoCompleto}
/// Estado de exito del [BlocTemporizador].
/// No toma ningún parámetro ya que simplemente indica
/// que el temporizador ha terminado la cuenta regresiva.
/// {@endtemplate}
class BlocTemporizadorEstadoCompleto extends BlocTemporizadorEstado {
  /// {@macro BlocTemporizadorEstadoCompleto}
  BlocTemporizadorEstadoCompleto.desde(super.otro) : super.desde();
}
