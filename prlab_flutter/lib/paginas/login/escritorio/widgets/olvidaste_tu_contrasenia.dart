import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// Texto clickeable que se muestra en la seccion de login
class OlvidasteTuContrasenia extends StatelessWidget {
  const OlvidasteTuContrasenia({
    this.email = 'asd@asdas.com',
    super.key,
  });
  final String email;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final theme = context.esquemaDeColores;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.ph),
      child: GestureDetector(
        onTap: () {
          // TODO(Gon): Agregar el push cuando este hecha la view
          showDialog<void>(
            context: context,
            builder: (context) {
              return PrLabDialogVerificacionCodigo(
                email: email,
              );
            },
          );
        },
        child: Text(
          l10n.page_login_tappable_text,
          style: TextStyle(
            color: theme.primary,
            fontSize: 12.pf,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
