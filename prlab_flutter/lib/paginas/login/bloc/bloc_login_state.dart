part of 'bloc_login.dart';

class BlocLoginState extends Equatable {
  const BlocLoginState();

  @override
  List<Object> get props => [];
}

/// Estado donde cambiamos el color del boton de iniciar sesion
class BlocLoginStateInitial extends BlocLoginState {
  const BlocLoginStateInitial();
}

/// Estado success del login
class BlocLoginStateSuccess extends BlocLoginState {
  const BlocLoginStateSuccess();
}

/// Estado de error en caso de que no se pueda iniciar sesion
class BlocLoginStateError extends BlocLoginState {
  const BlocLoginStateError({
    required this.errorMessage,
  });

  /// Mensaje de error
  final String errorMessage;
}

/// Estado de cargando
class BlocLoginStateLoading extends BlocLoginState {
  const BlocLoginStateLoading();
}
