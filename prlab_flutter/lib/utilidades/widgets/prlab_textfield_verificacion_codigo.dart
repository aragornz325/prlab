import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template PrLabTextfield}
/// Textfield de `PrLab` en `recover password` aparece en el alertdialog de
/// `Prlab_alertdialog`.
/// {@endtemplate}
class PrLabTextfield extends StatefulWidget {
  /// {@macro PrLabTextfield}
  const PrLabTextfield({
    required this.controller,
    this.validator,
    this.minutosFaltantes = 30,
    this.segundosFaltantes = 60,
    this.solicitoNuevoCodigo = false,
    super.key,
  });

  /// controller de [PrLabTextfield].
  final TextEditingController controller;

  /// validator de [PrLabTextfield].
  final String? Function(String?)? validator;

  /// bool para saber si solicito un nuevo codigo [PrLabTextfield].
  /// (por default esta en false)
  final bool solicitoNuevoCodigo;

  /// int total para saber cuando se puede solicitar un nuevo codigo
  /// [PrLabTextfield].(por default esta en 60)
  final int segundosFaltantes;

  /// int total para que se solicite un nuevo codigo [PrLabTextfield].
  /// (por default esta en 30)
  final int minutosFaltantes;
  @override
  State<PrLabTextfield> createState() => _PrLabTextfieldState();
}

class _PrLabTextfieldState extends State<PrLabTextfield> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final theme = context.esquemaDeColores;

    final tooltipMessage = l10n.alert_dialog_tooltip_request_new_code(
      widget.segundosFaltantes,
      widget.minutosFaltantes,
    );

    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+$')),
      ],
      maxLength: 8,
      keyboardType: TextInputType.number,
      cursorColor: theme.primary,
      decoration: InputDecoration(
        counterText: '',
        labelText:
            l10n.alert_dialog_textfield_hitText_text_email_verification_code,
        labelStyle: TextStyle(
          fontSize: 15.pf,
          fontWeight: FontWeight.w400,
          color: theme.secondary,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.secondary,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.secondary,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 20.ph),
          child: SizedBox(
            width: widget.solicitoNuevoCodigo ? 76.pw : 55.pw,
            child: Row(
              children: [
                InkWell(
                  onTap: !widget.solicitoNuevoCodigo
                      ? () {
                          //TODO: funcion para cuando aprete el boton de Get code
                          Navigator.pop(context);
                        }
                      : null,
                  child: Text(
                    !widget.solicitoNuevoCodigo
                        ? l10n.alert_dialog_textfield_suffix_get_code
                        : l10n.alert_dialog_textfield_suffix_get_code,
                    style: TextStyle(
                      decoration: TextDecoration.combine([
                        if (!widget.solicitoNuevoCodigo)
                          TextDecoration.underline
                        else
                          TextDecoration.none,
                      ]),
                      color: !widget.solicitoNuevoCodigo
                          ? theme.primary
                          : theme.secondary,
                      fontSize: 12.pf,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ...[
                  if (widget.solicitoNuevoCodigo)
                    Tooltip(
                      textAlign: TextAlign.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.pw,
                        vertical: 10.ph,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: theme.tertiary,
                      ),
                      textStyle: TextStyle(
                        fontSize: 12.pf,
                        fontWeight: FontWeight.w400,
                        color: theme.background,
                      ),
                      message: tooltipMessage,
                      child: Icon(
                        Icons.info,
                        color: theme.tertiary,
                        size: 12.5,
                      ),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
