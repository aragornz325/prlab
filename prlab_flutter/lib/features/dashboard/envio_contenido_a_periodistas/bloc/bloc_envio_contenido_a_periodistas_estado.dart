part of 'bloc_envio_contenido_a_periodistas.dart';

/// {@template BlocEnvioContenidoAPeriodistasEstado}
/// Maneja los estados de los procesos que se manejan en
/// la página de envio de comunicados de prensa a periodistas,
/// la selección de destinatarios, edición de mail y envió del mismo.
/// {@endtemplate}
sealed class BlocEnvioContenidoAPeriodistasEstado extends Equatable {
  /// {@macro BlocEnvioContenidoAPeriodistasEstado}
  const BlocEnvioContenidoAPeriodistasEstado._({
    this.contenidoHtmlEmail = '',
    this.periodistas = const [],
  });

  BlocEnvioContenidoAPeriodistasEstado.desde(
    BlocEnvioContenidoAPeriodistasEstado otro, {
    String? contenidoHtmlEmail,
  }) : this._(
          contenidoHtmlEmail: contenidoHtmlEmail ?? otro.contenidoHtmlEmail,
        );

  /// Contenido del mail que se enviara a los destinatatios
  /// seleccionados en la lista [periodistas]
  final String contenidoHtmlEmail;

  /// Lista de destinatarios a los que se les va a enviar el
  /// mail con el [contenidoHtmlEmail] y el link donde se ha
  /// hosteado el comunicado de prensa.
  final List<Periodista> periodistas;

  @override
  List<Object> get props => [
        contenidoHtmlEmail,
      ];
}

/// {@template EnvioContenidoAPeriodistasInicial}
/// Estado de inicio de [BlocEnvioContenidoAPeriodistasEstado].
/// {@endtemplate}
final class EnvioContenidoAPeriodistasInicial
    extends BlocEnvioContenidoAPeriodistasEstado {
  /// {@macro EnvioContenidoAPeriodistasInicial}
  const EnvioContenidoAPeriodistasInicial() : super._();
}

/// {@template EnvioContenidoAPeriodistasCargando}
/// Estado de espera/carga de [BlocEnvioContenidoAPeriodistasEstado].
/// {@endtemplate}
final class EnvioContenidoAPeriodistasCargando
    extends BlocEnvioContenidoAPeriodistasEstado {
  /// {@macro EnvioContenidoAPeriodistasCargando}
  EnvioContenidoAPeriodistasCargando.desde(super.otro) : super.desde();
}

/// {@template EnvioContenidoAPeriodistasExitoso}
/// Estado de exito de [BlocEnvioContenidoAPeriodistasEstado].
/// {@endtemplate}
final class EnvioContenidoAPeriodistasExitoso
    extends BlocEnvioContenidoAPeriodistasEstado {
  /// {@macro EnvioContenidoAPeriodistasExitoso}
  EnvioContenidoAPeriodistasExitoso.desde(super.otro) : super.desde();
}

/// {@template EnvioContenidoAPeriodistasFallido}
/// Estado de exito de [BlocEnvioContenidoAPeriodistasEstado].
/// {@endtemplate}
final class EnvioContenidoAPeriodistasFallido
    extends BlocEnvioContenidoAPeriodistasEstado {
  /// {@macro EnvioContenidoAPeriodistasFallido}
  EnvioContenidoAPeriodistasFallido.desde(super.otro) : super.desde();
}
