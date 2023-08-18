part of 'bloc_kyc.dart';

/// {@template BlocKycEstado}
/// Estado que maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
@immutable
sealed class BlocKycEstado {
  /// {@macro BlocKycEstado}
  const BlocKycEstado._({
    this.nombre = '',
    this.apellido = '',
    this.fechaDeNacimiento = '',
    this.nombreDeCompania = '',
    this.localidad = '',
    this.numeroContacto = '',
  });

  // ignore: avoid_unused_constructor_parameters
  BlocKycEstado.desde(
    BlocKycEstado otro, {
    String? nombre,
    String? apellido,
    String? fechaDeNacimiento,
    String? nombreDeCompania,
    String? localidad,
    String? numeroContacto,
  }) : this._(
          nombre: nombre ?? otro.nombre,
          apellido: apellido ?? otro.apellido,
          fechaDeNacimiento: fechaDeNacimiento ?? otro.fechaDeNacimiento,
          nombreDeCompania: nombreDeCompania ?? otro.nombreDeCompania,
          localidad: localidad ?? otro.localidad,
          numeroContacto: numeroContacto ?? otro.numeroContacto,
        );

  // Nombre del usuario.
  final String nombre;

  // Apellido del usuario.
  final String apellido;

  // Fecha de nacimiento del usuario.
  final String fechaDeNacimiento;

  // Nombre de la compañia en la que trabaja el usuario.
  final String nombreDeCompania;

  // Localidad de la compañia en la que trabaja el usuario.
  final String localidad;

  // Numero de contacto del usuario.
  final String numeroContacto;

  // Si todos los campos de texto del formularios fueron
  // completados.
  bool get esFormularioCompletado =>
      nombre.isNotEmpty &&
      apellido.isNotEmpty &&
      fechaDeNacimiento.isNotEmpty &&
      nombreDeCompania.isNotEmpty &&
      localidad.isNotEmpty &&
      numeroContacto.isNotEmpty;
}

/// {@template BlocKycEstadoInicial}
/// Estado inicial del [BlocKyc].
/// {@endtemplate}
class BlocKycEstadoInicial extends BlocKycEstado {
  /// {@macro BlocKycEstadoInicial}
  const BlocKycEstadoInicial() : super._();
}

/// {@template BlocKycEstadoCargando}
/// Estado de carga del [BlocKyc].
/// {@endtemplate}
class BlocKycEstadoCargando extends BlocKycEstado {
  /// {@macro BlocKycEstadoCargando}
  BlocKycEstadoCargando.desde(super.otro) : super.desde();
}

/// {@template BlocKycEstadoRecolectandoDatos}
/// Recolecta del [BlocKyc]
/// A medida que el usuario va completando el kyc
/// el estado se va a ir actualizando con la nueva
/// información completada en los campos de texto.
/// {@endtemplate}
class BlocKycEstadoRecolectandoDatos extends BlocKycEstado {
  /// {@macro BlocKycEstadoRecolectandoDatos}
  BlocKycEstadoRecolectandoDatos.desde(
    super.otro, {
    super.nombre,
    super.apellido,
    super.fechaDeNacimiento,
    super.nombreDeCompania,
    super.localidad,
    super.numeroContacto,
  }) : super.desde();
}

/// {@template BlocKycEstadoExitoso}
/// Estado de exito del [BlocKyc].
/// {@endtemplate}
class BlocKycEstadoExitoso extends BlocKycEstado {
  /// {@macro BlocKycEstadoExitoso}
  BlocKycEstadoExitoso.desde(super.otro) : super.desde();
}

/// {@template BlocKycEstadoFallido}
/// Estado de fallo del [BlocKyc].
/// {@endtemplate}
class BlocKycEstadoFallido extends BlocKycEstado {
  /// {@macro BlocKycEstadoFallido}
  BlocKycEstadoFallido.desde(super.otro) : super.desde();
}
