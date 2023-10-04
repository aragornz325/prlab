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
    this.nombrePeriodista,
    this.nombreDeMedio,
  });

  final List<CategoriaFiltroSeleccionable>? paises;
  final List<CategoriaFiltroSeleccionable>? ciudades;
  final List<CategoriaFiltroSeleccionable>? lenguajes;
  final List<CategoriaFiltroSeleccionable>? temas;
  final List<CategoriaFiltroSeleccionable>? tipoDeMedio;
  final List<CategoriaFiltroSeleccionable>? roles;
  final String? nombrePeriodista;
  final String? nombreDeMedio;
}

/// {@template BlocDbMediosDeComunicacionEventoObtenerListadoDeFiltros}
/// {@endtemplate}
class BlocDbMediosDeComunicacionEventoObtenerListadoDeFiltros
    extends BlocDbMediosDeComunicacionEvento {
  /// {@macro BlocDbMediosDeComunicacionEventoObtenerListadoDeFiltros}
  BlocDbMediosDeComunicacionEventoObtenerListadoDeFiltros();
}
