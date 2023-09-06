import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
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
    final colores = context.colores;

    final l10n = context.l10n;

    return PRDialog.informacion(
      width: 454.pw,
      context: context,
      titulo: l10n.commonSuccessWithExclamation,
      content: Text(
        l10n.pageRecoverPasswordChangePasswordSuccessDialogDescription,
        style: TextStyle(
          color: colores.secondary,
          fontSize: 15.pf,
          fontWeight: FontWeight.w400,
        ),
      ),
      botonText: l10n.pageRecoverPasswordSuccessDialogButtonText,
      onTap: () => context.router.replace(const RutaLogin()),
    );
  }
}
