part of 'kyc_bloc.dart';

@immutable
sealed class BlocKycEstado {
  const BlocKycEstado._({
    this.nombre = '',
    this.apellido = '',
    this.fecha = '',
    this.nombreDeCompania = '',
    this.localidad = '',
    this.numeroContacto = '',
  });

  // ignore: avoid_unused_constructor_parameters
  BlocKycEstado.desde(
    BlocKycEstado otro, {
    String? nombre,
    String? apellido,
    String? fecha,
    String? nombreDeCompania,
    String? localidad,
    String? numeroContacto,
  }) : this._(
          nombre: nombre ?? otro.nombre,
          apellido: apellido ?? otro.apellido,
          fecha: fecha ?? otro.fecha,
          nombreDeCompania: nombreDeCompania ?? otro.nombreDeCompania,
          localidad: localidad ?? otro.localidad,
          numeroContacto: numeroContacto ?? otro.numeroContacto,
        );

  final String nombre;
  final String apellido;
  final String fecha;
  final String nombreDeCompania;
  final String localidad;
  final String numeroContacto;

  bool get esFormularioCompletado =>
      nombre.isNotEmpty &&
      apellido.isNotEmpty &&
      fecha.isNotEmpty &&
      nombreDeCompania.isNotEmpty &&
      localidad.isNotEmpty &&
      numeroContacto.isNotEmpty;
}

class BlocKycEstadoInicial extends BlocKycEstado {
  const BlocKycEstadoInicial() : super._();
}

class BlocKycEstadoCargando extends BlocKycEstado {
  BlocKycEstadoCargando.desde(super.otro) : super.desde();
}

class BlocKycEstadoExitoso extends BlocKycEstado {
  BlocKycEstadoExitoso.desde(
    super.otro, {
    super.nombre,
    super.apellido,
    super.fecha,
    super.nombreDeCompania,
    super.localidad,
    super.numeroContacto,
  }) : super.desde();
}

class BlocKycEstadoFallido extends BlocKycEstado {
  BlocKycEstadoFallido.desde(super.otro) : super.desde();
}
