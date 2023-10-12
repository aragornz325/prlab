part of 'bloc_creacion_periodista.dart';

/// {@template BlocCreacionPeriodistaEstado}
/// Maneja los distintos estados y variables guardadas en los mismos
/// {@endtemplate}
class BlocCreacionPeriodistaEstado {
  /// {@macro BlocCreacionPeriodistaEstado}
  const BlocCreacionPeriodistaEstado._({
    this.nombre = '',
    this.apellido = '',
    this.puesto = '',
    this.medioDeComunicacion = '',
    this.eliminarImagen = false,
    this.email = '',
    this.telefono = '',
    this.imagenElegidaCelular,
    this.imagenElegidaWeb,
    this.idPais = 0,
    this.idCiudad = 0,
    this.listaIdiomas = const [],
    this.biografia = '',
    this.listaTemas = const [],
    this.listaRedes = const [],
  });

  BlocCreacionPeriodistaEstado.desde(
    BlocCreacionPeriodistaEstado otro, {
    String? nombre,
    String? apellido,
    String? cargo,
    String? empresa,
    String? email,
    String? telefono,
    File? imagenElegidaCelular,
    Uint8List? imagenElegidaWeb,
    bool eliminarImagen = false,
    int? idPais,
    int? idCiudad,
    List<String>? listaIdiomas,
    String? biografia,
    List<String>? listaTemas,
    List<RedSocial>? listaRedes,
  }) : this._(
          imagenElegidaCelular: eliminarImagen
              ? null
              : imagenElegidaCelular ?? otro.imagenElegidaCelular,
          imagenElegidaWeb:
              eliminarImagen ? null : imagenElegidaWeb ?? otro.imagenElegidaWeb,
          nombre: nombre ?? otro.nombre,
          apellido: apellido ?? otro.apellido,
          puesto: cargo ?? otro.puesto,
          medioDeComunicacion: empresa ?? otro.medioDeComunicacion,
          email: email ?? otro.email,
          telefono: telefono ?? otro.telefono,
          idPais: idPais ?? otro.idPais,
          idCiudad: idCiudad ?? otro.idCiudad,
          listaIdiomas: listaIdiomas ?? otro.listaIdiomas,
          biografia: biografia ?? otro.biografia,
          listaTemas: listaTemas ?? otro.listaTemas,
          listaRedes: listaRedes ?? otro.listaRedes,
        );

  /// Nombre del periodista a crear.
  final String nombre;

  /// Apellido del periodista a crear.
  final String apellido;

  /// Imagen seleccionada de celular en su formato correspondiente
  final File? imagenElegidaCelular;

  /// Imagen seleccionada de web en su formato correspondiente
  final Uint8List? imagenElegidaWeb;

  /// En caso de ser true permite eliminar la imagen de periodista,
  /// convierte a null el valor de web y celular.
  final bool eliminarImagen;

  /// Posicion en la empresa, empleo del periodista a crear.
  final String puesto;

  /// Medio de comunicacion del periodista a crear.
  final String medioDeComunicacion;

  /// Email del periodista a crear.
  final String email;

  /// Telefono del periodista a crear.
  final String telefono;

  /// Id del pais que pertenece el periodista a crear.
  final int idPais;

  /// Id de la ciudad que pertenece el periodista a crear.
  final int idCiudad;

  /// Lista de idiomas que conoce el periodista a crear.
  final List<String> listaIdiomas;

  /// Biografia del periodista a crear.
  final String biografia;

  /// Lista de temas del periodista a crear.
  final List<String> listaTemas;

  /// Lista de redes sociales del periodista a crear.
  final List<RedSocial> listaRedes;

