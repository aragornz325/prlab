import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template PrLabAlertDialogEmailEnviado}
/// Alert dialog de Pr Lab del email enviado si el state/estado es exitoso
/// donde muestra un texto con el email al usuario enviado para crear una
/// cuenta admin.
/// {@endtemplate}
class PrLabAlertDialogEmailEnviado extends StatelessWidget {
  /// {@macro PrLabAlertDialogEmailEnviado}
  @override
  const PrLabAlertDialogEmailEnviado({
    required this.email,
    super.key,
  });

  /// email al cual fue enviado [PrLabAlertDialogEmailEnviado]
  final String email;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sw),
      ),
      content: SizedBox(
        height: 285.ph,
        width: 455.pw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20.ph),
            Text(
              l10n.screen_create_admin_alertdialog_title_email_send,
              style: TextStyle(
                color: const Color(0xff363636),
                fontSize: 20.pf,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30.ph),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    //TODO: esto va a definirse por el cliente
                    text: 'An email has been sent to\n',
                    style: TextStyle(
                      color: const Color(0xff707070),
                      fontSize: 15.pf,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    //TODO: esto va a definirse por el cliente
                    text: '$email \n',
                    style: TextStyle(
                      color: const Color(0xffA12B46),
                      fontSize: 15.pf,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    //TODO: esto va a definirse por el cliente
                    text: 'Lorem ipsum dolor sit amet consectetur.Tortor\nut '
                        'quis faucibus etiam.Euismod condimentum.',
                    style: TextStyle(
                      color: const Color(0xff707070),
                      fontSize: 15.pf,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.ph),
            Center(
              child: SizedBox(
                width: 360.pw,
                height: 50.pw,
                child: ElevatedButton(
                  onPressed: () {
                    //TODO: agregarle funcionalidad
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(
                        color: Color(0xffA12B46),
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    l10n.screen_create_admin_alertdialog_button_ok,
                    style: TextStyle(
                      color: const Color(0xffA12B46),
                      fontSize: 15.pf,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
