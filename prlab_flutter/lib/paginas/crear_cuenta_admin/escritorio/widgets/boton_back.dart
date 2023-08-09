import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template PrBotonBack}
/// Boton para regresar
/// {@endtemplate}
class PrBotonBack extends StatelessWidget {
  /// {@macro PrBotonBack}
  @override
  const PrBotonBack({
    required this.onPressed,
    super.key,
  });

  /// Funcion para regresar en el boton de [PrBotonBack]
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final theme = context.theme;

    return Center(
      child: SizedBox(
        width: 200.pw,
        height: 50.pw,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(color: theme.colorScheme.primary),
            ),
          ),
          child: Text(
            l10n.screen_create_admin_account_button_back,
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontSize: 15.pf,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
