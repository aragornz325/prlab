part of 'bloc_administracion_marcas.dart';

/// {@template BlocAdministracionMarcasEvento}
/// Example
/// {@endtemplate}
abstract class BlocAdministracionMarcasEvento extends Equatable {
  /// {@macro BlocAdministracionMarcasEvento}
  const BlocAdministracionMarcasEvento();

  @override
  List<Object> get props => [];
}

/// {@template BlocAdministracionMarcasEventoTraerInfo}
// TODO(Gon): Ver que informacion es necesario para mejorar naming, documentar, etc

/// Trae informacion del usuario
/// {@endtemplate}
class BlocAdministracionMarcasEventoTraerInfo
    extends BlocAdministracionMarcasEvento {}
