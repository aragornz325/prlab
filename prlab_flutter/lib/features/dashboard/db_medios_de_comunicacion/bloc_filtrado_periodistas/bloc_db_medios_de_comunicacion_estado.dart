part of 'bloc_db_medios_de_comunicacion.dart';

/// {@template BlocDbMediosDeComunicacionEstado}
/// Maneja los estados de los procesos que se manejan en
/// la página que tiene la lista con filtrados de los
/// periodistas y el popup con los detalles de un periodista
/// en especifico (se encuentra dentro de la misma página).
/// {@endtemplate}
class BlocDbMediosDeComunicacionEstado {
  /// {@macro BlocDbMediosDeComunicacionEstado}
  BlocDbMediosDeComunicacionEstado._({
    this.periodistas = const [],
    this.paises = const [],
    this.ciudades = const [],
    this.lenguajes = const [],
    this.temas = const [],
    this.puestos = const [],
    this.tipoDeMedio = const [],
    this.nombrePeriodista = '',
    this.nombreDeMedio = '',
  });

  BlocDbMediosDeComunicacionEstado.desde(
    BlocDbMediosDeComunicacionEstado otro, {
    List<Periodista>? periodistas,
    List<CategoriaFiltroSeleccionable>? paises,
    List<CategoriaFiltroSeleccionable>? ciudades,
    List<CategoriaFiltroSeleccionable>? lenguajes,
    List<CategoriaFiltroSeleccionable>? temas,
    List<CategoriaFiltroSeleccionable>? puestos,
    List<CategoriaFiltroSeleccionable>? tipoDeMedio,
    String? nombrePeriodista,
    String? nombreDeMedio,
  }) : this._(
          periodistas: periodistas ?? otro.periodistas,
          paises: paises ?? otro.paises,
          ciudades: ciudades ?? otro.ciudades,
          lenguajes: lenguajes ?? otro.lenguajes,
          temas: temas ?? otro.temas,
          puestos: puestos ?? otro.puestos,
          tipoDeMedio: tipoDeMedio ?? otro.tipoDeMedio,
          nombrePeriodista: nombrePeriodista ?? otro.nombrePeriodista,
          nombreDeMedio: nombreDeMedio ?? otro.nombreDeMedio,
        );

  ///  Representa la `lista de periodistas` que
  /// actualmente se muestran o filtran en la interfaz de usuario.
  /// Se utiliza para almacenar y gestionar
  /// los datos relacionados con los periodistas en el estado.
  final List<Periodista> periodistas;

  // ----- Lista de filtros -----
  // Los filtros son una lista de algún tema en particular
  // para agrupar una cierta cantidad de `Periodista`(s) según
  // si cumplen con las características de dicho filtro.
  // Ej:
  // La lista de país tiene seleccionada `Argentina` para filtrar
  // los periodista, siendo así se mostraría una lista de periodistas
  // que sean de la localidad.

  /// Lista de paises por los cuales se pueden filtrar los periodistas.
  /// Los [CategoriaFiltroSeleccionable]s que tenga el valor `estaSeleccionado` en
  /// true, se toman como parámetro para filtrar la lista de [Periodista]s por
  /// ese país.
  final List<CategoriaFiltroSeleccionable> paises;

  /// Lista de ciudades por los cuales se pueden filtrar los periodistas.
  /// Los [CategoriaFiltroSeleccionable]s que tenga el valor `estaSeleccionado` en
  /// true, se toman como parámetro para filtrar la lista de [Periodista]s por
  /// ese ciudad.
  final List<CategoriaFiltroSeleccionable> ciudades;

  /// Lista de lenguajes por los cuales se pueden filtrar los periodistas.
  /// Los [CategoriaFiltroSeleccionable]s que tenga el valor `estaSeleccionado` en
  /// true, se toman como parámetro para filtrar la lista de [Periodista]s por
  /// ese lenguaje.
  final List<CategoriaFiltroSeleccionable> lenguajes;

  /// Lista de temas por los cuales se pueden filtrar los periodistas.
  /// Los [CategoriaFiltroSeleccionable]s que tenga el valor `estaSeleccionado` en
  /// true, se toman como parámetro para filtrar la lista de [Periodista]s por
  /// ese tema.
  final List<CategoriaFiltroSeleccionable> temas;

  /// Lista de roles por los cuales se pueden filtrar los periodistas.
  /// Los [CategoriaFiltroSeleccionable]s que tenga el valor `estaSeleccionado` en
  /// true, se toman como parámetro para filtrar la lista de [Periodista]s por
  /// ese rol.
  final List<CategoriaFiltroSeleccionable> puestos;

  /// Lista de tipo de medios por los cuales se pueden filtrar los periodistas.
  /// Los [CategoriaFiltroSeleccionable]s que tenga el valor `estaSeleccionado` en
  /// true, se toman como parámetro para filtrar la lista de [Periodista]s por
  /// ese tipo de medio.
  final List<CategoriaFiltroSeleccionable> tipoDeMedio;

  /// Nombre del periodista a filtrar
  final String nombrePeriodista;

  /// Nombre del medio a filtrar
  final String nombreDeMedio;

  /// Devuelve `true` si el estado es
  /// [BlocDbMediosDeComunicacionEstadoActualizandoFiltros]
  bool get estaActualizandoFiltros =>
      this is BlocDbMediosDeComunicacionEstadoActualizandoFiltros;

