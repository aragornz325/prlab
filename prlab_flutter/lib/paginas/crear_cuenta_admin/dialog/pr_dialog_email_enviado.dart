import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PRDialogEmailEnviado}
/// PRDialog tiene diferentes tipos de dialog/popup como solicitar la acción
/// del usuario, mostrar información, mostrar advertencias o
/// indicar errores.
/// {@endtemplate}
class PRDialogEmailEnviado extends StatelessWidget {
  /// {@macro PRDialogEmailEnviado}
  const PRDialogEmailEnviado({
    required this.email,
    super.key,
  });

  /// String del email del usuario al cual se le envio la invitación
  final String email;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return PRDialog.informacion(
      titulo: l10n.page_create_admin_alertdialog_title_email_send,
      context: context,
      content: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  // TODO: esto va a definirse por el cliente
                  text: 'An email has been sent to\n',
                  style: TextStyle(
                    color: const Color(0xff707070),
                    fontSize: 15.pf,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  // TODO: esto va a definirse por el cliente
                  text: '$email \n',
                  style: TextStyle(
                    color: colores.primary,
                    fontSize: 15.pf,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  // TODO: esto va a definirse por el cliente
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
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
