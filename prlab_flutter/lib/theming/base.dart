import 'package:flutter/material.dart';
import 'package:prlab_flutter/theming/esquemas_de_color/colores_default_light_prlab.dart';

/// ColorsScheme base donde se agregan colores custom al tema light.

extension PRLabColorScheme on ColorScheme {
  /// Este color es utilizable  en botones deshabilitados.
  Color get primaryMediaOpacidad => themeDefaultPRLab.primary.withOpacity(0.6);

  /// Este color es utilizable en backgrounds de componentes cuando se requiere
  /// el color primario atenuado.
  Color get primaryAltaOpacidad => themeDefaultPRLab.primary.withOpacity(0.2);

  /// Este color es utilizable en textfields deshabilitados.
  Color get secondaryBajaOpacidad =>
      themeDefaultPRLab.secondary.withOpacity(.6);

  /// Este color es utilizable para los BoxShadows.
  Color get negroBajaOpacidad => Colors.black.withOpacity(.25);
}
