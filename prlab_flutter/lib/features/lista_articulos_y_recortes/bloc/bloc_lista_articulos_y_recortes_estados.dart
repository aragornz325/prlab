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
    this.index = 0,
  });

  BlocListaArticulosYRecortesEstado.desde(
    BlocListaArticulosYRecortesEstado otro, {
    List<Articulo>? articulos,
    int? index,
  }) : this._(
          articulos: articulos ?? otro.articulos,
          index: index ?? otro.index,
        );

  final List<Articulo> articulos;

  /// Index de la vista seleccionada
  final int index;

  /// Si es Articulos
  bool get esArticulos => index == 0;

  /// Si es Recortes
  bool get esRecortes => index == 1;

  @override
  List<Object> get props => [
        articulos,
        index,
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
