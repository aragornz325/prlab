// ignore_for_file: avoid_unused_constructor_parameters

part of 'bloc_administracion_contenido.dart';

/// {@template BlocAdministracionContenidoEstado}
/// Maneja los estados principales bloc por ahora no hace nada
/// {@endtemplate}
@immutable
abstract class BlocAdministracionContenidoEstado extends Equatable {
  /// {@macro BlocAdministracionContenidoEstado}
  @override
  const BlocAdministracionContenidoEstado._();

  const BlocAdministracionContenidoEstado.desde(
    BlocAdministracionContenidoEstado otro,
  ) : this._();

  @override
  List<Object> get props => [];
}

/// {@template BlocAdministracionContenidoEstadoInicial}
/// Se utiliza para indicar el estado inicial del bloc cuando se crea una
/// instancia por primera vez.
/// {@endtemplate}
final class BlocAdministracionContenidoEstadoInicial
    extends BlocAdministracionContenidoEstado {
  /// {@macro BlocAdministracionContenidoEstadoInicial}
  const BlocAdministracionContenidoEstadoInicial() : super._();
}

/// {@template BlocAdministracionContenidoEstadoCargando}
/// state/estado `cargando` de BlocAdministracionContenido que
/// normalmente indica que esta cargando y muestra un circular
/// progress indicator
/// {@endtemplate}
final class BlocAdministracionContenidoEstadoCargando
    extends BlocAdministracionContenidoEstado {
  /// {@macro BlocAdministracionContenidoEstadoCargando}
  const BlocAdministracionContenidoEstadoCargando.desde(super.otro)
      : super.desde();
}

/// {@template BlocAdministracionContenidoEstadoExitoso}
/// State/estado `exitoso` al enviar el email de
/// BlocAdministracionContenido Este estado indica que el correo
/// electrónico se ha enviado correctamente.
/// {@endtemplate}
final class BlocAdministracionContenidoEstadoExitoso
    extends BlocAdministracionContenidoEstado {
  /// {@macro BlocAdministracionContenidoEstadoExitoso}
  const BlocAdministracionContenidoEstadoExitoso.desde(super.otro)
      : super.desde();
}

/// {@template BlocAdministracionContenidoEstadoFallido}
/// State/estado de `error` de BlocAdministracionContenido que indica que salio
/// mal o fallo
/// {@endtemplate}
final class BlocAdministracionContenidoEstadoFallido
    extends BlocAdministracionContenidoEstado {
  /// {@macro BlocAdministracionContenidoEstadoFallido}
  const BlocAdministracionContenidoEstadoFallido.desde(
    super.otro, {
    required this.errorMessage,
  }) : super.desde();

  /// Mensaje que se va a mostrar en caso de que sea error
  /// o de que algo haya salido mal.
  final String errorMessage;
}
