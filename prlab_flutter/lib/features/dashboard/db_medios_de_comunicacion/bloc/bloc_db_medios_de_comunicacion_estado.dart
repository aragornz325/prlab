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
    this.roles = const [],
    this.tipoDeMedio = const [],
  });

  BlocDbMediosDeComunicacionEstado.desde(
    BlocDbMediosDeComunicacionEstado otro, {
    List<Periodista>? periodistas,
    List<Filtro>? paises,
    List<Filtro>? ciudades,
    List<Filtro>? lenguajes,
    List<Filtro>? temas,
    List<Filtro>? roles,
    List<Filtro>? tipoDeMedio,
  }) : this._(
          periodistas: periodistas ?? otro.periodistas,
          paises: paises ?? otro.paises,
          ciudades: ciudades ?? otro.ciudades,
          lenguajes: lenguajes ?? otro.lenguajes,
          temas: temas ?? otro.temas,
          roles: roles ?? otro.roles,
          tipoDeMedio: tipoDeMedio ?? otro.tipoDeMedio,
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
  ///
  /// Los [Filtro]s que tenga el valor `estaSeleccionado` en true, se toman
  /// como parámetro para filtrar la lista de [Periodista]s por ese país.
  final List<Filtro> paises;

  /// Lista de ciudades por los cuales se pueden filtrar los periodistas.
  ///
  /// Los [Filtro]s que tenga el valor `estaSeleccionado` en true, se toman
  /// como parámetro para filtrar la lista de [Periodista]s por ese ciudad.
  final List<Filtro> ciudades;

  /// Lista de lenguajes por los cuales se pueden filtrar los periodistas.
  ///
  /// Los [Filtro]s que tenga el valor `estaSeleccionado` en true, se toman
  /// como parámetro para filtrar la lista de [Periodista]s por ese lenguaje.
  final List<Filtro> lenguajes;

  /// Lista de temas por los cuales se pueden filtrar los periodistas.
  ///
  /// Los [Filtro]s que tenga el valor `estaSeleccionado` en true, se toman
  /// como parámetro para filtrar la lista de [Periodista]s por ese tema.
  final List<Filtro> temas;

  /// Lista de roles por los cuales se pueden filtrar los periodistas.
  ///
  /// Los [Filtro]s que tenga el valor `estaSeleccionado` en true, se toman
  /// como parámetro para filtrar la lista de [Periodista]s por ese rol.
  final List<Filtro> roles;

  /// Lista de tipo de medios por los cuales se pueden filtrar los periodistas.
  ///
  /// Los [Filtro]s que tenga el valor `estaSeleccionado` en true, se toman
  /// como parámetro para filtrar la lista de [Periodista]s por ese tipo
  /// de medio.
  final List<Filtro> tipoDeMedio;

  /// Lista de [paises] convertida a una [Item] list para
  /// poder manipular los filtros desde el componente
  /// [TileConCheckBoxes].
  List<Item<Filtro>> get itemPaises => paises
      .map(
        (e) => Item(
          etiqueta: e.etiqueta,
          valor: e,
          estaSeleccionado: e.estaSeleccionado,
        ),
      )
      .toList();

  /// Lista de [ciudades] convertida a una [Item] list para
  /// poder manipular los filtros desde el componente
  /// [TileConCheckBoxes].
  List<Item<Filtro>> get itemCiudades => ciudades
      .map(
        (e) => Item(
          etiqueta: e.etiqueta,
          valor: e,
          estaSeleccionado: e.estaSeleccionado,
        ),
      )
      .toList();

  /// Lista de [lenguajes] convertida a una [Item] list para
  /// poder manipular los filtros desde el componente
  /// [TileConCheckBoxes].
  List<Item<Filtro>> get itemLenguajes => lenguajes
      .map(
        (e) => Item(
          etiqueta: e.etiqueta,
          valor: e,
          estaSeleccionado: e.estaSeleccionado,
        ),
      )
      .toList();

  /// Lista de [temas] convertida a una [Item] list para
  /// poder manipular los filtros desde el componente
  /// [TileConCheckBoxes].
  List<Item<Filtro>> get itemTemas => temas
      .map(
        (e) => Item(
          etiqueta: e.etiqueta,
          valor: e,
          estaSeleccionado: e.estaSeleccionado,
        ),
      )
      .toList();

  /// Lista de [roles] convertida a una [Item] list para
  /// poder manipular los filtros desde el componente
  /// [TileConCheckBoxes].
  List<Item<Filtro>> get itemRoles => roles
      .map(
        (e) => Item(
          etiqueta: e.etiqueta,
          valor: e,
          estaSeleccionado: e.estaSeleccionado,
        ),
      )
      .toList();

  /// Lista de [tipoDeMedio] convertida a una [Item] list para
  /// poder manipular los filtros desde el componente
  /// [TileConCheckBoxes].
  List<Item<Filtro>> get itemTipoDeMedio => tipoDeMedio
      .map(
        (e) => Item(
          etiqueta: e.etiqueta,
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

/// {@template BlocDbMediosDeComunicacionEstadoActualizandoFiltros}
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
    super.roles,
    super.tipoDeMedio,
  }) : super.desde();
}
