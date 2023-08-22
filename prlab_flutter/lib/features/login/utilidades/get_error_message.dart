import 'package:flutter/material.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/features/login/bloc/bloc_login.dart';

/// La función `getErrorMessage` toma un `context` y `loginErrorMessage`
/// y devuelve un mensaje de error basado en el tipo de error dado.
String getErrorMessage(
  BuildContext context,
  MensajesDeErrorDelLogin loginErrorMessage,
) {
  final l10n = context.l10n;
  return switch (loginErrorMessage) {
    MensajesDeErrorDelLogin.invalidCredentials =>
      l10n.pageLoginErrorInvalidCredentials,
    MensajesDeErrorDelLogin.userNotFound => l10n.pageLoginErrorUserNotFound,
    MensajesDeErrorDelLogin.userCreationDenied =>
      l10n.pageLoginErrorUserCreationDenied,
    MensajesDeErrorDelLogin.internalError => l10n.pageLoginErrorInternalError,
    MensajesDeErrorDelLogin.tooManyFailedAttempts =>
      l10n.pageLoginErrorTooManyFailedAttempts,
    MensajesDeErrorDelLogin.unknown => l10n.pageLoginErrorUnknown,
  };
}
