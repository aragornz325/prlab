import 'package:flutter/material.dart';

/// ColorsScheme base donde se agregan colores custom al tema light.

extension PRLabColorScheme on ColorScheme {
  /// Este color es utilizable en los items del drawer cuando son seleccionados
  Color get primaryOpacidadDiez => primary.withOpacity(0.1);

  /// Este color es utilizable en los items del drawer cuando son seleccionados
  Color get primaryOpacidadVeinte => primary.withOpacity(0.2);

  /// Este color es utilizable en ciertos backgrounds.
  Color get primaryOpacidadCincuenta => primary.withOpacity(0.5);

  /// Este color es utilizable  en botones deshabilitados.
  Color get primaryOpacidadSesenta => primary.withOpacity(0.6);

  ///Este color es utilizado para el shimmer de objetos en estado de carga
  Color get surfaceTintOpacidadSetenta => surfaceTint.withOpacity(0.7);

  ///Este color es utilizado para el shimmer de objetos en estado de carga
  Color get surfaceTintOpacidadCuarenta => surfaceTint.withOpacity(0.4);

  /// Este color es utilizable en textfields deshabilitados.
  Color get secondaryBajaOpacidad => secondary.withOpacity(.6);

  /// Este color es utilizable para los BoxShadows.
  Color get negroBajaOpacidad => Colors.black.withOpacity(.25);

  // TODO(anyone): este cambio solamente se implementa en un calendario
  // revisar si aplicarlo directamente al theme o hablarlo con nico
  /// se utiliza para las letras del calendario
  Color get letrasDelCalendario => const Color(0xff262D33);

  // TODO(anyone): descifrar en que parte del theme se debe colocar este color.
  Color get iconoPaginaInicio => const Color(0xFFF4AB3D);

  // TODO(anyone): descifrar en que parte del theme se debe colocar este color.
  Color get subordinado => const Color(0xFFE7E2C4);

  // TODO(anyone): descifrar en que parte del theme se debe colocar este color.
  Color get subordinadoOpacidadCincuenta => subordinado.withOpacity(.5);
}
