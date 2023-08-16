import 'package:flutter/material.dart';
import 'package:prlab_flutter/theming/esquemas_de_color/colores_debug.dart';

/// Tema utilizado para debuguear componentes de un widget e identificar el
/// orden de colores
final temaDebug = ThemeData.from(
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Raleway',
    ),
  ),
  colorScheme: coloresDebug,
  useMaterial3: true,
);