  /// Indica si el periodista a crear tiene datos cargados, para avisarle al
  /// usuario que va a perder los datos si cierra el popup
  bool get hayDataCargada =>
      nombre != '' ||
      apellido != '' ||
      puesto != '' ||
      medioDeComunicacion != '' ||
      email != '' ||
      imagenElegidaCelular != null ||
      imagenElegidaWeb != null ||
      telefono != '' ||
      idPais != 0 ||
      idCiudad != 0 ||
      listaIdiomas.isNotEmpty ||
      biografia != '' ||
      listaTemas.isNotEmpty ||
      listaRedes.isNotEmpty;

  /// Indica si el periodista se esta creando
  bool get seEstaCreando => this is BlocCreacionPeriodistaCreandoPeriodista;

  /// Indica si el periodista se pudo crear
  bool get seCreoElPeriodista =>
      this is BlocCreacionPeriodistaEstadoExitoAlCrearPeriodista;
}

/// {@template BlocCreacionPeriodistaEstadoInicial}
/// Estado inicial del popup de 'CreacionPeriodista'
/// {@endtemplate}
class BlocCreacionPeriodistaEstadoInicial extends BlocCreacionPeriodistaEstado {
  /// {@macro BlocCreacionPeriodistaEstadoInicial}
  const BlocCreacionPeriodistaEstadoInicial() : super._();
}

/// {@template BlocCreacionPeriodistaEstadoCargando}
/// Estado de cargando del popup de 'CreacionPeriodista'
/// {@endtemplate}
class BlocCreacionPeriodistaEstadoCargando
    extends BlocCreacionPeriodistaEstado {
  /// {@macro BlocCreacionPeriodistaEstadoCargando}
  BlocCreacionPeriodistaEstadoCargando.desde(
    super.otro,
  ) : super.desde();
}

/// {@template BlocCreacionPeriodistaCreandoPeriodista}
/// Estado de espera mientras se crea el periodista
/// {@endtemplate}
class BlocCreacionPeriodistaCreandoPeriodista
    extends BlocCreacionPeriodistaEstado {
  /// {@macro BlocCreacionPeriodistaCreandoPeriodista}
  BlocCreacionPeriodistaCreandoPeriodista.desde(
    super.otro,
  ) : super.desde();
}

/// {@template BlocCreacionPeriodistaEstadoExitoso}
/// Estado exitoso del popup de 'CreacionPeriodista'
/// {@endtemplate}
class BlocCreacionPeriodistaEstadoPeriodistaActualizado
    extends BlocCreacionPeriodistaEstado {
  /// {@macro BlocCreacionPeriodistaEstadoExitoso}
  BlocCreacionPeriodistaEstadoPeriodistaActualizado.desde(
    super.otro, {
    super.nombre,
    super.apellido,
    super.cargo,
    super.empresa,
    super.email,
    super.imagenElegidaCelular,
    super.imagenElegidaWeb,
    super.eliminarImagen,
    super.telefono,
    super.idPais,
    super.idCiudad,
    super.listaIdiomas,
    super.biografia,
    super.listaTemas,
    super.listaRedes,
  }) : super.desde();
}

/// {@template BlocCreacionPeriodistaEstadoExitoAlCrearPeriodista}
/// Estado exitoso al crear un periodista en el popup de 'CreacionPeriodista'
/// {@endtemplate}
class BlocCreacionPeriodistaEstadoExitoAlCrearPeriodista
    extends BlocCreacionPeriodistaEstado {
  /// {@macro BlocCreacionPeriodistaEstadoExitoAlCrearPeriodista}
  BlocCreacionPeriodistaEstadoExitoAlCrearPeriodista.desde(
    super.otro,
  ) : super.desde();
}

/// {@template BlocCreacionPeriodistaEstadoError}
/// Estado de error del popup de 'CreacionPeriodista'
/// {@endtemplate}
class BlocCreacionPeriodistaEstadoFallido extends BlocCreacionPeriodistaEstado {
  /// {@macro BlocCreacionPeriodistaEstadoError}
  BlocCreacionPeriodistaEstadoFallido.desde(
    super.otro,
  ) : super.desde();
}
