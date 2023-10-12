part of 'bloc_creacion_periodista.dart';

/// {@template BlocCreacionPeriodistaEvento}
/// Clase padre de los eventos de 'CreacionPeriodista'
/// {@endtemplate}
abstract class BlocCreacionPeriodistaEvento {
  /// {@macro BlocCreacionPeriodistaEvento}
  const BlocCreacionPeriodistaEvento();
}

/// {@template BlocCreacionPeriodistaEventoActualizarDatos}
/// Se actualizan los datos del periodista en creacion para luego enviarlo
/// a la base de datos en otro evento.
/// {@endtemplate}
class BlocCreacionPeriodistaEventoActualizarDatos
    extends BlocCreacionPeriodistaEvento {
  /// {@macro BlocCreacionPeriodistaEventoActualizarDatos}
  const BlocCreacionPeriodistaEventoActualizarDatos({
    this.nombre,
    this.apellido,
    this.puesto,
    this.medioDeComunicacion,
    this.email,
    this.telefono,
    this.imagenElegidaCelular,
    this.imagenElegidaWeb,
    this.eliminarImagen,
    this.idPais,
    this.idCiudad,
    this.listaIdiomas,
    this.biografia,
    this.listaTemas,
    this.listaRedes,
  });

  /// Nombre del periodista a crear.
  final String? nombre;

  /// Apellido del periodista a crear.
  final String? apellido;

  /// Posicion en la empresa, empleo del periodista a crear.
  final String? puesto;

  /// Medio de comunicacion del periodista a crear.
  final String? medioDeComunicacion;

  /// Email del periodista a crear.
  final String? email;

  /// Telefono del periodista a crear.

  final String? telefono;

  /// Imagen seleccionada de celular en su formato correspondiente
  final File? imagenElegidaCelular;

  /// Imagen seleccionada de web en su formato correspondiente
  final Uint8List? imagenElegidaWeb;

  /// En caso de ser true permite eliminar la imagen de periodista,
  /// convierte a null el valor de web y celular.
  final bool? eliminarImagen;

  /// Id del pais que pertenece el periodista a crear.
  final int? idPais;

  /// Id de la ciudad que pertenece el periodista a crear.
  final int? idCiudad;

  /// Lista de idiomas que conoce el periodista a crear.
  final List<String>? listaIdiomas;

  /// Biografia del periodista a crear.
  final String? biografia;

  /// Lista de temas del periodista a crear.
  final List<String>? listaTemas;

  /// Lista de redes sociales del periodista a crear.
  final List<RedSocial>? listaRedes;
}

/// {@template BlocDbMediosDeComunicacionEventoCrearPeriodista}
/// Toma el modelo de periodista creado anteriormente y envia a la base de datos
/// {@endtemplate}
class BlocCreacionPeriodistaEventoCrearPeriodista
    extends BlocCreacionPeriodistaEvento {
  /// {@macro BlocDbMediosDeComunicacionEventoCrearPeriodista}
  const BlocCreacionPeriodistaEventoCrearPeriodista();
}

/// {@template BlocCreacionPeriodistaEventoVaciarLista}
/// Vacia la lista de datos del estado
/// {@endtemplate}
class BlocCreacionPeriodistaEventoVaciarLista
    extends BlocCreacionPeriodistaEvento {
  /// {@macro BlocCreacionPeriodistaEventoVaciarLista}
  const BlocCreacionPeriodistaEventoVaciarLista();
}
