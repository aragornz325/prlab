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

  final String descripcionDeArticulo;
}
