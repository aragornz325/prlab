part of 'bloc_login.dart';

// TODO(Gon): Agregar documentacion
/// La clase `BlocLoginEvento` es una clase abstracta que amplía
/// la clase `Equatable`.
abstract class BlocLoginEvento extends Equatable {
  // TODO(Gon): Agregar documentacion
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

/// Evento donde se cambia el tamaño del codigo para poder usar su longitud
/// (no se pudo usar el controller.text.lenght)
class BlocLoginEventoCambiarLongitudCodigo extends BlocLoginEvento {
  const BlocLoginEventoCambiarLongitudCodigo({
    required this.longitudCodigo,
  });

  /// tamaño del codigo (indica cuantos digitos ingreso el usuario)
  final int longitudCodigo;
}

/// Evento que envia el codigo al mail del usuario
class BlocLoginEventoEnviarCodigoAlMailDelUsuario extends BlocLoginEvento {
  const BlocLoginEventoEnviarCodigoAlMailDelUsuario({
    required this.email,
  });

  /// Email del usuario
  final String email;
}

/// Evento que envia el codigo al back para validarlo
class BlocLoginEventoValidarCodigo extends BlocLoginEvento {
  const BlocLoginEventoValidarCodigo({
    required this.codigo,
  });

  /// Codigo ingresado por el usuario
  final String codigo;
}
