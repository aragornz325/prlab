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
/// Se ejecuta apenas se entra en la adminitración de marcas,
/// trae la lista de marcas en las que el usuario esta
/// involucrado.
/// {@endtemplate}
class BlocAdministracionMarcasEventoInicializar
    extends BlocAdministracionMarcasEvento {}
