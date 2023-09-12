part of 'bloc_db_medios_de_comunicacion.dart';

/// {@template BlocDbMediosDeComunicacionEvento}
/// Clase padre de los eventos de [BlocDbMediosDeComunicacion].
/// {@endtemplate}
abstract class BlocDbMediosDeComunicacionEvento {}

/// {@template BlocDbMediosDeComunicacionEventoObtenerPeriodistas}
/// Trata de obtener la lista de periodistas que estan en la base
/// de datos.
/// {@endtemplate}
class BlocDbMediosDeComunicacionEventoObtenerPeriodistas
    extends BlocDbMediosDeComunicacionEvento {
  /// {@macro BlocDbMediosDeComunicacionEventoObtenerPeriodistas}
  BlocDbMediosDeComunicacionEventoObtenerPeriodistas();
}

/// {@template BlocDbMediosDeComunicacionEventoObtenerDetallePeriodista}
/// Trata información mas detallada de un periodista.
/// {@endtemplate}
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

/// {@template BlocDbMediosDeComunicacionEventoObtenerArticulosDelPeriodista}
/// Trata de obtener la lista de articulos ya publicados por un periodista
/// a traves del [idPeriodista].
/// {@endtemplate}
class BlocDbMediosDeComunicacionEventoObtenerArticulosDelPeriodista
    extends BlocDbMediosDeComunicacionEvento {
  /// {@macro BlocDbMediosDeComunicacionEventoObtenerArticulosDelPeriodista}
  BlocDbMediosDeComunicacionEventoObtenerArticulosDelPeriodista(
    this.idPeriodista,
  );

  /// El identificador de un periodista, sirve para obtener la lista
  /// de articulos vinculados a este periodista.
  final String idPeriodista;
}

/// {@template BlocDbMediosDeComunicacionEventoObtenerArticulosDelPeriodista}
/// {@endtemplate}
class BlocDbMediosDeComunicacionEventoActualizarFiltros
    extends BlocDbMediosDeComunicacionEvento {
  /// {@macro BlocDbMediosDeComunicacionEventoObtenerArticulosDelPeriodista}
  BlocDbMediosDeComunicacionEventoActualizarFiltros({
    this.paises,
    this.ciudades,
    this.lenguajes,
    this.temas,
    this.roles,
    this.tipoDeMedio,
  });

  final List<Filtro>? paises;
  final List<Filtro>? ciudades;
  final List<Filtro>? lenguajes;
  final List<Filtro>? temas;
  final List<Filtro>? tipoDeMedio;
  final List<Filtro>? roles;
}

/// {@template BlocDbMediosDeComunicacionEventoObtenerListadoDeFiltros}
/// {@endtemplate}
class BlocDbMediosDeComunicacionEventoObtenerListadoDeFiltros
    extends BlocDbMediosDeComunicacionEvento {
  /// {@macro BlocDbMediosDeComunicacionEventoObtenerListadoDeFiltros}
  BlocDbMediosDeComunicacionEventoObtenerListadoDeFiltros();
}
