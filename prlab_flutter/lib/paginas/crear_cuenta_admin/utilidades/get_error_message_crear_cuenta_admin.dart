import 'package:flutter/material.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/crear_cuenta_admin/bloc/bloc_crear_cuenta_admin.dart';

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
String getErrorMessageCreateAccountAdmin(
  BuildContext context,
  BlocCrearCuentaAdminStateErrorMessage loginErrorMessages,
) {
  final l10n = context.l10n;
  return switch (loginErrorMessages) {
    BlocCrearCuentaAdminStateErrorMessage.errorToSendEmail =>
      l10n.page_create_account_admin_error_message_send_email,
    BlocCrearCuentaAdminStateErrorMessage.errorToChangeEmail =>
      l10n.page_create_account_admin_error_message_change_email,
  };
}
