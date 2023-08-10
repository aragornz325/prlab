import 'package:flutter/material.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';

/// La función `getErrorMessage` toma un `BuildContext` y `LoginErrorMessages`
/// y devuelve un mensaje de error basado en el tipo de error dado.
///
/// Args:
/// `BuildContext` es un parámetro que representa el contexto de compilación
/// actual del árbol de widgets.
///
/// loginErrorMessages (LoginErrorMessages): Una enumeración que representa
/// diferentes mensajes de error de inicio de sesión.
///
String getErrorMessage(
  BuildContext context,
  LoginErrorMessages loginErrorMessages,
) {
  final l10n = context.l10n;
  return switch (loginErrorMessages) {
    LoginErrorMessages.invalidCredentials => 'INVALID CREDENTIALS',
    LoginErrorMessages.userNotFoud => l10n.alert_dialgo_code_in,
  };
}
