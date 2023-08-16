import 'package:flutter/services.dart';

class FormateadorDeFecha extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length > oldValue.text.length &&
        newValue.text.isNotEmpty &&
        oldValue.text.isNotEmpty) {
      if (RegExp('[^0-9/]').hasMatch(newValue.text)) return oldValue;

      if (newValue.text.length > 10) return oldValue;

      if (newValue.text.length == 2 || newValue.text.length == 5) {
        final valorFormateado = '${newValue.text}/';

        return TextEditingValue(
          text: valorFormateado,
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + 1,
          ),
        );
      } else if (newValue.text.length == 3 && newValue.text[2] != '/') {
        final valorFormateado =
            '${newValue.text.substring(0, 2)}/${newValue.text.substring(2)}';

        return TextEditingValue(
          text: valorFormateado,
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + 1,
          ),
        );
      } else if (newValue.text.length == 6 && newValue.text[5] != '/') {
        final valorFormateado =
            '${newValue.text.substring(0, 5)}/${newValue.text.substring(5)}';

        return TextEditingValue(
          text: valorFormateado,
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + 1,
          ),
        );
      }
    } else if (newValue.text.length == 1 &&
        oldValue.text.isEmpty &&
        RegExp('[^0-9]').hasMatch(newValue.text)) {
      return oldValue;
    }

    return newValue;
  }
}
