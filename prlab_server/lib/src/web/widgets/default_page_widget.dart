import 'package:serverpod/serverpod.dart';

/// Widget (HTML) para la ruta de Serverpod.
class DefaultPageWidget extends Widget {
  /// Constructor del widget. Declara los valores.
  DefaultPageWidget() : super(name: 'default') {
    // ignore: always_specify_types
    values = {
      'served': DateTime.now(),
      'runmode': Serverpod.instance!.runMode,
    };
  }
}
