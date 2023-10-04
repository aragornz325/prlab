part of 'bloc_lista_articulos_y_recortes.dart';

/// {@template BlocListaArticulosYRecortesEvento}
/// Que manejara el Filtrado de la lista de artículos
/// {@endtemplate}
@immutable
abstract class BlocListaArticulosYRecortesEvento extends Equatable {
  /// {@macro BlocListaArticulosYRecortesEvento}
  const BlocListaArticulosYRecortesEvento();

  @override
  List<Object> get props => [];
}

/// {@template BlocListaArticulosYRecortesEventoFiltrar}
/// Envia al email una invitación para que se cree una nueva cuenta,
/// creada por el administrador
/// {@endtemplate}
class BlocListaArticulosYRecortesEventoFiltrar
    extends BlocListaArticulosYRecortesEvento {
  /// {@macro BlocListaArticulosYRecortesEventoFiltrar}
  @override
  const BlocListaArticulosYRecortesEventoFiltrar({
    required this.sinFiltro,
    this.idMarca,
  });

  // TODO(anyone): agregar el tipo de filtrado sea por
  // un enum u otro tipo
  final bool sinFiltro;

  /// Id de la marca a filtrar por esta
  final int? idMarca;
}

/// {@template BlocListaArticulosYRecortesEventoTraerArticulos}
/// Envia al email una invitación para que se cree una nueva cuenta,
/// creada por el administrador
/// {@endtemplate}
class BlocListaArticulosYRecortesEventoTraerArticulos
    extends BlocListaArticulosYRecortesEvento {
  /// {@macro BlocListaArticulosYRecortesEventoTraerArticulos}
  @override
  const BlocListaArticulosYRecortesEventoTraerArticulos({
    this.idMarca,
  });

  final int? idMarca;
}

/// {@template BlocListaArticulosYRecortesEventoSeleccion}
/// Seleccionar entre Recortes y Articulos cambia el index seleccionado y
/// muestra una vista distinta.
/// {@endtemplate}
class BlocListaArticulosYRecortesEventoSeleccion
    extends BlocListaArticulosYRecortesEvento {
  /// {@macro BlocListaArticulosYRecortesEventoSeleccion}
  @override
  const BlocListaArticulosYRecortesEventoSeleccion({
    required this.index,
  });

  /// Index a cambiar para alternar distintas vistas.
  final int index;
}

/// {@template BlocListaArticulosYRecortesEventoFiltradoPorEstado}
/// Cambia los valores de los filtrados entre los filtrados por Estados/Status
/// para filtrar por cierto Estado, borrador, completo o comentario.
/// {@endtemplate}
class BlocListaArticulosYRecortesEventoFiltradoPorEstado
    extends BlocListaArticulosYRecortesEvento {
  /// {@macro BlocListaArticulosYRecortesEventoFiltradoPorEstado}
  @override
  const BlocListaArticulosYRecortesEventoFiltradoPorEstado({
    required this.estadoEntregables,
  });

  final List<StatusEntregables> estadoEntregables;
}

/// {@template BlocListaArticulosYRecortesEventoEliminarArticulo}
/// Elimina un articulo en específico
/// {@endtemplate}
class BlocListaArticulosYRecortesEventoEliminarArticulo
    extends BlocListaArticulosYRecortesEvento {
  /// {@macro BlocListaArticulosYRecortesEventoEliminarArticulo}
  @override
  const BlocListaArticulosYRecortesEventoEliminarArticulo(
    this.idArticulo,
  );

  /// id del articulo del cual va a eliminarse
  final int idArticulo;
}

/// {@template BlocListaArticulosYRecortesEventoFiltrarBuscador}
/// Filtra por el nombre del articulo y devuelve una lista de todos los que
/// coincidan con ese nombre/titulo
/// {@endtemplate}
class BlocListaArticulosYRecortesEventoFiltrarBuscador
    extends BlocListaArticulosYRecortesEvento {
  /// {@macro BlocListaArticulosYRecortesEventoFiltrarBuscador}
  @override
  const BlocListaArticulosYRecortesEventoFiltrarBuscador({
    this.nombreDelArticuloAFiltrar,
  });

  /// nombre del articulo a filtrar por ese nombre/titulo
  final String? nombreDelArticuloAFiltrar;
}
