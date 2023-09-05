part of 'bloc_drawer.dart';

/// {@template BlocDrawerEvento}
/// Clase padre de los eventos de [BlocDrawer]
/// {@endtemplate}
abstract class BlocDrawerEvento {
  /// {@macro BlocDrawerEvento}
  const BlocDrawerEvento();
}

/// {@template BlocDrawerEventCerrarSesion}
/// Cierra sesion del usuario.
/// {@endtemplate}
class BlocDrawerEventCerrarSesion extends BlocDrawerEvento {}
