import 'package:flutter/material.dart';

// TODO(Manu): agregar cuadno diseño tenga asignados los colores restantes

/// Esquema de colores a utilizar en el theme light
const themeDefaultPRLab = ColorScheme.light(
  surfaceTint: Colors.white,

  /// Color principal de la paleta de colores.
  //! se usa para el focus del textfield
  primary: Color(0xFFA12B46),

  /// Color que va a tomar por ejemplo los textos de los ElevatedButton
  // ignore: avoid_redundant_argument_values
  onPrimary: Colors.white,

  /// Color a utilizarse en textos con link vinculado.
  primaryContainer: Color(0xFF0094E7),

  /// Color de background por defecto.
  background: Color(0xFFF7F7F7),

  /// Color a utilizarse en subtitulos y textos.
  secondary: Color(0xff707070),

  /// Color utilizado en divider de TextFormField y readOnly.
  onSecondary: Color(0xffd9d9d9),

  /// Color utilizado en titulos y ToolTip
  tertiary: Color(0xff363636),

  /// Color utilizado para notificar error.
  error: Color(0xffE00707),

  //! se utiliza en los unFocus de los textfield
  outline: Color(0xffd9d9d9),

  //! se utiliza para el hover de los textfield
  onSurface: Color(0xFFA12B46),

  //TODO(Manu): esto es para el divider de drawer, cambiar todos los onsecondary usados en componentes por outlineVariant
  outlineVariant: Color(0xffd9d9d9),
);
