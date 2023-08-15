part of 'bloc_login.dart';

class BlocLoginEstado extends Equatable {
  const BlocLoginEstado({
    this.botonHabilitado = false,
    this.estaIniciandoSesion = false,
  });

  /// Bool para habilitar el boton o no dependiendo del contenido
  /// de los textfields
  final bool botonHabilitado;

  /// Bool para diferenciar los estados de cargando
  /// normales a cuando esta iniciando sesión
  final bool estaIniciandoSesion;
  @override
  List<Object> get props => [
        botonHabilitado,
        estaIniciandoSesion,
      ];
}

/// Estado inicial de los componentes de la pantalla login
class BlocLoginEstadoInicial extends BlocLoginEstado {
  const BlocLoginEstadoInicial();
}

/// Estado exitoso de los componentes de la pantalla login
class BlocLoginEstadoExitoso extends BlocLoginEstado {
  const BlocLoginEstadoExitoso({
    super.botonHabilitado,
  });
}

/// Estado de error de los componentes de la pantalla login (se puede emitir
/// cuando hay un error la iniciar sesion)
class BlocLoginEstadoError extends BlocLoginEstado {
  const BlocLoginEstadoError({
    required this.errorMessage,
  });

  /// Mensaje de error
  final MensajesDeErrorDelLogin errorMessage;
}

/// Estado de cargando de los componentes de la pantalla login
class BlocLoginEstadoCargando extends BlocLoginEstado {
  const BlocLoginEstadoCargando({
    super.estaIniciandoSesion,
  });
}

/// emum de los tipos de errores de login a mostrar
enum MensajesDeErrorDelLogin {
  userNotFound,
  invalidCredentials,
  userCreationDenied,
  internalError,
  tooManyFailedAttempts,
  unknown;
}
