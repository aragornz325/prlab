import 'package:prlab_client/prlab_client.dart';

/// {@template PeriodistaX}
/// Extensiones utiles para el uso de datos de los periodistas
/// {@endtemplate}
extension PeriodistaX on Periodista {
  /// Nombre completo del usuario
  String get nombreCompleto => '$nombres $apellidos';

  /// Devuelve la localidad de un [Periodista] en formato 'pais, ciudad'.
  String get localizacion => '$pais, $ciudad';

  /// Devuelve la lista de idiomas de un [Periodista],
  /// en formato 'idioma1, idioma2'.
  String get listaLenguajes => idiomas.join(', ');
}
