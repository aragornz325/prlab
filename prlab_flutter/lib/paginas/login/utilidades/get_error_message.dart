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
    MensajesDeErrorDelLogin.invalidCredentials =>
      l10n.login_error_invalid_credentials,
    MensajesDeErrorDelLogin.userNotFound => l10n.login_error_user_not_found,
    MensajesDeErrorDelLogin.userCreationDenied =>
      l10n.login_error_user_creation_denied,
    MensajesDeErrorDelLogin.internalError => l10n.login_error_internal_error,
    MensajesDeErrorDelLogin.tooManyFailedAttempts =>
      l10n.login_error_too_many_failed_attempts,
    MensajesDeErrorDelLogin.unknown => l10n.login_error_desconocido,
  };
}
