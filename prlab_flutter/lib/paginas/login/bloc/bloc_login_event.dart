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

  /// Contraseña del usuario
  final String password;

  /// Email del usuario
  final String email;
}
