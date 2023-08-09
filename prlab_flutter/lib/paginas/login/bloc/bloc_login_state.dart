part of 'bloc_login.dart';

class BlocLoginEstado extends Equatable {
  const BlocLoginEstado();

  @override
  List<Object> get props => [];
}

/// Estado donde cambiamos el color del boton de iniciar sesion
class BlocLoginEstadoInicial extends BlocLoginEstado {
  const BlocLoginEstadoInicial();
}

/// Estado success del login
class BlocLoginEstadoExitoso extends BlocLoginEstado {
  const BlocLoginEstadoExitoso();
}

/// Estado de error en caso de que no se pueda iniciar sesion
class BlocLoginEstadoError extends BlocLoginEstado {
  const BlocLoginEstadoError({
    required this.errorMessage,
  });

  /// Mensaje de error
  final String errorMessage;
}

/// Estado de cargando
class BlocLoginEstadoCargando extends BlocLoginEstado {
  const BlocLoginEstadoCargando();
}
