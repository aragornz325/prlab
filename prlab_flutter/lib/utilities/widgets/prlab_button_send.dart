import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template PrLabTextfield}
/// Boton que esta en el alertdialog de `PrLab_alertdialog`.
/// con un texto que dice send y por default esta desactivado/inhabilitado.
/// {@endtemplate}
class PrLabButtonSend extends StatelessWidget {
  /// {@macro PrLabTextfield}
  const PrLabButtonSend({
    required this.onPressed,
    super.key,
    this.habilitarColorBoton = false,
  });

  /// bool que habilita los colores de [PrLabButtonSend].
  /// (por default esta en false)
  final bool habilitarColorBoton;

  /// onPressed del boton de [PrLabButtonSend].
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;
    return SizedBox(
      width: 360.pw,
      height: 50.ph,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
            Colors.transparent,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              side: BorderSide(
                color: habilitarColorBoton
                    ? theme.colorScheme.primary
                    : theme.colorScheme.primary.withOpacity(0.3),
                width: 2,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          l10n.alert_dialog_button_title_send,
          style: TextStyle(
            color: habilitarColorBoton
                ? theme.colorScheme.primary
                : theme.colorScheme.primary.withOpacity(0.3),
            fontSize: 20.pf,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
