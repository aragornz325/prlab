part of 'bloc_administracion_de_una_marca.dart';

/// {@template BlocAdministracionDeUnaMarcaEstado}
/// Maneja los distintos estados y variables guardadas en los mismos
/// {@endtemplate}
class BlocAdministracionDeUnaMarcaEstado extends Equatable {
  /// {@macro BlocAdministracionDeUnaMarcaEstado}
  const BlocAdministracionDeUnaMarcaEstado._({
    required this.idMarca,
    this.marca,
  });

  BlocAdministracionDeUnaMarcaEstado.desde(
    BlocAdministracionDeUnaMarcaEstado otro, {
    int? idMarca,
    Marca? marca,
  }) : this._(
          idMarca: idMarca ?? otro.idMarca,
          marca: marca ?? otro.marca,
        );

  /// Identificador unico de una marca.
  final int idMarca;

  /// La marca que va a estar siendo visualizada
  /// en la página de administración de marca.
  final Marca? marca;

  @override
  List<Object?> get props => [
        idMarca,
        marca,
      ];
}

/// {@template BlocAdministracionMarcasEstadoInicial}
/// Estado inicial de los componentes de la pantalla 'AdministracionDeUnaMarca'
/// {@endtemplate}
class BlocAdministracionDeUnaMarcaEstadoInicial
    extends BlocAdministracionDeUnaMarcaEstado {
  /// {@macro BlocAdministracionMarcasEstadoInicial}
  const BlocAdministracionDeUnaMarcaEstadoInicial(int idMarca)
      : super._(idMarca: idMarca);
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
  BlocAdministracionDeUnaMarcaEstadoExitosoGeneral.desde(
    super.otro, {
    required super.marca,
  }) : super.desde();
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
