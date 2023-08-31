part of 'bloc_administracion_de_una_marca.dart';

/// {@template BlocAdministracionDeUnaMarcaEvento}
/// Clase padre de los eventos de [AdministracionDeUnaMarca]
/// {@endtemplate}
abstract class BlocAdministracionDeUnaMarcaEvento extends Equatable {
  /// {@macro BlocAdministracionDeUnaMarcaEvento}
  const BlocAdministracionDeUnaMarcaEvento();

  @override
  List<Object> get props => [];
}

/// {@template BlocAdministracionDeUnaMarcaEventoInicializar}
/// Inicializa la pagina [AdministracionDeUnaMarca]
/// {@endtemplate}
class BlocAdministracionDeUnaMarcaEventoInicializar
    extends BlocAdministracionDeUnaMarcaEvento {}
