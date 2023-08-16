import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/utilidades/funciones/functions.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

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
    required this.content,
    super.key,
    this.esCargando = false,
    this.height = 290,
    this.width = 455,
  });

  /// Alertdialog que muestra un textfield de 8 dígitos
  /// y un boton para enviar el código.
  factory PRDialog.recuperarContrasenia({
    required String email,
    required String password,
    required TextEditingController controllerCodigo,
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
                TextfieldCodigoDeRecuperarContrasenia(
                  controller: controllerCodigo,
                  email: email,
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
                BlocBuilder<BlocLogin, BlocLoginEstado>(
                  builder: (context, state) {
                    return PRBoton.outlined(
                      width: 360.pw,

                      // TODO(anyone): Agregarle funcionalidad del bloc
                      habilitado: state.estaCodigoCargado,
                      onTap: () {
                        context.read<BlocLogin>().add(
                              BlocLoginEventoEnviarCodigoAlBack(
                                password: password,
                                email: email,
                                codigo: controllerCodigo.text,
                              ),
                            );
                      },
                      texto: l10n.alert_dialog_button_title_send,
                    );
                  },
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
              color: colores.tertiary,
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
          SizedBox(height: 30.ph),
          Center(
            child: PRBoton.outlined(
              onTap: () {
                // TODO(anyone): agregarle funcionalidad
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

    final colores = context.colores;

    return PRDialog(
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
                // TODO(anyone): cambiar cuando este el theme
                color: esError ? colores.error : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.ph),
            SizedBox(
              width: 360.pw,
              child: Text(
                esError
                    ? mensajeError ?? l10n.alert_dialog_button_title_error
                    : l10n.alert_dialog_button_subtitle_link_expired,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.pf,
                  // TODO(anyone): cambiar cuando este el theme
                  color: colores.secondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 20.ph),
            Center(
              child: SizedBox(
                width: 360.pw,
                child: PRBoton.outlined(
                  onTap: () {
                    // TODO(anyone): agregarle funcionalidad
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

  /// bool de que si es cargando [PRDialog].(default: false)
  final bool esCargando;

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
    return AlertDialog(
      backgroundColor: Colors.white,
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

class TextfieldCodigoDeRecuperarContrasenia extends StatefulWidget {
  const TextfieldCodigoDeRecuperarContrasenia({
    required this.controller,
    required this.email,
    super.key,
  });
  final TextEditingController controller;
  final String email;

  @override
  State<TextfieldCodigoDeRecuperarContrasenia> createState() =>
      _TextfieldCodigoDeRecuperarContraseniaState();
}

class _TextfieldCodigoDeRecuperarContraseniaState
    extends State<TextfieldCodigoDeRecuperarContrasenia> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<BlocLogin>().state;
    return PrLabTextfield(
      controller: widget.controller,
      solicitoNuevoCodigo: state is BlocLoginEstadoCronometroCorriendo,
      email: widget.email,
      segundosFaltantes: state.duracionTimer,
    );
  }
}
