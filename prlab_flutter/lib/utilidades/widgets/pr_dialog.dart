import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/funciones/functions.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PrLabDialog}
/// PrLabDialog es un popup que tiene dos factory uno para ingresar el codigo de
/// 8 digitos
/// y un boton para enviar el codigo
///
/// el otro del email enviado si el state/estado es exitoso
/// donde muestra un texto con el email al usuario enviado para crear una
/// cuenta admin.
/// {@endtemplate}
class PRDialog extends StatefulWidget {
  /// {@macro PrLabDialog}
  @override
  const PRDialog({
    required this.content,
    super.key,
    this.height = 285,
    this.width = 455,
  });

  /// Alertdialog que muestra un textfield de 8 digitos
  /// y un boton para enviar el codigo.
  factory PRDialog.recuperarContrasenia({
    required AppLocalizations l10n,
    required String email,
    required TextEditingController controller,
  }) {
    final codigoEmail = '${l10n.alert_dialog_sub_title_verification_code_send}'
        ' ${obtenerPrimerasLetrasAntesSimbolo(email)}***@'
        '${obtenerTextoDespuesSimbolo(email)}';

    return PRDialog(
      content: Column(
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
                  controller: controller,
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
                PRBoton.outlined(
                  width: 360.pw,

                  ///TODO:agregarle funcionalidad del bloc
                  habilitado: true,
                  onTap: () {
                    ///TODO:agregarle funcionalidad del bloc
                  },
                  texto: l10n.alert_dialog_button_title_send,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Alert dialog de Pr Lab del email enviado si el state/estado es exitoso
  /// donde muestra un texto con el email al usuario enviado para crear una
  /// cuenta admin.
  factory PRDialog.emailEnviado({
    required AppLocalizations l10n,
    required BuildContext context,
    required String email,
  }) {
    final theme = context.theme.colorScheme;

    return PRDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20.ph),
          Text(
            l10n.page_create_admin_alertdialog_title_email_send,
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
                    color: theme.primary,
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
                  backgroundColor: theme.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(
                      color: theme.primary,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  l10n.page_create_admin_alertdialog_button_ok,
                  style: TextStyle(
                    color: theme.primary,
                    fontSize: 15.pf,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// contenido del alertdialog normal de [PRDialog].
  final Widget content;

  /// height del alertdialog [PRDialog].(default: 285)
  final int height;

  /// width del alertdialog [PRDialog].(default: 455)
  final int width;

  @override
  State<PRDialog> createState() => _PRDialogState();

  Future<void> show<T, R>(
    BuildContext context, {
    Bloc<T, R>? bloc,
  }) async =>
      showDialog(
        context: context,
        builder: (_) {
          if (bloc == null) return this;
          return BlocProvider.value(
            value: bloc,
            child: this,
          );
        },
      );
}

class _PRDialogState extends State<PRDialog> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.colorScheme;

    return AlertDialog(
      backgroundColor: theme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sw),
      ),
      content: SizedBox(
        height: widget.height.ph,
        width: widget.width.pw,
        child: widget.content,
      ),
    );
  }
}