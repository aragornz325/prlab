import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_responsive/full_responsive.dart';

import 'package:prlab_flutter/extensiones/extensiones.dart';

import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/prlab_configuracion/base.dart';
import 'package:prlab_flutter/theming/base.dart';

import 'package:prlab_flutter/utilidades/funciones/functions.dart';

/// Textformfields base y variantes para uso en PRLab
class PRTextFormField extends StatefulWidget {
  const PRTextFormField({
    required this.controller,
    this.prefixIcon,
    this.validator,
    this.hintText,
    this.esSoloLectura = false,
    this.esPassword = false,
    this.obscureText = false,
    this.prefixIconColor,
    this.suffixIcon,
    this.onChanged,
    this.keyboardType,
    this.width,
    this.inputFormatters,
    this.maxLength,
    this.cursorColor,
    this.decoration,
    super.key,
  });

  /// TFF de verificar el codigo mandado para recuperar la contraseña o
  /// cambiarla por una nueva
  factory PRTextFormField.verificacionCodigo({
    /// Controller de [PRTextFormField]
    required TextEditingController controller,

    /// Contexto para traducciones
    required BuildContext context,

    /// validator de [PRTextFormField]
    String? Function(String?)? validator,

    // ignore: inference_failure_on_function_return_type
    Function(String)? onChanged,

    /// cantidad de minutos faltantes
    int minutosFaltantes = 30,

    /// cantidad de segundos faltantes
    int segundosFaltantes = 60,

    /// si ya se envio un nuevo codigo
    bool solicitoNuevoCodigo = false,

    /// Ancho del campo de texto.
    double? width,

    /// widget de obtener nuevo codigo
    Widget? widgetDeSuffix,
  }) {
    final colores = context.colores;

    final l10n = context.l10n;

    final tooltipMessage = l10n.alertDialogTooltipRequestNewCode(
      segundosFaltantes,
      minutosFaltantes,
    );

    return PRTextFormField(
      width: width,
      controller: controller,
      validator: validator,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'^\d+$'),
        ),
      ],
      maxLength: 8,
      keyboardType: TextInputType.number,
      cursorColor: colores.primary,
      onChanged: onChanged,
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
                widgetDeSuffix ?? const SizedBox(),
                ...[
                  if (solicitoNuevoCodigo)
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

  /// TFF de email, con dos configuraciones, solo lectura o completable
  factory PRTextFormField.email({
    /// Controller de [PRTextFormField]
    required TextEditingController controller,

    /// Contexto para traducciones
    required BuildContext context,

    /// Define si el tff es readOnly.
    bool soloLectura = false,

    /// Funcion onChanged
    void Function(String)? onChanged,

    /// Texto interno
    String? hintText,

    /// Ancho del campo de texto.
    double? width,
  }) {
    final l10n = context.l10n;

    return PRTextFormField(
      width: width,
      keyboardType: TextInputType.emailAddress,
      esSoloLectura: soloLectura,
      controller: controller,
      hintText: soloLectura ? hintText : l10n.commonEmail,
      prefixIcon: Icons.mail_outlined,
      onChanged: onChanged,
      validator: (email) {
        if (email?.isEmpty ?? false) {
          return l10n.commonCompleteTheField;
        } else if (!ExpresionRegular.emailRegExp.hasMatch(email ?? '')) {
          return l10n.commonEnterValidEmail;
        }
        return null;
      },
    );
  }

  /// TFF utilizable para nombre y apellido.
  /// Iconos a utilizar:
  /// Name/Last name: Icons.person_outlined
  /// Company: Icons.apartment
  /// Company location: Icons.location_on_outlined
  factory PRTextFormField.soloLetras({
    /// Controller de [PRTextFormField]
    required TextEditingController controller,

    /// Texto interno
    required String hintText,

    /// Icono izquierdo
    required IconData prefixIcon,

    /// Contexto para traducciones
    required BuildContext context,

    /// Funcion onChanged
    void Function(String)? onChanged,

    /// Ancho del campo de texto.
    double? width,
  }) {
    final l10n = context.l10n;

    return PRTextFormField(
      width: width,
      keyboardType: TextInputType.text,
      controller: controller,
      hintText: hintText,
      onChanged: onChanged,
      prefixIcon: prefixIcon,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[0-9]'))],
      validator: (value) {
        if (value?.isEmpty ?? false) {
          return l10n.commonCompleteTheField;
        } else if (!ExpresionRegular.letrasRegExp.hasMatch(value ?? '')) {
          return l10n.commonOnlyLetters;
        }

        return null;
      },
    );
  }

  /// TFF a utilizar en caso de necesitarse informacion numerica.
  /// Contact: Icons.call_outlined
  /// Birthdate: Icons.calendar_month_outlined
  factory PRTextFormField.soloNumeros({
    /// Controller de [PRTextFormField]
    required TextEditingController controller,

    /// Texto interno
    required String hintText,

    /// Icono izquierdo
    required IconData prefixIcon,

    /// Contexto para traducciones
    required BuildContext context,

    /// Funcion onChanged
    void Function(String)? onChanged,

    /// Ancho del campo de texto.
    double? width,
  }) {
    final l10n = context.l10n;
    return PRTextFormField(
      width: width,
      hintText: hintText,
      keyboardType: TextInputType.number,
      controller: controller,
      prefixIcon: prefixIcon,
      onChanged: onChanged,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]'))],
      validator: (value) {
        if (value?.isEmpty ?? false) {
          return l10n.commonCompleteTheField;
        } else if (!ExpresionRegular.dateTimeRegExp.hasMatch(value ?? '')) {
          return l10n.commonInvalidCharacters;
        }

        return null;
      },
    );
  }

  /// TFF utilizable para manejar campo de texto que contengan fechas.
  /// Icono izquierdo por defecto:
  /// Icons.calendar_month_outlined
  factory PRTextFormField.fecha({
    /// Controller de [PRTextFormField]
    required TextEditingController controller,

    /// Texto interno
    required String hintText,

    /// Contexto para traducciones
    required BuildContext context,

    /// Icono izquierdo
    IconData prefixIcon = Icons.calendar_month_outlined,

    /// Funcion onChanged
    void Function(String)? onChanged,

    /// Ancho del campo de texto.
    double? width,
  }) {
    final l10n = context.l10n;

    return PRTextFormField(
      width: width,
      keyboardType: TextInputType.datetime,
      controller: controller,
      hintText: hintText,
      onChanged: onChanged,
      prefixIcon: prefixIcon,
      inputFormatters: [FormateadorDeFecha()],
      validator: (value) {
        if (value?.isEmpty ?? false) {
          return l10n.commonCompleteTheField;
        } else if (!ExpresionRegular.dateTimeRegExp.hasMatch(value ?? '')) {
          return l10n.commonInvalidCharacters;
        }
        return null;
      },
    );
  }

  /// Controller de [PRTextFormField]
  final TextEditingController controller;

  /// Define si el tff es readOnly.
  final bool esSoloLectura;

  /// Identifica si se trata de un textformfield orientado a contraseñas
  final bool esPassword;

  /// Define si los caracteres son ocultos
  final bool obscureText;

  /// Texto interno
  final String? hintText;

  /// Icono izquierdo
  final IconData? prefixIcon;

  /// Icono derecho
  final Widget? suffixIcon;

  /// Color de icono izquierdo
  final Color? prefixIconColor;

  /// Tipo de teclado
  final TextInputType? keyboardType;

  /// Validators para cada textformfield
  final String? Function(String? value)? validator;

  /// Funcion onChanged
  final void Function(String)? onChanged;

  /// Ancho del campo de texto.
  final double? width;

  /// Formateadores de texto para ponerle restricciones a el usuario
  /// sobre que tipo de caracteres puede completar en el campo de texto.
  final List<TextInputFormatter>? inputFormatters;

  /// Máximo de caracteres a poner
  final int? maxLength;

  /// color del cursor al estar escribiendo
  final Color? cursorColor;

  /// Decoración del textfield
  final InputDecoration? decoration;

  @override
  State<PRTextFormField> createState() => _PRTextFormFieldState();
}

