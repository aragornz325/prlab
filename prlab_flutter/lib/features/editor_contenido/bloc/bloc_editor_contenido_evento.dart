part of 'bloc_editor_contenido.dart';

/// {@template BlocKcyEvento}
/// Maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
@immutable
sealed class BlocEditorContenidoEvento {}

/// {@template BlocEditorContenidoEventoInicializar}
/// Inserta los valores que se completaron en el formulario,
/// guardados dentro del estado dentro de la informacion
/// del usuario en la base de datos.
/// {@endtemplate}
class BlocEditorContenidoEventoInicializar extends BlocEditorContenidoEvento {
  /// {@macro BlocKycEventoInsertarInformacionDeKyc}
  BlocEditorContenidoEventoInicializar();
}
