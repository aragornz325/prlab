part of 'bloc_crear_cuenta_admin.dart';

/// clase abstracta de los eventos del BlocCrearCuentaAdmin
@immutable
abstract class BlocCrearCuentaAdminEvent extends Equatable {
  const BlocCrearCuentaAdminEvent();

  @override
  List<Object> get props => [];
}

/// evento que envia al mail la nueva cuenta a creada por el administrador
class BlocCrearCuentaAdminEventEnviarEmail extends BlocCrearCuentaAdminEvent {
  @override
  const BlocCrearCuentaAdminEventEnviarEmail({required this.email});

  /// Email del usuario para crear una nueva cuenta
  final String email;
}

/// evento que cambia el bool dependiendo si el email es valido o no
class BlocCrearCuentaAdminEventVerificarEmail
    extends BlocCrearCuentaAdminEvent {
  @override
  const BlocCrearCuentaAdminEventVerificarEmail({required this.emailValido});

  /// booleano que indica si el email es valido
  final bool emailValido;
}
