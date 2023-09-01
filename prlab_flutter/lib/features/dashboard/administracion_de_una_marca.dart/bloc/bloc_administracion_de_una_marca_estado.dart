part of 'bloc_administracion_de_una_marca.dart';

/// {@template BlocAdministracionDeUnaMarcaEstado}
/// Maneja los distintos estados y variables guardadas en los mismos
/// {@endtemplate}
class BlocAdministracionDeUnaMarcaEstado extends Equatable {
  /// {@macro BlocAdministracionDeUnaMarcaEstado}
  const BlocAdministracionDeUnaMarcaEstado._({
    this.ejemplo = false,
  });

  BlocAdministracionDeUnaMarcaEstado.desde(
    BlocAdministracionDeUnaMarcaEstado otro, {
    bool? ejemplo,
  }) : this._(
          ejemplo: ejemplo ?? otro.ejemplo,
        );

  /// AdministracionDeUnaMarca
  final bool ejemplo;

  @override
  List<Object> get props => [
        ejemplo,
      ];
}

/// {@template BlocAdministracionMarcasEstadoInicial}
/// Estado inicial de los componentes de la pantalla 'AdministracionDeUnaMarca'
/// {@endtemplate}
class BlocAdministracionDeUnaMarcaEstadoInicial
    extends BlocAdministracionDeUnaMarcaEstado {
  /// {@macro BlocAdministracionMarcasEstadoInicial}
  const BlocAdministracionDeUnaMarcaEstadoInicial() : super._();
}

/// {@template BlocAdministracionMarcasEstadoCargando}
/// Estado de cargando de los componentes de la pantalla
/// 'AdministracionDeUnaMarca'
/// {@endtemplate}
class BlocAdministracionDeUnaMarcaEstadoCargando
    extends BlocAdministracionDeUnaMarcaEstado {
  /// {@macro BlocAdministracionMarcasEstadoCargando}
  BlocAdministracionDeUnaMarcaEstadoCargando.desde(
    super.otro,
  ) : super.desde();
}

/// {@template BlocAdministracionMarcasEstadoExitosoGeneral}
/// Estado exitoso general de los componentes de la pantalla
/// 'AdministracionDeUnaMarca'
/// {@endtemplate}
class BlocAdministracionDeUnaMarcaEstadoExitosoGeneral
    extends BlocAdministracionDeUnaMarcaEstado {
  /// {@macro BlocAdministracionMarcasEstadoExitosoGeneral}
  BlocAdministracionDeUnaMarcaEstadoExitosoGeneral.desde(super.otro)
      : super.desde();
}

/// {@template BlocAdministracionMarcasEstadoError}
/// Estado de error de los componentes de la pantalla 'AdministracionDeUnaMarca'
/// {@endtemplate}
class BlocAdministracionDeUnaMarcaEstadoError
    extends BlocAdministracionDeUnaMarcaEstado {
  /// {@macro BlocAdministracionMarcasEstadoError}
  BlocAdministracionDeUnaMarcaEstadoError.desde(
    super.otro, {
    required this.mensajeDeError,
  }) : super.desde();

  /// Mensaje de error
  final MensajesDeErrorAdministracionDeUnaMarca mensajeDeError;
}

/// Tipos de errores de 'AdministracionDeUnaMarca' en caso de que sean
/// necesarios
enum MensajesDeErrorAdministracionDeUnaMarca {
  unknown,
  // TODO(Gon): Manejar errores de [AdministracionDeUnaMarca]
}
