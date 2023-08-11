import 'package:flutter/material.dart';

/// Extension util para declarar una variable y utilizarla de mejor manera
extension ThemeDataX on BuildContext {
  ColorScheme get esquemaDeColores => Theme.of(this).colorScheme;
}
