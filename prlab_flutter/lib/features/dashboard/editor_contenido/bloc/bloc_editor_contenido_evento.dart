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
// TODO(SAM): Agregar docu
  final File? logoElegidoCelular;
  final Uint8List? logoElegidoWeb;
  final File? logoSecundarioElegidoCelular;
  final Uint8List? logoSecundarioElegidoWeb;
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
/// {@endtemplate}
class BlocEditorContenidoActualizarDescripcion
    extends BlocEditorContenidoEvento {
  ///{@macro BlocEditorContenidoActualizarDescripcion}
  BlocEditorContenidoActualizarDescripcion(this.descripcionDeArticulo);

  /// El core de el artículo, acá se encuentra toda la información
  /// central del mismo, se pueden subir imagenes, customizar la letra
  /// y más, el string contiene el tipo de archivo `html` donde estan
  /// descriptas todas esas especificaciones.
  final String descripcionDeArticulo;
}
