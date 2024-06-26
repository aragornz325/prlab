import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template TextoBienvenida}
/// Header de la pagina de login donde se muestra el logo y
/// eslogan de la empresa
/// {@endtemplate}
class TextoBienvenida extends StatelessWidget {
  /// {@macro TextoBienvenida}
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
        Center(
          child: SizedBox(
            child: Image.asset(
              Assets.assets_images_mano_saludando_png,
              height: max(280.ph, 280.sh),
              width: 110.pw,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          height: max(200.ph, 200.sh),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
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
              SizedBox(height: max(10.ph, 10.sh)),
              Text(
                l10n.pageLoginLogInTo,
                style: TextStyle(
                  color: colores.secondary,
                  fontSize: 15.pf,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: max(20.ph, 20.sh)),
            ],
          ),
        ),
        SizedBox(
          width: 130.pw,
        ),
      ],
    );
  }
}
