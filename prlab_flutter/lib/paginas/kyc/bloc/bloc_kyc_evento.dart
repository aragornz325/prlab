part of 'bloc_kyc.dart';

/// {@template bloc_kyc_evento}
/// Evento que maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
@immutable
sealed class BlocKcyEvento {}

/// {@template bloc_kyc_evento_insertar_informacion_del_kyc}
/// Evento que inserta los valores que se completaron en el formulario,
/// guardados dentro del estado dentro de la informacion
/// del usuario en la base de datos.
/// {@endtemplate}
class BlocKycEventoInsertarInformacionDeKyc extends BlocKcyEvento {
  /// {@macro bloc_kyc_evento_insertar_informacion_del_kyc}
  BlocKycEventoInsertarInformacionDeKyc();
}

/// {@template bloc_kyc_evento_recolectar_informacion_del_kyc}
/// Evento que recolecta los valores que se van completando
/// en el formulario cada vez que se actualiza.
/// {@endtemplate}
class BlocKycEventoRecolectarInformacionDeKyc extends BlocKcyEvento {
  BlocKycEventoRecolectarInformacionDeKyc({
    this.nombre,
    this.apellido,
    this.nombreDeCompania,
    this.localidadDeCompania,
    this.fechaDeNacimiento,
    this.numeroDeContacto,
  });

  final String? nombre;
  final String? apellido;
  final String? nombreDeCompania;
  final String? localidadDeCompania;
  final String? fechaDeNacimiento;
  final String? numeroDeContacto;
}
