part of 'bloc_db_medios_de_comunicacion.dart';

/// {@template BlocDbMediosDeComunicacionEstado}
/// Maneja los estados de los procesos que se manejan en
/// la página que tiene la lista con filtrados de los
/// periodistas.
/// {@endtemplate}
class BlocDbMediosDeComunicacionEstado {
  /// {@macro BlocDbMediosDeComunicacionEstado}
  BlocDbMediosDeComunicacionEstado._({
    this.periodistas = const [],
  });

  BlocDbMediosDeComunicacionEstado.desde(
    BlocDbMediosDeComunicacionEstado otro, {
    List<Periodista>? periodistas,
  }) : this._(
          periodistas: periodistas ?? otro.periodistas,
        );

  final List<Periodista> periodistas;
}

/// {@template BlocDbMediosDeComunicacionEstadoInicial}
/// Estado de inicio de [BlocDbMediosDeComunicacionEstado].
/// {@endtemplate}
class BlocDbMediosDeComunicacionEstadoInicial
    extends BlocDbMediosDeComunicacionEstado {
  /// {@macro BlocDbMediosDeComunicacionEstadoInicial}
  BlocDbMediosDeComunicacionEstadoInicial() : super._();
}

/// {@template BlocDbMediosDeComunicacionEstadoCargando}
/// Estado de espera/carga de [BlocDbMediosDeComunicacionEstado].
/// {@endtemplate}
class BlocDbMediosDeComunicacionEstadoCargando
    extends BlocDbMediosDeComunicacionEstado {
  /// {@macro BlocDbMediosDeComunicacionEstadoCargando}
  BlocDbMediosDeComunicacionEstadoCargando.desde(super.otro) : super.desde();
}

/// {@template BlocDbMediosDeComunicacionEstadoExitoso}
/// Estado de exito de [BlocDbMediosDeComunicacionEstado].
/// {@endtemplate}
class BlocDbMediosDeComunicacionEstadoExitoso
    extends BlocDbMediosDeComunicacionEstado {
  /// {@macro BlocDbMediosDeComunicacionEstadoExitoso}
  BlocDbMediosDeComunicacionEstadoExitoso.desde(
    super.otro, {
    required super.periodistas,
  }) : super.desde();
}

/// {@template BlocDbMediosDeComunicacionDetallePeriodistaEstadoExitoso}
/// Estado de exito de [BlocDbMediosDeComunicacionEstado] cuando se
/// trae de manera exitosa la información de un periodista en particular.
///
/// Esto ocurre cuando el usuario presiona en ver detalles del periodista
/// esto trae información mas en detalle del mismo.
/// {@endtemplate}
class BlocDbMediosDeComunicacionDetallePeriodistaEstadoExitoso
    extends BlocDbMediosDeComunicacionEstado {
  /// {@macro BlocDbMediosDeComunicacionDetallePeriodistaEstadoExitoso}
  BlocDbMediosDeComunicacionDetallePeriodistaEstadoExitoso.desde(
    super.otro,
    this.periodista,
  ) : super.desde();

  final Periodista periodista;
}

/// {@template BlocDbMediosDeComunicacionEstadoFallido}
/// Estado de fallo de [BlocDbMediosDeComunicacionEstado].
/// {@endtemplate}
class BlocDbMediosDeComunicacionEstadoFallido
    extends BlocDbMediosDeComunicacionEstado {
  /// {@macro BlocDbMediosDeComunicacionEstadoFallido}
  BlocDbMediosDeComunicacionEstadoFallido.desde(super.otro) : super.desde();
}
