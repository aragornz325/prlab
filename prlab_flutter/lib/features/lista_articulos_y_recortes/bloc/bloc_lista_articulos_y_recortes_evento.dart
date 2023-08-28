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

/// {@template BlocCrearCuentaAdminEventEnviarEmail}
/// Envia al email una invitación para que se cree una nueva cuenta,
/// creada por el administrador
/// {@endtemplate}
class BlocListaArticulosYRecortesEventoFiltrar
    extends BlocListaArticulosYRecortesEvento {
  /// {@macro BlocCrearCuentaAdminEventEnviarEmail}
  @override
  const BlocListaArticulosYRecortesEventoFiltrar();

  // TODO(anyone): agregar el tipo de filtrado sea por un enum u otro tipo
}

/// {@template BlocCrearCuentaAdminEventEnviarEmail}
/// Envia al email una invitación para que se cree una nueva cuenta,
/// creada por el administrador
/// {@endtemplate}
class BlocListaArticulosYRecortesEventoTraerArticulos
    extends BlocListaArticulosYRecortesEvento {
  /// {@macro BlocCrearCuentaAdminEventEnviarEmail}
  @override
  const BlocListaArticulosYRecortesEventoTraerArticulos();
}

/// {@template BlocCrearCuentaAdminEventEnviarEmail}
/// Seleccionar entre Recortes y Articulos cambia el index seleccionado y
/// muestra una vista distinta.
/// {@endtemplate}
class BlocListaArticulosYRecortesEventoSeleccionEntreRecortesYArticulos
    extends BlocListaArticulosYRecortesEvento {
  /// {@macro BlocCrearCuentaAdminEventEnviarEmail}
  @override
  const BlocListaArticulosYRecortesEventoSeleccionEntreRecortesYArticulos({
    required this.index,
  });

  /// Index a cambiar para alternar distintas vistas.
  final int index;
}
