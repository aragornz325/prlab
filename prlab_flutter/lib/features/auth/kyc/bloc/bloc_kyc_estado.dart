part of 'bloc_kyc.dart';

/// {@template BlocKycEstado}
/// Estado que maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
@immutable
sealed class BlocKycEstado {
  /// {@macro BlocKycEstado}
  const BlocKycEstado._({
    required this.idUsuario,
    this.nombre = '',
    this.apellido = '',
    this.fechaDeNacimiento,
    this.nombreDeCompania = '',
    this.localidad = '',
    this.numeroContacto = '',
  });

  // ignore: avoid_unused_constructor_parameters
  BlocKycEstado.desde(
    BlocKycEstado otro, {
    String? nombre,
    String? apellido,
    DateTime? fechaDeNacimiento,
    String? nombreDeCompania,
    String? localidad,
    String? numeroContacto,
    int? idUsuario,
  }) : this._(
          idUsuario: idUsuario ?? otro.idUsuario,
          nombre: nombre ?? otro.nombre,
          apellido: apellido ?? otro.apellido,
          fechaDeNacimiento: fechaDeNacimiento ?? otro.fechaDeNacimiento,
          nombreDeCompania: nombreDeCompania ?? otro.nombreDeCompania,
          localidad: localidad ?? otro.localidad,
          numeroContacto: numeroContacto ?? otro.numeroContacto,
        );
  // Id del usuario
  final int idUsuario;

  // Nombre del usuario.
  final String nombre;

  // Apellido del usuario.
  final String apellido;

  // Fecha de nacimiento del usuario.
  final DateTime? fechaDeNacimiento;

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
      fechaDeNacimiento != null &&
      nombreDeCompania.isNotEmpty &&
      localidad.isNotEmpty &&
      numeroContacto.isNotEmpty;

  // TODO(anyone): Documentar
  String get etiquetaFechaNacimiento => '${fechaDeNacimiento?.day}/'
      '${fechaDeNacimiento?.month}/'
      '${fechaDeNacimiento?.year}';
}

/// {@template BlocKycEstadoInicial}
/// Estado inicial del [BlocKyc].
/// {@endtemplate}
class BlocKycEstadoInicial extends BlocKycEstado {
  /// {@macro BlocKycEstadoInicial}
  const BlocKycEstadoInicial(this.idUsuario) : super._(idUsuario: idUsuario);

  /// id del usuario
  final int idUsuario;
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
    super.idUsuario,
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
