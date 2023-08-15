part of 'bloc_login.dart';

/// La clase `BlocLoginEvento` es una clase abstracta que amplía
/// la clase `Equatable`.
abstract class BlocLoginEvento extends Equatable {
  const BlocLoginEvento();

  @override
  List<Object> get props => [];
}

/// Evento donde iniciamos sesión
class BlocLoginEventoIniciarSesion extends BlocLoginEvento {
  const BlocLoginEventoIniciarSesion({
    required this.password,
    required this.email,
  });

  /// Email del usuario
  final String email;

  /// Contraseña del usuario
  final String password;
}

/// Evento donde se hablita el boton de iniciar sesión
class BlocLoginEventoHabilitarBoton extends BlocLoginEvento {
  const BlocLoginEventoHabilitarBoton({
    required this.password,
    required this.email,
  });

  /// Email del usuario
  final String email;

  /// Contraseña del usuario
  final String password;
}

/// Evento para que empiece el temporizador del cronometro
class BLocLoginEventoEmpezarTemporizador extends BlocLoginEvento {}

/// Evento para pausar el tiempo del cronometro
class BlocLoginEventoPausarTemporizador extends BlocLoginEvento {}

/// Evento para resetear el tiempo del cronometro
class BlocLoginEventoTemporizadorResetearTemporizador extends BlocLoginEvento {}

/// Evento para estar corriendo o ejecutando la duracion del cronometro
class BlocLoginEventoTiempoEjecucion extends BlocLoginEvento {
  const BlocLoginEventoTiempoEjecucion(this.duracionTimer);
  final int duracionTimer;
}

/// Evento que el cronometro ya a finalizado o completado
class BlocLoginEventoTiempoCompletado extends BlocLoginEvento {}
