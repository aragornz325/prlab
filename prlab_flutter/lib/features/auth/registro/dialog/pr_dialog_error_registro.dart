import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/constantes/string_constants.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

/// {@template PRDialogError}
/// Muestra un mensaje de error en cualquier caso
/// que ocurra un error cuando el usuario intenta registrarse.
/// {@endtemplate}
class PrDialogErrorRegistro extends StatelessWidget {
  /// {@macro PrDialogErrorRegister}
  const PrDialogErrorRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colores = context.colores;

    /// Uri parseada del url de PRLab
    final urlPRLab = Uri.parse(StringConstants.urlPRLab);

    return PRDialog.informacion(
      botonText: l10n.commonBack,
      context: context,
      onTap: () => Navigator.of(context).pop(),
      titulo: l10n.commonError,
      content: Row(
        children: [
          Text(
            l10n.pageRegisterErrorDialogDescription,
            style: TextStyle(
              fontSize: 15.pf,
              color: colores.secondary,
              fontWeight: FontWeight.w400,
            ),
          ),
          InkWell(
            child: Text(
              StringConstants.urlPRLab,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                fontSize: 15.pf,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () => launchUrl(urlPRLab),
          ),
        ],
      ),
    );
  }
}
