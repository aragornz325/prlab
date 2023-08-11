// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class BlocRegistroEstado extends Equatable {
  const BlocRegistroEstado({
    this.terminosAceptados = false,
    this.email = '',
    this.password = '',
    this.passwordConfirmada = false,
    this.tokenValidado = false,
  });
  final bool? terminosAceptados;
  final String email;
  final String password;
  final bool passwordConfirmada;
  final bool tokenValidado;

  @override
  List<Object?> get props => [
        terminosAceptados,
        email,
        password,
        passwordConfirmada,
        tokenValidado,
      ];
}

/// Estado inicial de los componentes de la pantalla registro
class BlocRegistroEstadoInicial extends BlocRegistroEstado {
  const BlocRegistroEstadoInicial({
    super.terminosAceptados,
    super.email,
    super.password,
  });
}

/// Estado exitoso de los componentes de la pantalla login
class BlocRegistroEstadoExitoso extends BlocRegistroEstado {
  const BlocRegistroEstadoExitoso({
    super.terminosAceptados,
    super.email,
    super.password,
    super.tokenValidado,
  });
}

/// Estado de carga de los componentes de la pantalla registro, para mostrar un
/// CircularProgressIndicator()
class BlocRegistroEstadoCargando extends BlocRegistroEstado {
  const BlocRegistroEstadoCargando();
}

/// Estado de error de los componentes de la pantalla registro, acompañado
/// por un mensaje de error
class BlocRegistroErrorState extends BlocRegistroEstado {
  const BlocRegistroErrorState({
    required this.errorMessage,
  });

  /// Mensaje de error
  final MensajesDeErrorRegistro errorMessage;
}

/// Enum de mensajes de error
enum MensajesDeErrorRegistro {
  usuarioNoEncontrado,
  credencialesInvalidas;
}
