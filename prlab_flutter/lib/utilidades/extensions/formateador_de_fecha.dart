import 'package:flutter/services.dart';

// TODO(Andreas):
// Arreglar este validador de fechas, la idea es hacer un validador
// que solamente permita al usuario poner fechas validas
class FormateadorDeFecha extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return const TextEditingValue();
  }
}
