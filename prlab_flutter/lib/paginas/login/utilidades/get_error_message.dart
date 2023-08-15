import 'package:flutter/material.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';

/// La función `getErrorMessage` toma un `context` y `loginErrorMessage`
/// y devuelve un mensaje de error basado en el tipo de error dado.
String getErrorMessage(
  BuildContext context,
  MensajesDeErrorDelLogin loginErrorMessage,
) {
  final l10n = context.l10n;
  return switch (loginErrorMessage) {
    MensajesDeErrorDelLogin.invalidCredentials => 'INVALID CREDENTIALS',
    MensajesDeErrorDelLogin.userNotFound => l10n.alert_dialgo_code_in,
    MensajesDeErrorDelLogin.unknown => l10n.alert_dialgo_code_in,
    MensajesDeErrorDelLogin.userCreationDenied => l10n.alert_dialgo_code_in,
    MensajesDeErrorDelLogin.internalError => l10n.alert_dialgo_code_in,
    MensajesDeErrorDelLogin.tooManyFailedAttempts => l10n.alert_dialgo_code_in,
  };
}
