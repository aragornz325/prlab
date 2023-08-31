// ignore_for_file: comment_references

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// {@template BlocRegistroEstado}
/// Maneja el formulario de información del usuario
/// en el momento que el usuario se esta registrando, validando token y
/// recolectando datos.
/// {@endtemplate}
@immutable
class BlocRegistroEstado extends Equatable {
  /// {@macro BlocRegistroEstado}
  const BlocRegistroEstado._({
    this.terminosAceptados = false,
    this.passwordConfirmada = '',
    this.email = '',
    this.password = '',
    this.idUsuario = 0,
  });

  BlocRegistroEstado.desde(
    BlocRegistroEstado otro, {
    bool? terminosAceptados,
    String? email,
    String? password,
    String? passwordConfirmada,
    int? idUsuario,
  }) : this._(
          terminosAceptados: terminosAceptados ?? otro.terminosAceptados,
          passwordConfirmada: passwordConfirmada ?? otro.passwordConfirmada,
          email: email ?? otro.email,
          password: password ?? otro.password,
          idUsuario: idUsuario ?? otro.idUsuario,
        );

  final bool terminosAceptados;

  final String email;

  final String password;

  final String passwordConfirmada;

  final int idUsuario;

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
  /// {@macro BlocRegistroEstadoInicial}
  const BlocRegistroEstadoInicial() : super._();
}

/// Estado exitoso de los componentes de la pantalla login
class BlocRegistroEstadoExitoso extends BlocRegistroEstado {
  /// {@macro BlocRegistroEstadoExitoso}
  BlocRegistroEstadoExitoso.desde(
    super.otro, {
    super.terminosAceptados,
    super.email,
    super.password,
    super.idUsuario,
  }) : super.desde();
}

/// Estado que indica que el usuario fue registrado exitosamente

class BlocRegistroEstadoUsuarioRegistradoConExito extends BlocRegistroEstado {
  /// {@macro BlocRegistroEstadoUsuarioRegistradoConExito}
  BlocRegistroEstadoUsuarioRegistradoConExito.desde(
    super.otro, {
    super.idUsuario,
  }) : super.desde();
}

/// Estado de carga  de los componentes de la pantalla registro, para mostrar un
/// estado de carga, de espera, hacerle saber al usuario que tiene que esperar.
class BlocRegistroEstadoCargando extends BlocRegistroEstado {
  /// {@macro BlocRegistroEstadoCargando}
  BlocRegistroEstadoCargando.desde(super.otro) : super.desde();
}

/// Estado de carga de los componentes de la pantalla registro, especificamente
/// para validar token, para mostrar un estado de carga, de espera,
/// hacerle saber al usuario que tiene que esperar.
class BlocRegistroEstadoCargandoValidacionDeToken extends BlocRegistroEstado {
  /// {@macro BlocRegistroEstadoCargandoValidacionDeToken}
  BlocRegistroEstadoCargandoValidacionDeToken.desde(super.otro) : super.desde();
}

/// Estado de error de los componentes de la pantalla registro, acompañado
/// por un mensaje de error
class BlocRegistroEstadoError extends BlocRegistroEstado {
  /// {@macro BlocRegistroEstadoError}
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
  /// {@macro BlocRegistroEstadoErrorTokenInvalido}
  BlocRegistroEstadoErrorTokenInvalido.desde(
    super.otro, {
    required this.errorMessage,
  }) : super.desde();

  /// Mensaje de error
  final MensajesDeErrorRegistro errorMessage;
}

/// {@template BlocRegistroEstadoRecolectandoDatos}
/// Estado de recolecta del [BlocRegistro]
/// A medida que el usuario va completando el registro
/// el estado se va a ir actualizando con la nueva
/// información completada en los campos de texto.
/// {@endtemplate}
class BlocRegistroEstadoRecolectandoDatos extends BlocRegistroEstado {
  /// {@macro BlocRegistroEstadoRecolectandoDatos}
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
