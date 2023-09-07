part of 'bloc_dashboard.dart';

/// {@template BlocDashboardEstado}
/// Maneja los estados de procesos que se
/// ejecutan a lo largo del dashboard indiferentemente
/// de en que sub-página del dashboard se encuentre
/// el usuario.
/// {@endtemplate}
class BlocDashboardEstado {
  /// {@macro BlocDashboardEstado}
  const BlocDashboardEstado._();

  BlocDashboardEstado.desde() : this._();
}

/// {@template BlocDashboardInicial}
/// Estado inicial de [BlocDashboardEstado].
/// {@endtemplate}
class BlocDashboardInicial extends BlocDashboardEstado {
  /// {@macro BlocDashboardInicial}
  const BlocDashboardInicial() : super._();
}

/// {@template BlocDashboardCargando}
/// Estado de espera/carga de [BlocDashboardEstado].
/// {@endtemplate}
class BlocDashboardCargando extends BlocDashboardEstado {
  /// {@macro BlocDashboardCargando}
  BlocDashboardCargando.desde() : super.desde();
}

/// {@template BlocDashboardExitoso}
/// Estado de éxito de [BlocDashboardEstado].
///
/// Por el momento se presenta cuando se crea
/// exitosamente un articulo, la creación de artículo
/// se puede dar desde distintas páginas del dashboard.
/// {@endtemplate}
class BlocDashboardExitoso extends BlocDashboardEstado {
  /// {@macro BlocDashboardExitoso}
  BlocDashboardExitoso.desde(this.idArticulo) : super.desde();

  /// Si el evento `crearArticulo` es exitoso, devuelve
  /// un id de articulo que nos va a servir para poder
  /// redirigir al usuario a la pantalla de edición del mismo.
  final int idArticulo;
}

/// {@template BlocDashboardFallido}
/// Estado de fallo de [BlocDashboardEstado].
/// {@endtemplate}
class BlocDashboardFallido extends BlocDashboardEstado {
  /// {@macro BlocDashboardFallido}
  BlocDashboardFallido.desde() : super.desde();
}

/// {@template BlocDashboardEstadoLogueoExitoso}
/// Este estado ocurre cuando la verificacion del logueo es exitosa
/// {@endtemplate}
class BlocDashboardEstadoLogueoExitoso extends BlocDashboardEstado {
  /// {@macro BlocDashboardEstadoLogueoExitoso}
  BlocDashboardEstadoLogueoExitoso.desde() : super.desde();
}

/// {@template BlocDashboardEstadoLogueoFallido}
/// Este estado ocurre cuando la verificacion del logueo falla
/// {@endtemplate}
class BlocDashboardEstadoLogueoFallido extends BlocDashboardEstado {
  /// {@macro BlocDashboardEstadoLogueoFallido}
  BlocDashboardEstadoLogueoFallido.desde() : super.desde();
}
