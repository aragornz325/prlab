part of 'bloc_kyc.dart';

/// {@template BlocKcyEvento}
/// Maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
@immutable
sealed class BlocKcyEvento {}

/// {@template BlocKycEventoInsertarInformacionDeKyc}
/// Guarda el id del usuario a manejar para cambiar cierta informacion.
/// {@endtemplate}
class BlocKycEventoInsertarAgregarIdUsuario extends BlocKcyEvento {
  /// {@macro BlocKycEventoInsertarInformacionDeKyc}
  BlocKycEventoInsertarAgregarIdUsuario({required this.idUsuario});
  final int idUsuario;
}

/// {@template BlocKycEventoInsertarInformacionDeKyc}
/// Inserta los valores que se completaron en el formulario,
/// guardados dentro del estado dentro de la informacion
/// del usuario en la base de datos.
/// {@endtemplate}
class BlocKycEventoInsertarInformacionDeKyc extends BlocKcyEvento {
  /// {@macro BlocKycEventoInsertarInformacionDeKyc}
  BlocKycEventoInsertarInformacionDeKyc();
}

/// {@template BlocKycEventoRecolectarInformacionDeKyc}
/// Recolecta los valores que se van completando
/// en el formulario cada vez que se actualiza.
/// {@endtemplate}
class BlocKycEventoRecolectarInformacionDeKyc extends BlocKcyEvento {
  /// {@macro BlocKycEventoRecolectarInformacionDeKyc}
  BlocKycEventoRecolectarInformacionDeKyc({
    this.nombre,
    this.apellido,
    this.nombreDeCompania,
    this.localidadDeCompania,
    this.fechaDeNacimiento,
    this.numeroDeContacto,
  });

  // Nombre/s del usuario.
  final String? nombre;

  // Apellido/s del usuario.
  final String? apellido;

  // Número de contacto del usuario.
  final String? numeroDeContacto;

  // Empresa donde trabaja el usuario.
  final String? nombreDeCompania;

  // Lugar físico, dirección donde esta la sede
  // de la empresa donde trabaja el usuario.
  final String? localidadDeCompania;

  // Fecha de nacimiento del usuario.
  final String? fechaDeNacimiento;
}
