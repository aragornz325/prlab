import 'package:flutter/material.dart';
import 'package:prlab_flutter/theming/esquemas_de_color/colores_default_light_prlab.dart';

/// Tema base del proyecto PRLab, con colores asignados por diseño
final temaPorDefectoPRLab = ThemeData.from(
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Raleway',
    ),
  ),
  colorScheme: themeDefaultPRLab,
  useMaterial3: true,
);

// TODO(Manu): Arreglar cuando nico tenga la idea generada.

// ThemeData? _temaPorDefectoPRLab;

// ThemeData get temaPorDefectoPRLab {
//   if (_temaPorDefectoPRLab != null) {
//     return _temaPorDefectoPRLab!;
//   }

//   _temaPorDefectoPRLab = ThemeData.from(
//     textTheme: const TextTheme(
//       displayLarge: TextStyle(
//         fontFamily: 'Raleway',
//       ),
//     ),
//     colorScheme: themeDefaultPRLab,
//     useMaterial3: true,
//   );
//   _temaPorDefectoPRLab = _temaPorDefectoPRLab!.copyWith(
//     tabBarTheme: _temaPorDefectoPRLab!.tabBarTheme.copyWith(
//       labelColor: themeDefaultPRLab.primary.withOpacity(.2),
//     ),
//   );
//   return _temaPorDefectoPRLab!;
// }
