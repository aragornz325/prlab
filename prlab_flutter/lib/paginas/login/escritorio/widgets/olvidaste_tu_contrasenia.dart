import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// Texto clickeable que se muestra en la seccion de login
class OlvidasteTuContrasenia extends StatelessWidget {
  const OlvidasteTuContrasenia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.ph),
      child: GestureDetector(
        onTap: () {
          // TODO(Gon): Agregar el push cuando este hecha la view
        },
        child: Text(
          l10n.screen_login_tappable_text,
          style: TextStyle(
            color: const Color(0xffA12B46),
            fontSize: 12.pf,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
