import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// TODO(Seba): Agregar docu.
@immutable
class BlocRegistroEstado extends Equatable {
  const BlocRegistroEstado._({
    this.terminosAceptados = false,
    this.passwordConfirmada = '',
    this.email = '',
    this.password = '',
  });

  BlocRegistroEstado.desde(
    BlocRegistroEstado otro, {
    bool? terminosAceptados,
    String? email,
    String? password,
    String? passwordConfirmada,
  }) : this._(
          terminosAceptados: terminosAceptados ?? otro.terminosAceptados,
          passwordConfirmada: passwordConfirmada ?? otro.passwordConfirmada,
          email: email ?? otro.email,
          password: password ?? otro.password,
        );

  final bool terminosAceptados;

  final String email;

  final String password;

  final String passwordConfirmada;

  bool get isEstadoInicial => this is BlocRegistroEstadoInicial;

  bool get isEstadoExitoso => this is BlocRegistroEstadoExitoso;

  bool get isEstadoCargando => this is BlocRegistroEstadoCargando;

  /// Getter del BlocRegistro para ver si esta en estado inicial,
  /// error o cargando.
  bool get estaEnEstadoDeValidacion =>
      this is BlocRegistroEstadoErrorTokenInvalido ||
      this is BlocRegistroEstadoInicial ||
      this is BlocRegistroEstadoCargandoValidacionDeToken;

  @override
  List<Object> get props => [
        terminosAceptados,
        email,
        password,
        passwordConfirmada,
      ];

  bool get estaCompletoElFormulario =>
      terminosAceptados &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      passwordConfirmada.isNotEmpty;
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

/// Estado que indica que el usuario fue registrado exitosamente

class BlocRegistroEstadoUsuarioRegistradoConExito extends BlocRegistroEstado {
  BlocRegistroEstadoUsuarioRegistradoConExito.desde(super.otro) : super.desde();
}

/// Estado de carga  de los componentes de la pantalla registro, para mostrar un
/// estado de carga, de espera, hacerle saber al usuario que tiene que esperar.
class BlocRegistroEstadoCargando extends BlocRegistroEstado {
  BlocRegistroEstadoCargando.desde(super.otro) : super.desde();
}

/// Estado de carga de los componentes de la pantalla registro, especificamente
/// para validar token, para mostrar un estado de carga, de espera,
/// hacerle saber al usuario que tiene que esperar.
class BlocRegistroEstadoCargandoValidacionDeToken extends BlocRegistroEstado {
  BlocRegistroEstadoCargandoValidacionDeToken.desde(super.otro) : super.desde();
}

/// Estado de error de los componentes de la pantalla registro, acompañado
/// por un mensaje de error
class BlocRegistroEstadoError extends BlocRegistroEstado {
  BlocRegistroEstadoError.desde(
    super.otro, {
    required this.errorMessage,
  }) : super.desde();

  /// Mensaje de error
  final MensajesDeErrorRegistro errorMessage;
}

/// Estado de error de los componentes de la pantalla registro luego de validar
/// el token, acompañado por un alert dialog que muestra un mensaje de error.
class BlocRegistroEstadoErrorTokenInvalido extends BlocRegistroEstado {
  BlocRegistroEstadoErrorTokenInvalido.desde(
    super.otro, {
    required this.errorMessage,
  }) : super.desde();

  /// Mensaje de error
  final MensajesDeErrorRegistro errorMessage;
}

/// {@template bloc_registro_estado_recolectando_datos}
/// Estado de recolecta del [BlocRegistro]
/// A medida que el usuario va completando el registro
/// el estado se va a ir actualizando con la nueva
/// información completada en los campos de texto.
/// {@endtemplate}
class BlocRegistroEstadoRecolectandoDatos extends BlocRegistroEstado {
  /// {@macro bloc_registro_estado_recolectando_datos}
  BlocRegistroEstadoRecolectandoDatos.desde(
    super.otro, {
    super.email,
    super.password,
    super.passwordConfirmada,
    super.terminosAceptados,
  }) : super.desde();
}

/// Enum de mensajes de error
enum MensajesDeErrorRegistro {
  usuarioNoEncontrado,
  credencialesInvalidas;
}
