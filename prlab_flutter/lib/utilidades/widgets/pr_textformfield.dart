import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';
import 'package:prlab_flutter/utilidades/funciones/functions.dart';

/// Textformfields base y variantes para uso en PRLab
class PRTextFormField extends StatelessWidget {
  const PRTextFormField({
    required this.controller,
    required this.estaVacio,
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
    super.key,
  });

  /// TFF de email, con dos configuraciones, solo lectura o completable
  factory PRTextFormField.email({
    /// Controller de [PRTextFormField]
    required TextEditingController controller,

    /// Su utilizacion es en onChanged y cambia el color del prefixicon
    required bool estaVacio,

    /// Define si el tff es readOnly.
    required bool soloLectura,

    /// Funcion onChanged
    required void Function(String)? onChanged,

    /// Contexto para traducciones
    required BuildContext context,

    /// Texto interno
    String? hintText,
  }) {
    final l10n = context.l10n;

    return PRTextFormField(
      keyboardType: TextInputType.emailAddress,
      esSoloLectura: soloLectura,
      controller: controller,
      estaVacio: estaVacio,
      hintText: soloLectura ? hintText : l10n.commonEmail,
      prefixIcon: Icons.mail_outlined,
      onChanged: onChanged,
      validator: (email) {
        if (email?.isEmpty ?? false) {
          return l10n.commonCompleteTheField;
        } else if (Validators.emailRegExp.hasMatch(email ?? '')) {
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

    /// Su utilizacion es en onChanged y cambia el color del prefixicon
    required bool estaVacio,

    /// Texto interno
    required String hintText,

    /// Icono izquierdo
    required IconData prefixIcon,

    /// Funcion onChanged
    required void Function(String)? onChanged,

    /// Contexto para traducciones
    required BuildContext context,
  }) {
    final l10n = context.l10n;

    return PRTextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      estaVacio: estaVacio,
      hintText: hintText,
      onChanged: onChanged,
      prefixIcon: prefixIcon,
      validator: (value) {
        if (value?.isEmpty ?? false) {
          return l10n.commonCompleteTheField;
        } else if (Validators.letrasRegExp.hasMatch(value ?? '')) {
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

    /// Su utilizacion es en onChanged y cambia el color del prefixicon
    required bool estaVacio,

    /// Texto interno
    required String hintText,

    /// Icono izquierdo
    required IconData prefixIcon,

    /// Funcion onChanged
    required void Function(String)? onChanged,

    /// Contexto para traducciones
    required BuildContext context,
  }) {
    final l10n = context.l10n;
    return PRTextFormField(
      hintText: hintText,
      keyboardType: TextInputType.datetime,
      controller: controller,
      estaVacio: estaVacio,
      prefixIcon: prefixIcon,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? false) {
          return l10n.commonCompleteTheField;
        } else if (Validators.dateTimeRegExp.hasMatch(value ?? '')) {
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

  /// Su utilizacion es en onChanged y cambia el color del prefixicon
  final bool estaVacio;

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
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.none,
      controller: controller,
      readOnly: esSoloLectura,
      style: TextStyle(
        color: esSoloLectura ? colores.primaryBajaOpacidad : colores.primary,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: esSoloLectura ? colores.primary : colores.onSecondary,
          ),
        ),
        suffixIcon: esPassword ? suffixIcon : null,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.pw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                prefixIcon,
                color: estaVacio
                    ? esSoloLectura
                        ? colores.secondaryBajaOpacidad
                        : colores.secondary
                    : esSoloLectura
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
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
    );
  }
}

/// TFF a utilizarse para contraseñas
class PRTextFormFielPassword extends StatefulWidget {
  const PRTextFormFielPassword({
    required this.controller,
    required this.hintText,
    required this.funcionEnElOnChange,
    this.esCreacionPassword = false,
    this.passwordCoinciden = false,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final bool passwordCoinciden;
  final bool esCreacionPassword;
  final void Function()? funcionEnElOnChange;
  @override
  State<PRTextFormFielPassword> createState() => _PRTextFormFielPasswordState();
}

class _PRTextFormFielPasswordState extends State<PRTextFormFielPassword> {
  bool _obscureText = true;
  bool controllerVacio = true;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return PRTextFormField(
      esPassword: true,
      controller: widget.controller,
      estaVacio: controllerVacio,
      hintText: widget.hintText,
      prefixIcon: Icons.lock,
      prefixIconColor: controllerVacio ? colores.primary : colores.secondary,
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
      onChanged: (_) {
        controllerVacio = widget.controller.text.isEmpty;
        setState(() {});
        widget.funcionEnElOnChange?.call();
      },
      validator: (value) {
        final passwordDoNotMatch = widget.esCreacionPassword &&
            !controllerVacio &&
            !widget.passwordCoinciden;

        if (value?.isEmpty ?? false) {
          return l10n.commonCompleteTheField;
        }
        if (passwordDoNotMatch) {
          return l10n.commonPasswordDoNotMatch;
        }
        return null;
      },
    );
  }
}
