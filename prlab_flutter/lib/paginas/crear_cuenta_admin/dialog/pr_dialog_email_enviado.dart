import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PRDialogEmailEnviado}
/// Muestra informacion sobre si se mando un email
/// correctamente al usuario y muestra a que email se envio
/// {@endtemplate}
class PRDialogEmailEnviado extends StatelessWidget {
  /// {@macro PRDialogEmailEnviado}
  const PRDialogEmailEnviado({
    required this.email,
    super.key,
  });

  /// email del usuario al cual se le envio la invitación
  final String email;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog.informacion(
      titulo: l10n.pageCreateAdminAlertdialogTitleEmailSend,
      context: context,
      content: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  // TODO(anyone): esto va a definirse por el cliente
                  text: 'An email has been sent to\n',
                  style: TextStyle(
                    color: colores.secondary,
                    fontSize: 15.pf,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  // TODO(anyone): esto va a definirse por el cliente
                  text: '$email \n',
                  style: TextStyle(
                    color: colores.primary,
                    fontSize: 15.pf,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  // TODO(anyone): esto va a definirse por el cliente
                  text: 'Lorem ipsum dolor sit amet consectetur.Tortor\nut '
                      'quis faucibus etiam.Euismod condimentum.',
                  style: TextStyle(
                    color: colores.secondary,
                    fontSize: 15.pf,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () => Navigator.of(context).pop(),
    );
  }
}
