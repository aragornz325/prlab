import 'package:flutter/material.dart';

extension Validador on GlobalKey<FormState> {
  // TODO(Andreas): Agregar documentacion de que pingo hace
  bool get esValido => currentState?.validate() ?? false;
}
