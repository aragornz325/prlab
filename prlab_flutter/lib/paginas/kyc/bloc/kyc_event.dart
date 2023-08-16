part of 'kyc_bloc.dart';

@immutable
sealed class BlocEventKyc {}

class BlocKycEventoGuardarInformacionDeKyc extends BlocEventKyc {
  BlocKycEventoGuardarInformacionDeKyc();
}

class BlocKycEventoSetearInformacionDeKyc extends BlocEventKyc {
  BlocKycEventoSetearInformacionDeKyc({
    this.nombre,
    this.apellido,
    this.nombreDeCompania,
    this.localidadDeCompania,
    this.fecha,
    this.numeroDeContacto,
  });

  final String? nombre;
  final String? apellido;
  final String? nombreDeCompania;
  final String? localidadDeCompania;
  final String? fecha;
  final String? numeroDeContacto;
}
