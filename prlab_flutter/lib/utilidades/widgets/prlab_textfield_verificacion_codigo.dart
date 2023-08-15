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

    final colores = context.colores;

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
      cursorColor: colores.primary,
      decoration: InputDecoration(
        counterText: '',
        labelText:
            l10n.alert_dialog_textfield_hitText_text_email_verification_code,
        labelStyle: TextStyle(
          fontSize: 15.pf,
          fontWeight: FontWeight.w400,
          //TODO: cambiar para cuando esten los colores en el theme
          color: const Color(0xff707070),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            //TODO: cambiar para cuando esten los colores en el theme
            color: Color(0xff707070),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            //TODO: cambiar para cuando esten los colores en el theme
            color: Color(0xff707070),
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
                          ? colores.primary
                          //TODO: cambiar para cuando esten los colores en el theme
                          : const Color(0xff707070),
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        //TODO: cambiar para cuando esten los colores en el theme
                        color: Color(0xff363636),
                      ),
                      textStyle: TextStyle(
                        fontSize: 12.pf,
                        fontWeight: FontWeight.w400,
                        //TODO: cambiar para cuando esten los colores en el theme
                        color: colores.background,
                      ),
                      message: tooltipMessage,
                      child: const Icon(
                        Icons.info,
                        //TODO: cambiar para cuando esten los colores en el theme
                        color: Color(0xff363636),
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
