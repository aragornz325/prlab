part of 'bloc_crear_cuenta_admin.dart';

/// {@template BlocCrearCuentaAdminEvent}
/// Que manejara el Admin a la hora de crear cuentas admin
/// {@endtemplate}
@immutable
abstract class BlocCrearCuentaAdminEvent extends Equatable {
  /// {@macro BlocCrearCuentaAdminEvent}
  const BlocCrearCuentaAdminEvent();

  @override
  List<Object> get props => [];
}

/// {@template BlocCrearCuentaAdminEventEnviarEmail}
/// Envia al email una invitación para que se cree una nueva cuenta,
/// creada por el administrador
/// {@endtemplate}
class BlocCrearCuentaAdminEventEnviarEmail extends BlocCrearCuentaAdminEvent {
  /// {@macro BlocCrearCuentaAdminEventEnviarEmail}
  @override
  const BlocCrearCuentaAdminEventEnviarEmail();
}

/// {@template BlocCrearCuentaAdminEventVerificarEmail}
/// Verifica si el email/correo ingresado es correcto cambia un valor
/// en el estado del bloc y habilita.
/// {@endtemplate}
class BlocCrearCuentaAdminEventVerificarEmail
    extends BlocCrearCuentaAdminEvent {
  /// {@macro BlocCrearCuentaAdminEventVerificarEmail}
  @override
  const BlocCrearCuentaAdminEventVerificarEmail({required this.email});

  /// Email con el que verificamos si cumple los validators y no este vacío
  final String email;
}
