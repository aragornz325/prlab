part of 'bloc_editor_contenido.dart';

/// {@template BlocKcyEvento}
/// Maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
@immutable
sealed class BlocEditorContenidoEvento {}

/// {@template BlocEditorContenidoEventoAgregarImagen}
/// Agrega las imagenes, logos al estado para luego mostrarlos en la UI.
/// {@endtemplate}
class BlocEditorContenidoEventoAgregarImagen extends BlocEditorContenidoEvento {
  /// {@macro BlocEditorContenidoEventoAgregarImagen}
  BlocEditorContenidoEventoAgregarImagen({
    this.logoElegidoCelular,
    this.logoElegidoWeb,
    this.logoSecundarioElegidoCelular,
    this.logoSecundarioElegidoWeb,
  });

  /// Logo primario que fue seleccionado de celular.
  final File? logoElegidoCelular;

  /// Logo primario que fue seleccionado de web.
  final Uint8List? logoElegidoWeb;

  /// Logo secundario que fue seleccionado de celular.
  final File? logoSecundarioElegidoCelular;

  /// Logo secundario que fue seleccionado de web.
  final Uint8List? logoSecundarioElegidoWeb;
}

/// {@template BlocEditorContenidoEventoEliminarImagen}
/// Elimina la imagen, el logo seleccionado.
/// {@endtemplate}
class BlocEditorContenidoEventoEliminarImagen
    extends BlocEditorContenidoEvento {
  /// {@macro BlocEditorContenidoEventoEliminarImagen}
  BlocEditorContenidoEventoEliminarImagen({
    this.esLogoPrimario = false,
    this.esLogoSecundario = false,
  });

  /// Especifica si es el logo primario para que en la funcion del
  /// evento se elimine.
  final bool esLogoPrimario;

  /// Especifica si es el logo secundario para que en la funcion del
  /// evento se elimine.
  final bool esLogoSecundario;
}

/// {@template BlocEditorContenidoEventoObtenerArticulo}
/// Obtiene el articulo a partir de un ID, para poder continuar con su edicion
/// o creacion.
/// {@endtemplate}
class BlocEditorContenidoEventoObtenerArticulo
    extends BlocEditorContenidoEvento {
  /// {@macro BlocEditorContenidoEventoObtenerArticulo}
  BlocEditorContenidoEventoObtenerArticulo({
    required this.idArticulo,
  });

  final int idArticulo;
}

/// {@template BlocEditorContenidoActualizarDescripcion}
/// Actualiza el contenido dentro de la descripción de un
/// articulo a medida que se vayan ejecutando cambios dentro
/// del mismo
///
/// Guarda los datos de la descripcion y titulo del articulo en la base de
/// datos.
/// {@endtemplate}
class BlocEditorContenidoEventoActualizarArticulo
    extends BlocEditorContenidoEvento {
  ///{@macro BlocEditorContenidoActualizarDescripcion}
  BlocEditorContenidoEventoActualizarArticulo({
    this.descripcionDeArticulo,
    this.titulo,
    this.seActualizaDesdeStream = false,
  });

  /// El core de el artículo, acá se encuentra toda la información
  /// central del mismo, se pueden subir imagenes, customizar la letra
  /// y más, el string contiene el tipo de archivo `html` donde estan
  /// descriptas todas esas especificaciones.
  final String? descripcionDeArticulo;

  /// El título del articulo.
  final String? titulo;

  /// Si el evento esta siendo llamado o no desde el listener
  /// de la conexión abierta de stream.
  ///
  /// Si la información viene actualizada del stream, se
  /// actualiza el [Articulo] dentro del estado, en caso de que el
  /// evento se ejecute a medida que el cliente actual actualice el
  /// [Articulo], unicamente se actualizara en la db para que el resto
  /// de los clientes que esten escuchando se les actualice el articulo.
  final bool seActualizaDesdeStream;
}

/// {@template BlocEditorContenidoEliminarPaginaArticulo}
/// Elimina una pagina del articulo de acuerdo al id que recibe.
/// {@endtemplate}
class BlocEditorContenidoEventoEliminarPaginaArticulo
    extends BlocEditorContenidoEvento {
  ///{@macro BlocEditorContenidoEliminarPaginaArticulo}
  BlocEditorContenidoEventoEliminarPaginaArticulo({
    required this.idPagina,
  });

  final int idPagina;
}
