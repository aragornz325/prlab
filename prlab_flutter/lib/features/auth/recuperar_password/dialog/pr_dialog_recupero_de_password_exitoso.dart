import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PRDialogRecuperoDePasswordExitoso}
/// Muestra un mensaje de felicitaciones cuando el recupero
/// de contraseña se ejecuto de forma exitosa.
/// {@endtemplate}
class PRDialogRecuperoDePasswordExitoso extends StatelessWidget {
  /// {@macro PRDialogRecuperoDePasswordExitoso}
  const PRDialogRecuperoDePasswordExitoso({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return PRDialog.informacion(
      context: context,
      titulo: l10n.commonSuccess,
      content: Text(
        l10n.pageRecoverPasswordChangePasswordSuccessDialogDescription,
      ),
      onTap: () => context.router.replace(const RutaLogin()),
    );
  }
}
