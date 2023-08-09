part of 'bloc_login.dart';

class BlocLoginEstado extends Equatable {
  const BlocLoginEstado();

  @override
  List<Object> get props => [];
}

/// Estado inicial de los componentes de la pantalla login
class BlocLoginEstadoInicial extends BlocLoginEstado {
  const BlocLoginEstadoInicial();
}

/// Estado exitoso de los componentes de la pantalla login
class BlocLoginEstadoExitoso extends BlocLoginEstado {
  const BlocLoginEstadoExitoso();
}

/// Estado de error de los componentes de la pantalla login (se puede emitir
/// cuando hay un error la iniciar sesion)
class BlocLoginEstadoError extends BlocLoginEstado {
  const BlocLoginEstadoError({
    required this.errorMessage,
  });

  /// Mensaje de error
  final String errorMessage;
}

/// Estado de cargando de los componentes de la pantalla login
class BlocLoginEstadoCargando extends BlocLoginEstado {
  const BlocLoginEstadoCargando();
}
