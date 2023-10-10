part of 'bloc_envio_contenido_a_periodistas.dart';

/// {@template BlocEnvioContenidoAPeriodistasEvento}
/// Clase padre de los eventos de [BlocEnvioContenidoAPeriodistas].
/// {@endtemplate}
sealed class BlocEnvioContenidoAPeriodistasEvento extends Equatable {
  /// {@macro BlocEnvioContenidoAPeriodistasEvento}
  const BlocEnvioContenidoAPeriodistasEvento();

  @override
  List<Object> get props => [];
}

/// {@template BlocEnvioContenidoAPeriodistasEventoActualizarEmail}
/// Actualiza el contenido del correo electronico que se este editando tanto
/// en el estado como en la tabla de la base de datos.
/// {@endtemplate}
final class BlocEnvioContenidoAPeriodistasEventoActualizarEmail
    extends BlocEnvioContenidoAPeriodistasEvento {
  /// {@macro BlocEnvioContenidoAPeriodistasEventoActualizarEmail}
  const BlocEnvioContenidoAPeriodistasEventoActualizarEmail({
    this.contenidoHtmlEmail,
    this.asunto,
  });

  /// Contenido del mail que se enviara a los destinatatios
  /// seleccionados en la lista `periodistas`
  final String? contenidoHtmlEmail;

  /// Asunto/Título del correo electrónico.
  final String? asunto;
}
