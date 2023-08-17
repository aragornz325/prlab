import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';
import 'package:prlab_flutter/utilidades/extensions/extensions.dart';
import 'package:prlab_flutter/utilidades/funciones/functions.dart';

/// Textformfields base y variantes para uso en PRLab
class PRTextFormField extends StatefulWidget {
  const PRTextFormField({
    required this.controller,
    required this.prefixIcon,
    required this.validator,
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
    super.key,
  });

  /// TFF de email, con dos configuraciones, solo lectura o completable
  factory PRTextFormField.email({
    /// Controller de [PRTextFormField]
    required TextEditingController controller,

    /// Define si el tff es readOnly.
    bool soloLectura = false,

    /// Contexto para traducciones
    required BuildContext context,

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
        } else if (!Validators.emailRegExp.hasMatch(email ?? '')) {
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
        } else if (!Validators.letrasRegExp.hasMatch(value ?? '')) {
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
        } else if (!Validators.dateTimeRegExp.hasMatch(value ?? '')) {
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
        } else if (!Validators.dateTimeRegExp.hasMatch(value ?? '')) {
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
  final IconData prefixIcon;

  /// Icono derecho
  final Widget? suffixIcon;

  /// Color de icono izquierdo
  final Color? prefixIconColor;

  /// Tipo de teclado
  final TextInputType? keyboardType;

  /// Validators para cada textformfield
  final String? Function(String? value) validator;

  /// Funcion onChanged
  final void Function(String)? onChanged;

  /// Ancho del campo de texto.
  final double? width;

  /// Formateadores de texto para ponerle restricciones a el usuario
  /// sobre que tipo de caracteres puede completar en el campo de texto.
  final List<TextInputFormatter>? inputFormatters;

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
        keyboardType: widget.keyboardType ?? TextInputType.none,
        controller: widget.controller,
        readOnly: widget.esSoloLectura,
        style: TextStyle(
          color: widget.esSoloLectura
              ? colores.primaryBajaOpacidad
              : colores.primary,
        ),
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color:
                  widget.esSoloLectura ? colores.primary : colores.onSecondary,
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
                          ? colores.primaryBajaOpacidad
                          : colores.primary,
                ),
                Container(
                  height: 31.5.ph,
                  width: 1.pw,
                  decoration: BoxDecoration(color: colores.onSecondary),
                )
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
      prefixIcon: Icons.lock,
      prefixIconColor:
          widget.controller.text.isEmpty ? colores.primary : colores.secondary,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: _obscureText
            ? Icon(
                Icons.visibility_off_outlined,
                color: colores.primary,
              )
            : Icon(
                Icons.visibility_outlined,
                color: colores.primary,
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

        // TODO(Andre): Cambiar por validacion de contraseña 12 caracteres de Gon.
        if ((value?.length ?? 0) < 12) {
          return 'At least 12 characters';
        }

        if (widget.validator != null) {
          return widget.validator?.call(value);
        }

        return null;
      },
    );
  }
}
