import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// Header de la pagina de login
class TextoBienvenida extends StatelessWidget {
  const TextoBienvenida({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colores = context.colores;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30.ph),
          child: Image.asset(
            Assets.assets_images_mano_saludando_png,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.pw),
              child: Text(
                l10n.pageLoginGreetings,
                style: TextStyle(
                  color: colores.tertiary,
                  fontSize: 40.pf,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10.ph),
            Text(
              l10n.pageLoginLogInTo,
              style: TextStyle(
                color: colores.secondary,
                fontSize: 15.pf,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 90.pw,
        )
      ],
    );
  }
}
