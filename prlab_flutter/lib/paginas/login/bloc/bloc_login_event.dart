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
class BlocLoginEventoHabilitarBotonLogin extends BlocLoginEvento {
  const BlocLoginEventoHabilitarBotonLogin({
    required this.password,
    required this.email,
  });

  /// Email del usuario
  final String email;

  /// Contraseña del usuario
  final String password;
}

class BlocLoginEventoCambiarTamanioCodigo extends BlocLoginEvento {
  const BlocLoginEventoCambiarTamanioCodigo({
    required this.tamanio,

    /// tamaño del codigo
  });
  final int tamanio;
}

class BlocLoginEventoEnviarCodigoAlMailDelUsuario extends BlocLoginEvento {
  const BlocLoginEventoEnviarCodigoAlMailDelUsuario({
    required this.email,
  });

  /// Email del usuario
  final String email;
}

class BlocLoginEventoEnviarCodigoAlBack extends BlocLoginEvento {
  const BlocLoginEventoEnviarCodigoAlBack({
    required this.password,
    required this.email,
    required this.codigo,
  });

  final String codigo;
  final String password;
  final String email;
}

/// Evento para que empiece el temporizador del cronometro
class BLocLoginEventoEmpezarTemporizador extends BlocLoginEvento {}

/// Evento para pausar el tiempo del cronometro
class BlocLoginEventoPausarTemporizador extends BlocLoginEvento {}

/// Evento para resetear el tiempo del cronometro
class BlocLoginEventoResetearTemporizador extends BlocLoginEvento {}

/// Evento para estar corriendo o ejecutando la duracion del cronometro
class BlocLoginEventoTiempoEjecucion extends BlocLoginEvento {
  const BlocLoginEventoTiempoEjecucion(this.duracionTimer);
  final int duracionTimer;
}

/// Evento que el cronometro ya a finalizado o completado
class BlocLoginEventoTiempoCompletado extends BlocLoginEvento {}