  /// Devuelve `true` si el estado es
  /// [BlocDbMediosDeComunicacionEstadoCargando]
  bool get estaCargando => this is BlocDbMediosDeComunicacionEstadoCargando;

  /// Lista de [paises] convertida a una [Item] list para
  /// poder manipular los filtros desde el componente
  /// [TileConCheckBoxes].
  List<Item<CategoriaFiltroSeleccionable>> get itemPaises => paises
      .map(
        (e) => Item(
          nombre: '${e.nombre} (${e.recuento})',
          valor: e,
          estaSeleccionado: e.estaSeleccionado,
        ),
      )
      .toList();

  /// Lista de [ciudades] convertida a una [Item] list para
  /// poder manipular los filtros desde el componente
  /// [TileConCheckBoxes].
  List<Item<CategoriaFiltroSeleccionable>> get itemCiudades => ciudades
      .map(
        (e) => Item(
          nombre: '${e.nombre} (${e.recuento})',
          valor: e,
          estaSeleccionado: e.estaSeleccionado,
        ),
      )
      .toList();

  /// Lista de [lenguajes] convertida a una [Item] list para
  /// poder manipular los filtros desde el componente
  /// [TileConCheckBoxes].
  List<Item<CategoriaFiltroSeleccionable>> get itemLenguajes => lenguajes
      .map(
        (e) => Item(
          nombre: '${e.nombre} (${e.recuento})',
          valor: e,
          estaSeleccionado: e.estaSeleccionado,
        ),
      )
      .toList();

  /// Lista de [temas] convertida a una [Item] list para
  /// poder manipular los filtros desde el componente
  /// [TileConCheckBoxes].
  List<Item<CategoriaFiltroSeleccionable>> get itemTemas => temas
      .map(
        (e) => Item(
          nombre: '${e.nombre} ${e.recuento}',
          valor: e,
          estaSeleccionado: e.estaSeleccionado,
        ),
      )
      .toList();

  /// Lista de [puestos] convertida a una [Item] list para
  /// poder manipular los filtros desde el componente
  /// [TileConCheckBoxes].
  List<Item<CategoriaFiltroSeleccionable>> get itemRoles => puestos
      .map(
        (e) => Item(
          nombre: '${e.nombre} (${e.recuento})',
          valor: e,
          estaSeleccionado: e.estaSeleccionado,
        ),
      )
      .toList();

  /// Lista de [tipoDeMedio] convertida a una [Item] list para
  /// poder manipular los filtros desde el componente
  /// [TileConCheckBoxes].
  List<Item<CategoriaFiltroSeleccionable>> get itemTipoDeMedio => tipoDeMedio
      .map(
        (e) => Item(
          nombre: '${e.nombre} (${e.recuento})',
          valor: e,
          estaSeleccionado: e.estaSeleccionado,
        ),
      )
      .toList();
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

/// {@template BlocDbMediosDeComunicacionEstadoCargandoFiltros}
/// Estado de espera cuando se actualizan los filtros
/// [BlocDbMediosDeComunicacionEstado].
/// {@endtemplate}
class BlocDbMediosDeComunicacionEstadoCargandoFiltros
    extends BlocDbMediosDeComunicacionEstado {
  /// {@macro BlocDbMediosDeComunicacionEstadoCargandoFiltros}
  BlocDbMediosDeComunicacionEstadoCargandoFiltros.desde(super.otro)
      : super.desde();
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

/// {@template BlocDbMediosDeComunicacionEstadoFallido}
/// Estado de fallo de [BlocDbMediosDeComunicacionEstado].
/// {@endtemplate}
class BlocDbMediosDeComunicacionEstadoFallido
    extends BlocDbMediosDeComunicacionEstado {
  /// {@macro BlocDbMediosDeComunicacionEstadoFallido}
  BlocDbMediosDeComunicacionEstadoFallido.desde(super.otro) : super.desde();
}

/// {@template BlocDbMediosDeComunicacionEstadoActualizandoFiltros}
/// Se emite cada vez que se actualiza un filtro ya sea agregar o eliminar uno
/// {@endtemplate}
class BlocDbMediosDeComunicacionEstadoActualizandoFiltros
    extends BlocDbMediosDeComunicacionEstado {
  /// {@macro BlocDbMediosDeComunicacionEstadoActualizandoFiltros}
  BlocDbMediosDeComunicacionEstadoActualizandoFiltros.desde(
    super.otro, {
    super.paises,
    super.ciudades,
    super.lenguajes,
    super.temas,
    super.puestos,
    super.tipoDeMedio,
    super.nombrePeriodista,
    super.nombreDeMedio,
  }) : super.desde();
}

/// {@template BlocDbMediosDeComunicacionEstadoTrayendoFiltros}
/// Se emite cuando se estan trayendo del back, sea porque se inicio la pagina
/// o porque se actualizaron los filtros
/// {@endtemplate}
class BlocDbMediosDeComunicacionEstadoTrayendoFiltros
    extends BlocDbMediosDeComunicacionEstado {
  /// {@macro BlocDbMediosDeComunicacionEstadoTrayendoFiltros}
  BlocDbMediosDeComunicacionEstadoTrayendoFiltros.desde(
    super.otro, {
    super.paises,
    super.ciudades,
    super.lenguajes,
    super.temas,
    super.puestos,
    super.tipoDeMedio,
    super.nombrePeriodista,
    super.nombreDeMedio,
  }) : super.desde();
}
