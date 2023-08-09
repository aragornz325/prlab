import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilities/functions/functions.dart';
import 'package:prlab_flutter/utilities/widgets/widgets.dart';

/// {@template PrLabAlertDialogVerificacionCodigo}
/// Alertdialog que muestra un textfield de 8 digitos
/// y un boton para enviar el codigo.
/// {@endtemplate}
class PrLabDialogVerificacionCodigo extends StatefulWidget {
  /// {@macro PrLabAlertDialogVerificacionCodigo}
  @override
  const PrLabDialogVerificacionCodigo({
    required this.email,
    super.key,
  });

  /// email del usuario al que se le envio el codigo de verificacion.
  final String email;

  @override
  State<PrLabDialogVerificacionCodigo> createState() =>
      _PrLabDialogVerificacionCodigoState();
}

class _PrLabDialogVerificacionCodigoState
    extends State<PrLabDialogVerificacionCodigo> {
  TextEditingController controllerCodigo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final codigoEmail = '${l10n.alert_dialog_sub_title_verification_code_send}'
        ' ${obtenerPrimerasLetrasAntesSimbolo(widget.email)}***@'
        '${obtenerTextoDespuesSimbolo(widget.email)}';

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sw),
      ),
      content: SizedBox(
        height: 282.ph,
        width: 455.pw,
        child: Column(
          children: [
            SizedBox(
              width: 360.pw,
              child: Column(
                children: [
                  SizedBox(height: 40.ph),
                  Text(
                    l10n.alert_dialog_title_recover_password,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.pf,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 40.ph),
                  //TODO: cambiar por los textfield de manu
                  PrLabTextfield(
                    controller: controllerCodigo,
                    solicitoNuevoCodigo: true,
                  ),
                  SizedBox(height: 5.ph),
                  Text(
                    codigoEmail,
                    style: TextStyle(
                      fontSize: 12.pf,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 40.ph),
                  PrLabButtonSend(
                    onPressed: () {
                      //TODO: agregar funcionalidad al boton de enviar
                    },
                    habilitarColorBoton: true,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
