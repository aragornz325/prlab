import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/funciones/functions.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

enum TipoDialog {
  /// este tipo de dialog/popup se usan para pedirle al usuario algo.como una verificacion de codigo
  solicitudAccion,

  ///
  advertencia,

  ///
  informacion,

  ///
  error,
}

/// {@template PrLabDialog}
/// PrLabDialog es un popup que tiene dos factory uno para ingresar el código de
/// 8 dígitos
/// y un boton para enviar el código.
///
/// el otro del email enviado si el state/estado es exitoso
/// donde muestra un texto con el email al usuario enviado para crear una
/// cuenta admin.
/// {@endtemplate}

class PRDialog extends StatefulWidget {
  /// {@macro PrLabDialog}
  @override
  const PRDialog({
    required this.tipo,
    required this.content,
    super.key,
    this.height = 285,
    this.width = 455,
  });

  factory PRDialog.solicitudAccion({
    required String titulo,
    required Widget content,
  }) {
    return PRDialog(
      tipo: TipoDialog.solicitudAccion,
      content: content,
    );
  }


  factory PRDialog.informacion({

  }) {
    return PRDialog(
      tipo: TipoDialog.informacion,
      content: Column(),
    );
  }

  factory PRDialog.advertencia({
    required BuildContext context,
    required VoidCallback onTap,
    required String titulo,
    required String textoDeAdvertencia,
  }) {
   final l10n = context.l10n;

    return PRDialog(
      tipo: TipoDialog.advertencia,
      content: SizedBox(
        width: 360.pw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20.ph),
            Text(
             // l10n.alert_dialog_button_subtitle_something_went_wrong,
              titulo,
              style: TextStyle(
                fontSize: 20.pf,
                // TODO: cambiar cuando este el theme
                color:  Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30.ph),
            SizedBox(
              width: 360.pw,
              child: Text(
                // l10n.alert_dialog_button_subtitle_link_expired,
                textoDeAdvertencia,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.pf,
                  // TODO: cambiar cuando este el theme
                  color: Color(0xff707070),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 30.ph),
            Center(
              child: SizedBox(
                width: 360.pw,
                child: PRBoton.outlined(
                  onTap: onTap,
                  texto: l10n.alert_dialog_button_title_button_resend,
                  habilitado: true,
                  width: 360.pw,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  factory PRDialog.error({required BuildContext context,}) {
    final l10n = context.l10n;

    return PRDialog(
      tipo: TipoDialog.error,
      content: SizedBox(
        width: 360.pw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20.ph),
            Text(
               l10n.alert_dialog_button_title_error,
              style: TextStyle(
                fontSize: 20.pf,
                // TODO: cambiar cuando este el theme
                color:  Color(0xffE00707),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30.ph),
            SizedBox(
              width: 360.pw,
              child: Text(
                l10n.alert_dialog_button_title_error,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.pf,
                  // TODO: cambiar cuando este el theme
                  color: Color(0xff707070),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 30.ph),
            Center(
              child: SizedBox(
                width: 360.pw,
                child: PRBoton.outlined(
                  onTap: () {
                    // TODO: agregarle funcionalidad
                    Navigator.of(context).pop();
                  },
                  texto: esError
                      ? l10n.page_create_admin_account_button_back
                      : l10n.alert_dialog_button_title_button_resend,
                  habilitado: true,
                  width: 360.pw,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Alertdialog que muestra un textfield de 8 dígitos
  /// y un boton para enviar el código.
  factory PRDialog.recuperarContrasenia({
    required String email,
    required TextEditingController controller,
    required BuildContext context,
  }) {
    final l10n = context.l10n;

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
                PRTextFormField.email(
                  controller: controller,
                  // TODO: cambiar por los propiedades del alertdialog/popup de manu
                  estaVacio: false,
                  soloLectura: false,
                  onChanged: (p0) {},
                  context: context,
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

                  // TODO:agregarle funcionalidad del bloc
                  habilitado: true,
                  onTap: () {
                    // TODO:agregarle funcionalidad del bloc
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
    required BuildContext context,
    required String email,
  }) {
    final l10n = context.l10n;

    final colores = context.colores;

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
            child: PRBoton.outlined(
              onTap: () {
                // TODO: agregarle funcionalidad
                Navigator.of(context).pop();
              },
              texto: l10n.page_create_admin_alertdialog_button_ok,
              habilitado: true,
              width: 360.pw,
            ),
          ),
        ],
      ),
    );
  }

  /// Alert dialog que muestra un error en caso de que esError devuelva true
  /// muestra error donde le podes pasar por parámetros el mensajeError
  factory PRDialog.error({
    required BuildContext context,
    required bool esError,
    String? mensajeError,
  }) {
    final l10n = context.l10n;

    return PRDialog(
      tipo: TipoDialog.error,
      content: SizedBox(
        width: 360.pw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20.ph),
            Text(
              esError
                  ? l10n.alert_dialog_button_title_error
                  : l10n.alert_dialog_button_subtitle_something_went_wrong,
              style: TextStyle(
                fontSize: 20.pf,
                // TODO: cambiar cuando este el theme
                color: esError ? Color(0xffE00707) : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30.ph),
            SizedBox(
              width: 360.pw,
              child: Text(
                esError
                    ? mensajeError ?? l10n.alert_dialog_button_title_error
                    : l10n.alert_dialog_button_subtitle_link_expired,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.pf,
                  // TODO: cambiar cuando este el theme
                  color: Color(0xff707070),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 30.ph),
            Center(
              child: SizedBox(
                width: 360.pw,
                child: PRBoton.outlined(
                  onTap: () {
                    // TODO: agregarle funcionalidad
                    Navigator.of(context).pop();
                  },
                  texto: esError
                      ? l10n.page_create_admin_account_button_back
                      : l10n.alert_dialog_button_title_button_resend,
                  habilitado: true,
                  width: 360.pw,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// contenido del alertdialog normal de [PRDialog].
  final Widget content;

  /// height del alertdialog [PRDialog].(default: 285)
  final int height;

  /// width del alertdialog [PRDialog].(default: 455)
  final int width;

  final TipoDialog tipo;
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
    final colores = context.colores;

    return AlertDialog(
      backgroundColor: colores.background,
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