class _PRTextFormFieldState extends State<PRTextFormField> {
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return SizedBox(
      width: widget.width?.sw ?? 360.sw,
      child: TextFormField(
        cursorColor: widget.cursorColor,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType ?? TextInputType.none,
        controller: widget.controller,
        readOnly: widget.esSoloLectura,
        style: TextStyle(
          color: widget.esSoloLectura
              ? colores.primaryOpacidadSesenta
              : colores.primary,
          fontSize: 15.pf,
        ),
        inputFormatters: widget.inputFormatters,
        decoration: widget.decoration ??
            InputDecoration(
              hintText: widget.hintText,
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: widget.esSoloLectura
                      ? colores.primary
                      : colores.onSecondary,
                ),
              ),
              suffixIcon: widget.esPassword ? widget.suffixIcon : null,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.pw),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.prefixIcon,
                      color: widget.controller.text.isEmpty
                          ? widget.esSoloLectura
                              ? colores.secondaryBajaOpacidad
                              : colores.secondary
                          : widget.esSoloLectura
                              ? colores.primaryOpacidadSesenta
                              : colores.primary,
                      size: 25.pf,
                    ),
                    SizedBox(
                      width: 5.ph,
                    ),
                    Container(
                      height: 31.5.ph,
                      width: 1.pw,
                      decoration: BoxDecoration(color: colores.onSecondary),
                    ),
                  ],
                ),
              ),
            ),
        validator: widget.validator,
        onChanged: (value) {
          setState(() {
            widget.onChanged?.call(value);
          });
        },
        obscureText: widget.obscureText,
      ),
    );
  }
}

/// TFF a utilizarse para contraseñas
class PRTextFormFieldPassword extends StatefulWidget {
  const PRTextFormFieldPassword({
    required this.controller,
    required this.hintText,
    this.esCreacionPassword = false,
    this.onChanged,
    this.width = 359,
    this.validator,
    super.key,
  });
  final void Function(String? value)? onChanged;
  final TextEditingController controller;
  final String hintText;
  final bool esCreacionPassword;
  final double width;
  final String? Function(String? value)? validator;

  @override
  State<PRTextFormFieldPassword> createState() =>
      _PRTextFormFieldPasswordState();
}

class _PRTextFormFieldPasswordState extends State<PRTextFormFieldPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return PRTextFormField(
      esPassword: true,
      width: widget.width,
      controller: widget.controller,
      hintText: widget.hintText,
      prefixIcon: Icons.lock_outline,
      prefixIconColor:
          widget.controller.text.isEmpty ? colores.primary : colores.secondary,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: _obscureText
            ? Icon(
                Icons.visibility_off_outlined,
                color: colores.primary,
                size: 25.pf,
              )
            : Icon(
                Icons.visibility_outlined,
                color: colores.primary,
                size: 25.pf,
              ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
      onChanged: (value) {
        setState(() {});
        widget.onChanged?.call(value);
      },
      validator: (value) {
        if (value?.isEmpty ?? false) {
          return l10n.commonCompleteTheField;
        }

        if ((value?.length ?? 0) <
            PRLabConfiguracion.minimoDeCaracteresPassword) {
          return l10n.commonMinimumCharactersForAPassword;
        }

        if (widget.validator != null) {
          return widget.validator?.call(value);
        }

        return null;
      },
    );
  }
}
