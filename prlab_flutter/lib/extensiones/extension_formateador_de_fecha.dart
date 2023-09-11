import 'package:flutter/services.dart';

/// {@template formateador_de_fecha}
/// Formatea el campo de texto para adaptar lo
/// que se escribe y lo adapta a estilo fecha.
///
/// Ex:
/// dd/mm/yyyy
/// 31/01/2000
/// {@endtemplate}
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

/// La clase `PhoneNumberFormatter` es un `TextInputFormatter` personalizado en
///  Dart que se utiliza para
/// formatear números de teléfono. Anula el método `formatEditUpdate` para
/// formatear el texto de entrada
/// a medida que el usuario escribe.
class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length > oldValue.text.length) {
      // Elimina todos los caracteres que no son dígitos
      var cleanedText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

      // Formatea el número telefónico
      final formattedText = formatPhoneNumber(cleanedText);

      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }

    return newValue;
  }

  String formatPhoneNumber(String phoneNumber) {
    // Elimina espacios en blanco
    phoneNumber = phoneNumber.replaceAll(' ', '');

    // Formato: NNNNNNNNNN
    final length = phoneNumber.length;
    if (length <= 3) {
      return phoneNumber;
    } else if (length <= 6) {
      return '${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3)}';
    } else if (length <= 9) {
      return '${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    }

    // Si el número es muy largo, no hace nada
    return '${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6, 9)} ${phoneNumber.substring(9)}';
  }
}
