part of 'bloc_crear_cuenta_admin.dart';

// TODO(Mati): Agregar ducumentacion.
/// clase abstracta de los eventos del BlocCrearCuentaAdmin
@immutable
abstract class BlocCrearCuentaAdminEvent extends Equatable {
  // TODO(Mati): Agregar ducumentacion.
  const BlocCrearCuentaAdminEvent();

  @override
  List<Object> get props => [];
}

// TODO(Mati): Agregar ducumentacion y cambiar a EVENTO
/// evento que envia al mail la nueva cuenta a creada por el administrador
class BlocCrearCuentaAdminEventEnviarEmail extends BlocCrearCuentaAdminEvent {
  // TODO(Mati): Agregar ducumentacion.
  @override
  const BlocCrearCuentaAdminEventEnviarEmail();
}

// TODO(Mati): Agregar ducumentacion y cambiar a EVENTO
/// evento que cambia el bool dependiendo si el email es valido o no
class BlocCrearCuentaAdminEventVerificarEmail
    extends BlocCrearCuentaAdminEvent {
  // TODO(Mati): Agregar ducumentacion.
  @override
  const BlocCrearCuentaAdminEventVerificarEmail({required this.email});

  // TODO(Mati): Agregar ducumentacion.
  /// String que indica si el email es valido
  final String email;
}
