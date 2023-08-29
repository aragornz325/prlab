import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/constantes/string_constants.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';

/// {@template PrDialogErrorRegistro}
/// Muestra un mensaje de error en cualquier caso
/// que ocurra un error cuando el usuario intenta registrarse.
/// {@endtemplate}
class PrDialogErrorRegistro extends StatelessWidget {
  /// {@macro PrDialogErrorRegistro}
  const PrDialogErrorRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colores = context.colores;

    return PRDialog.informacion(
      botonText: l10n.commonBack,
      context: context,
      onTap: () => Navigator.of(context).pop(),
      titulo: l10n.commonError,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: l10n.pageRegisterErrorDialogDescription,
                    style: TextStyle(
                      fontSize: 15.pf,
                      color: colores.secondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: StringConstants.mailPRLab,
                    style: TextStyle(
                      color: colores.primaryContainer,
                      decorationColor: colores.primaryContainer,
                      decoration: TextDecoration.underline,
                      fontSize: 15.pf,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
