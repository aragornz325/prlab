part of 'bloc_crear_cuenta_admin.dart';

/// clase abstracta de los tipos de state/estados manejados por el bloc
/// BlocCrearCuentaAdmin
@immutable
abstract class BlocCrearCuentaAdminEstado extends Equatable {
  @override
  const BlocCrearCuentaAdminEstado({
    this.esEmailValido = false,
    this.email = '',
  });

  /// email del Usuario al crear una cuenta Admin
  final String email;

  /// booleano que indica si el correo/email esta bien
  final bool esEmailValido;

  @override
  List<Object> get props => [
        esEmailValido,
        email,
      ];
}

/// state/estado `inicial` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminEstadoInicial extends BlocCrearCuentaAdminEstado {}

/// state/estado `exitoso` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminEstadoExitoso extends BlocCrearCuentaAdminEstado {
  @override
  const BlocCrearCuentaAdminEstadoExitoso({
    super.esEmailValido,
    super.email,
  });
}

/// state/estado `exitoso` al enviar el email de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminEstadoExitosoEmailEnviado
    extends BlocCrearCuentaAdminEstado {
  @override
  const BlocCrearCuentaAdminEstadoExitosoEmailEnviado({
    super.esEmailValido,
    super.email,
  });
}

/// state/estado de `error` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminEstadoFallido extends BlocCrearCuentaAdminEstado {
  @override
  const BlocCrearCuentaAdminEstadoFallido({required this.errorMessage});

  /// mensaje que se va a mostrar en caso de que sea error o de que algo haya
  /// salido mal
  final BlocCrearCuentaAdminEstadoFallidoMensaje errorMessage;
}

/// state/estado `cargando` de BlocCrearCuentaAdmin
class BlocCrearCuentaAdminEstadoCargando extends BlocCrearCuentaAdminEstado {}

/// emum de los tipos de errores a mostrar
enum BlocCrearCuentaAdminEstadoFallidoMensaje {
  errorToSendEmail,
  errorToChangeEmail,
}
