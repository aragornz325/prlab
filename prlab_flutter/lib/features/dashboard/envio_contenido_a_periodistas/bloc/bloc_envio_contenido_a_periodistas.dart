import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prlab_client/prlab_client.dart';

part 'bloc_envio_contenido_a_periodistas_estado.dart';
part 'bloc_envio_contenido_a_periodistas_evento.dart';

/// {@template BlocEnvioContenidoAPeriodistas}
/// Se encarga de manejar los procesos para el envio
/// de correos electronicos a periodistas con el contenido
/// de un mail personalizable y el link del comunicado de prensa
/// que se quiera dar a conocer.
/// {@endtemplate}
class BlocEnvioContenidoAPeriodistas extends Bloc<
    BlocEnvioContenidoAPeriodistasEvento,
    BlocEnvioContenidoAPeriodistasEstado> {
  /// {@macro BlocEnvioContenidoAPeriodistas}
  BlocEnvioContenidoAPeriodistas()
      : super(const EnvioContenidoAPeriodistasInicial()) {
    on<BlocEnvioContenidoAPeriodistasEventoActualizarEmail>(
      _actualizarEmail,
    );
  }

  /// Trata de actualizar lo escrito en el contenido y el asunto del
  /// correo electrónico dentro de la base de datos.
  Future<void> _actualizarEmail(
    BlocEnvioContenidoAPeriodistasEventoActualizarEmail event,
    Emitter<BlocEnvioContenidoAPeriodistasEstado> emit,
  ) async {
    try {
      // TODO(Andre): Completar cuando tenga endpoint del back
      // para actualizar el contenido y el asunto del mail.
      emit(EnvioContenidoAPeriodistasExitoso.desde(state));
    } catch (e) {
      emit(EnvioContenidoAPeriodistasExitoso.desde(state));
    }
  }
}
