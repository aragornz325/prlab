import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class BlocRegistroEstado extends Equatable {
  const BlocRegistroEstado._({
    this.terminosAceptados = false,
    this.passwordConfirmada = false,
    this.email = '',
    this.password = '',
  });

  BlocRegistroEstado.desde(
    BlocRegistroEstado otro, {
    bool? terminosAceptados,
    String? email,
    String? password,
    bool? passwordConfirmada,
  }) : this._(
          terminosAceptados: terminosAceptados ?? otro.terminosAceptados,
          passwordConfirmada: passwordConfirmada ?? otro.passwordConfirmada,
          email: email ?? otro.email,
          password: password ?? otro.password,
        );

  final bool terminosAceptados;

  final String email;

  final String password;

  final bool passwordConfirmada;

  bool get isEstadoInicial => this is BlocRegistroEstadoInicial;

  bool get isEstadoExitoso => this is BlocRegistroEstadoExitoso;

  bool get isEstadoCargando => this is BlocRegistroEstadoCargando;

  @override
  List<Object> get props => [
        terminosAceptados,
        email,
        password,
        passwordConfirmada,
      ];
}

/// Estado inicial de los componentes de la pantalla registro
class BlocRegistroEstadoInicial extends BlocRegistroEstado {
  const BlocRegistroEstadoInicial() : super._();
}

/// Estado exitoso de los componentes de la pantalla login
class BlocRegistroEstadoExitoso extends BlocRegistroEstado {
  BlocRegistroEstadoExitoso.desde(
    super.otro, {
    super.terminosAceptados,
    super.email,
    super.password,
  }) : super.desde();
}

/// Estado de carga de los componentes de la pantalla registro, para mostrar un
/// CircularProgressIndicator()
class BlocRegistroEstadoCargando extends BlocRegistroEstado {
  BlocRegistroEstadoCargando.desde(super.otro) : super.desde();
}

/// Estado de carga de los componentes de la pantalla registro, para mostrar un
/// CircularProgressIndicator()
class BlocRegistroEstadoCargandoValidacionDeToken extends BlocRegistroEstado {
  BlocRegistroEstadoCargandoValidacionDeToken.desde(super.otro) : super.desde();
}

/// Estado de error de los componentes de la pantalla registro, acompañado
/// por un mensaje de error
class BlocRegistroErrorState extends BlocRegistroEstado {
  BlocRegistroErrorState.desde(
    super.otro, {
    required this.errorMessage,
  }) : super.desde();

  /// Mensaje de error
  final MensajesDeErrorRegistro errorMessage;
}

/// Estado de error de los componentes de la pantalla registro, acompañado
/// por un mensaje de error
class BlocRegistroEstadoErrorTokenInvalido extends BlocRegistroEstado {
  BlocRegistroEstadoErrorTokenInvalido.desde(
    super.otro, {
    required this.errorMessage,
  }) : super.desde();

  /// Mensaje de error
  final MensajesDeErrorRegistro errorMessage;
}

/// Enum de mensajes de error
enum MensajesDeErrorRegistro {
  usuarioNoEncontrado,
  credencialesInvalidas;
}
