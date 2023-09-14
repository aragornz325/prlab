import 'package:flutter/material.dart';
import 'package:prlab_flutter/theming/esquemas_de_color/colores_default_light_prlab.dart';

/// ColorsScheme base donde se agregan colores custom al tema light.

extension PRLabColorScheme on ColorScheme {
  /// Este color es utilizable en los items del drawer cuando son seleccionados
  Color get primaryOpacidadDiez => themeDefaultPRLab.primary.withOpacity(0.1);

  /// Este color es utilizable en los items del drawer cuando son seleccionados
  Color get primaryOpacidadVeinte => themeDefaultPRLab.primary.withOpacity(0.2);

  /// Este color es utilizable en ciertos backgrounds.
  Color get primaryOpacidadCincuenta =>
      themeDefaultPRLab.primary.withOpacity(0.5);

  /// Este color es utilizable  en botones deshabilitados.
  Color get primaryOpacidadSesenta =>
      themeDefaultPRLab.primary.withOpacity(0.6);

  ///Este color es utilizado para el shimmer de objetos en estado de carga
  Color get surfaceTintOpacidadSetenta =>
      themeDefaultPRLab.surfaceTint.withOpacity(0.7);

  ///Este color es utilizado para el shimmer de objetos en estado de carga
  Color get surfaceTintOpacidadCuarenta =>
      themeDefaultPRLab.surfaceTint.withOpacity(0.4);

  /// Este color es utilizable en textfields deshabilitados.
  Color get secondaryBajaOpacidad =>
      themeDefaultPRLab.secondary.withOpacity(.6);

  /// Este color es utilizable para los BoxShadows.
  Color get negroBajaOpacidad => Colors.black.withOpacity(.25);

  // TODO(anyone): este cambio solamente se implementa en un calendario
  // revisar si aplicarlo directamente al theme o hablarlo con nico
  /// se utiliza para las letras del calendario
  Color get letrasDelCalendario => const Color(0xff262D33);

  /// Este color es utilizado en el gradiente del fondo del container de
  /// busqueda en el home del dashboard
  Color get gradientContainerBusqueda => const Color(0xffEC351D);
}
