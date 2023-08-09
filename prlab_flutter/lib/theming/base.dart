import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:prlab_flutter/theming/esquemas_de_color/colores_default_light_prlab.dart';

///Theme base del que saldran los temas light, dark, etc.

//TODO: Editable cuando nico disponga
extension PRLabTheme on ThemeData {
  ThemeData get prLab {
    return ThemeData.from(
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
      ),
      colorScheme: coloresDefaultPRLab,
      useMaterial3: true,
    );
  }
}
