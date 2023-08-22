import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';

/// {@template PRDialogError}
/// Muestra un mensaje de error en cualquier caso
/// que ocurra un error cuando el usuario intenta registrarse.
/// {@endtemplate}
class PrDialogRegistroExitoso extends StatelessWidget {
  /// {@macro PrDialogErrorRegister}
  const PrDialogRegistroExitoso({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colores = context.colores;
    return PRDialog.informacion(
      context: context,
      onTap: () => context.router.replace(
        const RutaLogin(),
      ),
      titulo: l10n.commonSuccessWithExclamation,
      botonText: l10n.pageRegisterErrorDialogButtonText,
      content: Text(
        l10n.pageKYCSuccessDialogDescription,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.pf,
          color: colores.secondary,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
