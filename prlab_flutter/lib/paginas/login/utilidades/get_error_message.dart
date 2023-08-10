import 'package:flutter/material.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';

/// La función `getErrorMessage` toma un `context` y `loginErrorMessage`
/// y devuelve un mensaje de error basado en el tipo de error dado.
String getErrorMessage(
  BuildContext context,
  LoginErrorMessages loginErrorMessage,
) {
  final l10n = context.l10n;
  return switch (loginErrorMessage) {
    LoginErrorMessages.invalidCredentials => 'INVALID CREDENTIALS',
    LoginErrorMessages.userNotFoud => l10n.alert_dialgo_code_in,
  };
}
