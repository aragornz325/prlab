import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// Texto clickeable que se muestra en la seccion de login
class OlvidasteTuContrasenia extends StatelessWidget {
  const OlvidasteTuContrasenia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colores = context.colores;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.ph),
      child: GestureDetector(
        onTap: () {
          // TODO(Gon): Agregar el push cuando este hecha la view
        },
        child: Text(
          l10n.pageLoginTappableText,
          style: TextStyle(
            color: colores.primary,
            fontSize: 12.pf,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
