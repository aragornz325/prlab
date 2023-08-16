import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/funciones/functions.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PRDialogVerificacionCodigo}
/// PRDialog tiene de dialog/popup como solicitar la acción al usuario de
/// completar un campo con un codigo de 8 dígitos y validar dicho código.
/// {@endtemplate}
class PRDialogVerificacionCodigo extends StatelessWidget {
  /// {@macro PRDialogVerificacionCodigo}
  const PRDialogVerificacionCodigo({
    required this.controller,
    required this.email,
    super.key,
  });

  /// email del usuario al cual se le envio la invitación
  final String email;

  /// controller del alertdialog
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final textoAQuienFueEnviadoEmail =
        '${l10n.alert_dialog_sub_title_verification_code_send}'
        ' ${obtenerPrimerasLetrasAntesSimbolo(email)}***@'
        '${obtenerTextoDespuesSimbolo(email)}';

    return PRDialog.solicitudAccion(
      height: 270.ph,
      context: context,
      onTap: () {
        Navigator.of(context).pop();
      },
      titulo: l10n.alert_dialog_title_recover_password,
      content: Column(
        children: [
          PrLabTextfield(controller: controller),
          SizedBox(height: 5.ph),
          Text(
            textoAQuienFueEnviadoEmail,
            style: TextStyle(
              fontSize: 12.pf,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
