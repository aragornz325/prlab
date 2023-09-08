part of 'bloc_db_medios_de_comunicacion.dart';

/// {@template BlocDbMediosDeComunicacionEvento}
/// Clase padre de los eventos de [BlocDbMediosDeComunicacion].
/// {@endtemplate}
abstract class BlocDbMediosDeComunicacionEvento {}

/// {@template BlocDbMediosDeComunicacionEventoObtenerPeriodistas}
/// Trata de obtener la lista de periodistas que estan en la base
/// de datos.
/// {@macro BlocDbMediosDeComunicacionEventoObtenerPeriodistas}
class BlocDbMediosDeComunicacionEventoObtenerPeriodistas
    extends BlocDbMediosDeComunicacionEvento {}

/// {@template BlocDbMediosDeComunicacionEventoObtenerDetallePeriodista}
/// Trata información mas detallada de un periodista.
/// {@macro BlocDbMediosDeComunicacionEventoObtenerPeriodistas}
class BlocDbMediosDeComunicacionEventoObtenerDetallePeriodista
    extends BlocDbMediosDeComunicacionEvento {
  /// {@macro BlocDbMediosDeComunicacionEventoObtenerDetallePeriodista}
  BlocDbMediosDeComunicacionEventoObtenerDetallePeriodista(
    this.idPeriodista,
  );

  /// El identificador de un periodista, sirve para obtener información más
  /// detallada del mismo dentro de la base de datos.
  final int idPeriodista;
}
