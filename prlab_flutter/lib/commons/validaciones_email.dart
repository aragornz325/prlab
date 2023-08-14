import 'package:prlab_flutter/utilidades/funciones/functions.dart';

class ValidatorsEmail {
  bool validarEmail(String email) {
    return Validators.emailRegExp.hasMatch(email) && email.isNotEmpty;
  }
}
