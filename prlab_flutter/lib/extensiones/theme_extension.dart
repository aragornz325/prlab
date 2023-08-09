import 'package:flutter/material.dart';

///Extension util para declarar una variable y utilizarla de mejor manera
extension ThemeDataX on BuildContext {
  ThemeData get theme => Theme.of(this);
}
