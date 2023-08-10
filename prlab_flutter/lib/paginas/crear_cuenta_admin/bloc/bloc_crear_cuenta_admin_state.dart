part of 'bloc_crear_cuenta_admin.dart';

/// clase abstracta de los tipos de state/estados manejados por el bloc
/// BlocCrearCuentaAdmin
@immutable
abstract class BlocCrearCuentaAdminState extends Equatable {
  @override
  const BlocCrearCuentaAdminState({
    this.emailValido = false,
    this.email = '',
  });

  ///email del Usuario al crear una cuenta Admin
  final String email;

  /// booleano que indica si el correo/email esta bien
  final bool emailValido;

  @override
  List<Object> get props => [
        emailValido,
        email,
      ];
}

/// state/estado `inicial` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminInitial extends BlocCrearCuentaAdminState {}

/// state/estado `exitoso` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminStateSuccess extends BlocCrearCuentaAdminState {
  @override
  const BlocCrearCuentaAdminStateSuccess({
    super.emailValido,
    super.email,
  });
}

/// state/estado `exitoso` al enviar el email de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminStateSuccessEmailEnviado
    extends BlocCrearCuentaAdminState {
  @override
  const BlocCrearCuentaAdminStateSuccessEmailEnviado({
    super.emailValido,
    super.email,
  });
}

/// state/estado de `error` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminStateError extends BlocCrearCuentaAdminState {
  @override
  const BlocCrearCuentaAdminStateError({required this.errorMessage});

  /// mensaje que se va a mostrar en caso de que sea error o de que algo haya
  /// salido mal
  final BlocCrearCuentaAdminStateErrorMessage errorMessage;
}

/// state/estado `cargando` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminStateLoading extends BlocCrearCuentaAdminState {}

/// emum de los tipos de errores a mostrar
enum BlocCrearCuentaAdminStateErrorMessage {
  errorToSendEmail,
  errorToChangeEmail,
}
