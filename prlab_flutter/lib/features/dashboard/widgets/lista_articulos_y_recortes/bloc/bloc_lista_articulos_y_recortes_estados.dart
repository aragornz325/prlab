part of 'bloc_lista_articulos_y_recortes.dart';

/// {@template BlocListaArticulosYRecortesEstado}
/// Maneja el estado de la lista de los articulos solamente la filtra y la
/// obtiene por medio del [BlocListaArticulosYRecortesEventoFiltrar]
/// {@endtemplate}
@immutable
abstract class BlocListaArticulosYRecortesEstado extends Equatable {
  /// {@macro BlocListaArticulosYRecortesEstado}
  @override
  const BlocListaArticulosYRecortesEstado._({
    this.articulos = const [],
    this.articulosFiltrados = const [],
    this.index = 0,
    this.estadoEntregables = const [],
    this.nombreDelArticuloAFiltrar = '',
  });

  BlocListaArticulosYRecortesEstado.desde(
    BlocListaArticulosYRecortesEstado otro, {
    List<EntregableArticulo>? articulos,
    List<EntregableArticulo>? articulosFiltrados,
    List<StEntregables>? estadoEntregables,
    String? nombreDelArticuloAFiltrar,
    int? index,
  }) : this._(
          articulos: articulos ?? otro.articulos,
          index: index ?? otro.index,
          articulosFiltrados: articulosFiltrados ?? otro.articulosFiltrados,
          estadoEntregables: estadoEntregables ?? otro.estadoEntregables,
          nombreDelArticuloAFiltrar:
              nombreDelArticuloAFiltrar ?? otro.nombreDelArticuloAFiltrar,
        );

  /// Lista de los articulos
  final List<EntregableArticulo> articulos;

  /// Lista de los articulos para filtrar
  final List<EntregableArticulo> articulosFiltrados;

  /// Index de la vista seleccionada
  final int index;

  /// Nombre del articulo con el cual se van a filtrar
  final String nombreDelArticuloAFiltrar;

  /// lista de estados en los que el articulo pueda manejar y cambiar,también
  /// se puede filtrar por dichos estados
  final List<StEntregables> estadoEntregables;

  /// Si es Articulos
  bool get esArticulos => index == 0;

  /// Si es Recortes
  bool get esRecortes => index == 1;

  @override
  List<Object> get props => [
        articulos,
        articulosFiltrados,
        index,
        estadoEntregables,
      ];
}

/// {@template BlocListaArticulosYRecortesEstadoInicial}
/// Se utiliza para indicar el estado inicial del bloc cuando se crea una
/// instancia por primera vez.
/// {@endtemplate}
class BlocListaArticulosYRecortesEstadoInicial
    extends BlocListaArticulosYRecortesEstado {
  /// {@macro BlocListaArticulosYRecortesEstadoInicial}
  const BlocListaArticulosYRecortesEstadoInicial() : super._();
}

/// {@template BlocListaArticulosYRecortesEstadoCargando}
/// state/estado `cargando` de BlocAdministracionContenido que
/// normalmente indica que esta cargando y muestra un circular
/// progress indicator
/// {@endtemplate}
final class BlocListaArticulosYRecortesEstadoCargando
    extends BlocListaArticulosYRecortesEstado {
  /// {@macro BlocListaArticulosYRecortesEstadoCargando}
  BlocListaArticulosYRecortesEstadoCargando.desde(super.otro) : super.desde();
}

/// {@template BlocListaArticulosYRecortesEstadoExitoso}
/// State/estado `exitoso` al enviar el email de
/// BlocAdministracionContenido Este estado indica que el correo
/// electrónico se ha enviado correctamente.
/// {@endtemplate}
final class BlocListaArticulosYRecortesEstadoExitoso
    extends BlocListaArticulosYRecortesEstado {
  /// {@macro BlocListaArticulosYRecortesEstadoExitoso}
  BlocListaArticulosYRecortesEstadoExitoso.desde(
    super.otro, {
    super.articulos,
    super.index,
    super.estadoEntregables,
    super.articulosFiltrados,
    super.nombreDelArticuloAFiltrar,
  }) : super.desde();
}

/// {@template BlocListaArticulosYRecortesEstadoExitoso}
/// Este estado indica que se guardaron ciertos filtros para que luego se
/// filtren por estos y te devuelva la lista de articulos.
/// {@endtemplate}
final class BlocListaArticulosYRecortesEstadoGuardarFiltrados
    extends BlocListaArticulosYRecortesEstado {
  /// {@macro BlocListaArticulosYRecortesEstadoExitoso}
  BlocListaArticulosYRecortesEstadoGuardarFiltrados.desde(
    super.otro, {
    super.articulos,
    super.index,
    super.estadoEntregables,
    super.articulosFiltrados,
    super.nombreDelArticuloAFiltrar,
  }) : super.desde();
}

/// {@template BlocListaArticulosYRecortesEstadoFallido}
/// State/estado de `error` de BlocAdministracionContenido que indica que salio
/// mal o fallo
/// {@endtemplate}
final class BlocListaArticulosYRecortesEstadoFallido
    extends BlocListaArticulosYRecortesEstado {
  /// {@macro BlocListaArticulosYRecortesEstadoFallido}
  BlocListaArticulosYRecortesEstadoFallido.desde(
    super.otro, {
    required this.errorMessage,
  }) : super.desde();

  /// Mensaje que se va a mostrar en caso de que sea error
  /// o de que algo haya salido mal.
  final String errorMessage;
}
