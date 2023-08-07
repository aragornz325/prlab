part of 'bloc_login.dart';

@immutable
sealed class BlocLoginEvent extends Equatable {
  const BlocLoginEvent();

  @override
  List<Object> get props => [];
}

///Evento donde iniciamos sesión
class BlocLoginIniciarSessionEvent extends BlocLoginEvent {
  const BlocLoginIniciarSessionEvent({
    required this.password,
    required this.email,
  });
  final String password;
  final String email;
}
