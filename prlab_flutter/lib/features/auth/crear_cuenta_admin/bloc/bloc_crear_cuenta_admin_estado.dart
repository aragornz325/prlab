part of 'bloc_crear_cuenta_admin.dart';

/// {@template BlocCrearCuentaAdminEstado}
/// Maneja los estados principales bloc Contiene el correo electrónico del
/// usuario al crear una cuenta de administrador y un valor booleano
/// que indica si el correo electrónico es válido.
/// {@endtemplate}
@immutable
class BlocCrearCuentaAdminEstado extends Equatable {
  /// {@macro BlocCrearCuentaAdminEstado}
  @override
  const BlocCrearCuentaAdminEstado._({
    this.email = '',
  });

  BlocCrearCuentaAdminEstado.desde(
    BlocCrearCuentaAdminEstado otro, {
    String? email,
  }) : this._(
          email: email ?? otro.email,
        );

  /// Email del Usuario al crear una cuenta Admin
  final String email;

  /// Booleano que indica si el correo/email esta bien
  bool get esEmailValido => ExpresionRegular.emailRegExp.hasMatch(email);

  @override
  List<Object> get props => [
        email,
      ];
}

/// {@template BlocCrearCuentaAdminEstadoInicial}
/// Se utiliza para indicar el estado inicial del bloc cuando se
/// crea por primera vez.
/// {@endtemplate}
class BlocCrearCuentaAdminEstadoInicial extends BlocCrearCuentaAdminEstado {
  /// {@macro BlocCrearCuentaAdminEstadoInicial}
  const BlocCrearCuentaAdminEstadoInicial() : super._();
}

/// {@template BlocCrearCuentaAdminEstadoExitoso}
/// State/estado `exitoso` de BlocCrearCuentaAdmin que indica
/// que salio correctamente
/// {@endtemplate}
class BlocCrearCuentaAdminEstadoExitoso extends BlocCrearCuentaAdminEstado {
  /// {@macro BlocCrearCuentaAdminEstadoExitoso}
  const BlocCrearCuentaAdminEstadoExitoso({
    required super.email,
  }) : super._();

  BlocCrearCuentaAdminEstadoExitoso.desde(super.otro) : super.desde();
}

/// {@template BlocCrearCuentaAdminEstadoExitosoEmailEnviado}
/// State/estado `exitoso` al enviar el email de BlocCrearCuentaAdmin
/// Este estado indica que el correo electrónico se ha enviado correctamente.
/// {@endtemplate}
class BlocCrearCuentaAdminEstadoExitosoEmailEnviado
    extends BlocCrearCuentaAdminEstado {
  /// {@macro BlocCrearCuentaAdminEstadoExitosoEmailEnviado}
  BlocCrearCuentaAdminEstadoExitosoEmailEnviado(super.otro) : super.desde();

  /// {@macro BlocCrearCuentaAdminEstadoExitosoEmailEnviado}
  BlocCrearCuentaAdminEstadoExitosoEmailEnviado.desde(super.otro, {super.email})
      : super.desde();
}

/// {@template BlocCrearCuentaAdminEstadoFallido}
/// State/estado de `error` de BlocCrearCuentaAdmin que indica que salio
/// mal o fallo
/// {@endtemplate}
class BlocCrearCuentaAdminEstadoFallido extends BlocCrearCuentaAdminEstado {
  /// {@macro BlocCrearCuentaAdminEstadoFallido}
  BlocCrearCuentaAdminEstadoFallido.desde(
    super.otro, {
    required this.errorMessage,
  }) : super.desde();

  /// Mensaje que se va a mostrar en caso de que sea error
  /// o de que algo haya salido mal.
  final BlocCrearCuentaAdminEstadoFallidoMensaje errorMessage;
}

/// {@template BlocCrearCuentaAdminEstadoCargando}
/// state/estado `cargando` de BlocCrearCuentaAdmin que normalmente indica
/// que esta cargando y muestra un circular progress indicator
/// {@endtemplate}
class BlocCrearCuentaAdminEstadoCargando extends BlocCrearCuentaAdminEstado {
  /// {@macro BlocCrearCuentaAdminEstadoCargando}
  BlocCrearCuentaAdminEstadoCargando.desde(super.otro) : super.desde();
}

/// tipos de errores a mostrar
enum BlocCrearCuentaAdminEstadoFallidoMensaje {
  errorToSendEmail,
  errorToChangeEmail,
}
