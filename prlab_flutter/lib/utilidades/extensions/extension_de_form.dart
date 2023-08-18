import 'package:flutter/material.dart';

extension Validador on GlobalKey<FormState> {
  /// Valida todos los campos de texto dentro del formulario [Form]
  /// vinculado a esta [Key]. Esta función verifica si se cumplen
  /// los requisitos establecidos por los validadores individuales
  /// de cada campo de texto.
  ///
  /// Si algún campo de texto en el formulario no cumple con las
  /// condiciones especificadas, la validación falla y los mensajes
  /// de error asociados a cada campo son activados, basados en las
  /// condiciones definidas por los validadores (callbacks presentes
  /// en los [TextFormField]s).

  bool get esFormularioValido => currentState?.validate() ?? false;
}
