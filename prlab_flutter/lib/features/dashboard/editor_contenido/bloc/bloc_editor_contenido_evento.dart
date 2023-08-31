part of 'bloc_editor_contenido.dart';

/// {@template BlocKcyEvento}
/// Maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
@immutable
sealed class BlocEditorContenidoEvento {}

/// {@template BlocEditorContenidoEventoInicializar}
/// Inicializa los modelos principales de esta pantalla.
///
/// Se encarga principalmente de traer los datos del
/// artículo que va a ser editado.
/// {@endtemplate}
class BlocEditorContenidoEventoInicializar extends BlocEditorContenidoEvento {
  /// {@macro BlocEditorContenidoEventoInicializar}
  BlocEditorContenidoEventoInicializar(this.idArticulo);

  final int idArticulo;
}

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

  final File? logoElegidoCelular;
  final Uint8List? logoElegidoWeb;
  final File? logoSecundarioElegidoCelular;
  final Uint8List? logoSecundarioElegidoWeb;
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
