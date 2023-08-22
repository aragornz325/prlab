import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/paginas/login/bloc_temporizador/bloc_temporizador.dart';

// !!!
// TODO(anyone): PASAR ESTO AL FACTORY
// !!!

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

    final tooltipMessage = l10n.alertDialogTooltipRequestNewCode(
      widget.segundosFaltantes,
      widget.minutosFaltantes,
    );

    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'^\d+$'),
        ),
      ],
      maxLength: 8,
      keyboardType: TextInputType.number,
      cursorColor: colores.primary,
      onChanged: (value) {
        if (value.isNotEmpty || value != '') {
          context.read<BlocLogin>().add(
                BlocLoginEventoAgregarCodigoAlEstado(codigo: value),
              );
        }
      },
      decoration: InputDecoration(
        counterText: '',
        labelText: l10n.alertDialogTextfieldHitTextTextEmailVerificationCode,
        labelStyle: TextStyle(
          fontSize: 15.pf,
          fontWeight: FontWeight.w400,
          color: colores.secondary,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colores.secondary,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colores.secondary,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 20.ph),
          child: SizedBox(
            width: 100.pw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<BlocLogin, BlocLoginEstado>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: !widget.solicitoNuevoCodigo
                          ? () {
                              context.read<BlocLogin>().add(
                                    BlocLoginEventoEnviarCodigoAlUsuario(
                                      email: state.email,
                                    ),
                                  );
                              context
                                  .read<BlocTemporizador>()
                                  .add(BlocTemporizadorEventoEmpezar());
                            }
                          : null,
                      child: Text(
                        !widget.solicitoNuevoCodigo
                            ? l10n.alertDialogTextfieldSuffixGetCode
                            : l10n.alertDialogTextfieldSuffixCodeSend,
                        style: TextStyle(
                          decoration: TextDecoration.combine([
                            if (!widget.solicitoNuevoCodigo)
                              TextDecoration.underline
                            else
                              TextDecoration.none,
                          ]),
                          color: !widget.solicitoNuevoCodigo
                              ? colores.primary
                              : colores.secondary,
                          fontSize: 12.pf,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
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
                        color: colores.tertiary,
                      ),
                      textStyle: TextStyle(
                        fontSize: 12.pf,
                        fontWeight: FontWeight.w400,
                        color: colores.background,
                      ),
                      message: tooltipMessage,
                      child: Icon(
                        Icons.info,
                        color: colores.tertiary,
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
