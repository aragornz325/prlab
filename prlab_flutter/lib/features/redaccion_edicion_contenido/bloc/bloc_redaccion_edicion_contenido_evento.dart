part of 'bloc_redaccion_edicion_contenido.dart';

/// {@template BlocKcyEvento}
/// Maneja el formulario de información del usuario
/// en el momento subsiguiente a que se crea una cuenta.
/// {@endtemplate}
@immutable
sealed class BlocRedaccionEdicionContenidoEvento {}

/// {@template BlocRedaccionEdicionContenidoEventoInicializar}
/// Inserta los valores que se completaron en el formulario,
/// guardados dentro del estado dentro de la informacion
/// del usuario en la base de datos.
/// {@endtemplate}
class BlocRedaccionEdicionContenidoEventoInicializar
    extends BlocRedaccionEdicionContenidoEvento {
  /// {@macro BlocKycEventoInsertarInformacionDeKyc}
  BlocRedaccionEdicionContenidoEventoInicializar();
}
