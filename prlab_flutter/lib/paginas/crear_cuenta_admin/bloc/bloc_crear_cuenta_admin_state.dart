part of 'bloc_crear_cuenta_admin.dart';

/// Clase abstracta de los tipos de state/estados manejados por el bloc
/// BlocCrearCuentaAdmin
@immutable
class BlocCrearCuentaAdminEstado extends Equatable {
  @override
  const BlocCrearCuentaAdminEstado._({
    this.email = '',
  });

  BlocCrearCuentaAdminEstado.desde(
    BlocCrearCuentaAdminEstado otro,
  ) : this._(
          email: otro.email,
        );

  /// Email del Usuario al crear una cuenta Admin
  final String email;

  /// Booleano que indica si el correo/email esta bien
  bool get esEmailValido => Validators.emailRegExp.hasMatch(email);

  @override
  List<Object> get props => [
        email,
      ];
}

/// State/estado `inicial` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminEstadoInicial extends BlocCrearCuentaAdminEstado {
  const BlocCrearCuentaAdminEstadoInicial() : super._();
}

/// State/estado `exitoso` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminEstadoExitoso extends BlocCrearCuentaAdminEstado {
  const BlocCrearCuentaAdminEstadoExitoso({
    required super.email,
  }) : super._();

  BlocCrearCuentaAdminEstadoExitoso.desde(super.otro) : super.desde();
}

/// State/estado `exitoso` al enviar el email de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminEstadoExitosoEmailEnviado
    extends BlocCrearCuentaAdminEstado {
  BlocCrearCuentaAdminEstadoExitosoEmailEnviado(super.otro) : super.desde();

  BlocCrearCuentaAdminEstadoExitosoEmailEnviado.desde(super.otro)
      : super.desde();
}

/// State/estado de `error` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminEstadoFallido extends BlocCrearCuentaAdminEstado {
  BlocCrearCuentaAdminEstadoFallido.desde(
    super.otro, {
    required this.errorMessage,
  }) : super.desde();

  /// Mensaje que se va a mostrar en caso de que sea error
  /// o de que algo haya salido mal.
  final BlocCrearCuentaAdminEstadoFallidoMensaje errorMessage;
}

/// state/estado `cargando` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminEstadoCargando extends BlocCrearCuentaAdminEstado {
  BlocCrearCuentaAdminEstadoCargando.desde(super.otro) : super.desde();
}

/// emum de los tipos de errores a mostrar
enum BlocCrearCuentaAdminEstadoFallidoMensaje {
  errorToSendEmail,
  errorToChangeEmail,
}
