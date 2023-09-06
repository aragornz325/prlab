part of 'bloc_dashboard.dart';

/// {@template BlocDashboardEvento}
/// Clase padre de los eventos de [BlocDashboard].
/// {@endtemplate}
abstract class BlocDashboardEvento {
  /// {@macro BlocDashboardEvento}
  const BlocDashboardEvento();
}

/// {@template BlocDashboardCrearArticulo}
/// Ejecuta la creación de un nuevo artículo
/// dentro de la db, este artículo tendría
/// como autor el mismo usuario que lo crea.
/// {@macro BlocDashboardCrearArticulo}
class BlocDashboardCrearArticulo extends BlocDashboardEvento {}
