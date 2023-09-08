import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';

/// {@template PrDialogRegistroExitoso}
/// Muestra un mensaje de exito cuando el usuario logra registrarse
/// correctamente luego de ingresar sus datos KYC y presionar boton "Continue".
/// {@endtemplate}
class PrDialogRegistroExitoso extends StatelessWidget {
  /// {@macro PrDialogRegistroExitoso}
  const PrDialogRegistroExitoso({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog.informacion(
      context: context,
      onTap: () => context.router.replace(
        const RutaDashboard(),
      ),
      titulo: l10n.commonSuccessWithExclamation,
      botonText: l10n.pageKYCSuccessDialogButtonText,
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
