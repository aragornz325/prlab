part of 'bloc_kyc.dart';

/// {@template BlocKcyEvento}
/// Maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
@immutable
sealed class BlocKcyEvento {}

// TODO(Andreas): Agregar docu de getter.
/// {@template bloc_kyc_evento_insertar_informacion_del_kyc}
/// Inserta los valores que se completaron en el formulario,
/// guardados dentro del estado dentro de la informacion
/// del usuario en la base de datos.
/// {@endtemplate}
class BlocKycEventoInsertarInformacionDeKyc extends BlocKcyEvento {
  /// {@macro bloc_kyc_evento_insertar_informacion_del_kyc}
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

  // TODO(Andreas): Agregar docu.
  final String? nombre;
  final String? apellido;
  final String? nombreDeCompania;
  final String? localidadDeCompania;
  final String? fechaDeNacimiento;
  final String? numeroDeContacto;
}
