import 'package:flutter/material.dart';
import 'package:prlab_flutter/theming/esquemas_de_color/colores_default_light_prlab.dart';

/// ColorsScheme base donde se agregan colores custom.

extension PRLabColorScheme on ColorScheme {
  Color get primaryBajaOpacidad => themeDefaultPRLab.primary.withOpacity(0.6);
  Color get secondaryBajaOpacidad =>
      themeDefaultPRLab.secondary.withOpacity(.6);
}
