import 'package:flutter/material.dart';

// TODO(Seba):
// Unificar las extensiones en una, dejar el naming en español,
// dejar la carpeta extensions por fuera de utilidades.

/// Extension util para declarar una variable y acceder al contenido ahorrando
/// codigo. Asignar nombre "COLORES" para utilizarla y mantener una
/// estructura consistente
extension ThemeDataX on BuildContext {
  ColorScheme get colores => Theme.of(this).colorScheme;
}
