import 'package:flutter/material.dart';

extension Validador on GlobalKey<FormState> {
  bool get esValido => currentState?.validate() ?? false;
}
