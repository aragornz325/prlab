class StringConstants {
  static const String mailPRLab = 'prlab@prlab.co';

  /// Contiene un valor por defecto para la creación de articulos
  ///
  /// Este valor por defecto esta en formato json y fue
  /// sacado de el tipo de documento que genera el paquete
  /// `appflowy_editor` que es el que se utiliza para la
  /// edición del contenido de articulo.
  static const String contenidoDeArticuloPorDefectoJson =
      // ignore: lines_longer_than_80_chars
      '{"document":{"type":"page","children":[{"type":"paragraph","data":{"delta":[]}}]}}';
}
