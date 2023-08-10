import 'package:flutter/material.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/crear_cuenta_admin/bloc/bloc_crear_cuenta_admin.dart';

/// La función getErrorMessage toma un context y loginErrorMessage
/// y devuelve un mensaje de error basado en el tipo de error dado.
String getErrorMessageCreateAccountAdmin(
  BuildContext context,
  BlocCrearCuentaAdminEstadoFallidoMensaje loginErrorMessages,
) {
  final l10n = context.l10n;
  return switch (loginErrorMessages) {
    BlocCrearCuentaAdminEstadoFallidoMensaje.errorToSendEmail =>
      l10n.page_create_account_admin_error_message_send_email,
    BlocCrearCuentaAdminEstadoFallidoMensaje.errorToChangeEmail =>
      l10n.page_create_account_admin_error_message_change_email,
  };
}