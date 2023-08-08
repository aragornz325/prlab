part of 'bloc_login.dart';

@immutable
abstract class BlocLoginEvent extends Equatable {
  const BlocLoginEvent();

  @override
  List<Object> get props => [];
}

/// Evento donde iniciamos sesión
class BlocLoginIniciarSessionEvent extends BlocLoginEvent {
  const BlocLoginIniciarSessionEvent({
    required this.password,
    required this.email,
  });

  /// Contraseña del usuario
  final String password;

  /// Email del usuario
  final String email;
}
