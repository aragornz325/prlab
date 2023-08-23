import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/theming/base.dart';

// TODO(mati): hacer documentacion
class TituloButtonCreateArticle extends StatelessWidget {
  // TODO(mati): hacer documentacion
  const TituloButtonCreateArticle({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Row(
      children: [
        Icon(
          Icons.article_outlined,
          size: 40.pf,
          color: colores.primary,
        ),
        Text(
          // TODO(mati): hacer que reciba el nombre del articulo a modificar
          'Your articles',
          style: TextStyle(
            fontSize: 30.pf,
            fontWeight: FontWeight.w600,
            color: colores.tertiary,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            SizedBox(
              width: max(140.pw, 140.sw),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: max(30.ph, 30.sh),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(100),
                    ),
                    color: colores.primary,
                  ),
                  child: Center(
                    child: Text(
                      // TODO(mati): hacer l10n
                      'Create an article',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.pf,
                        color: colores.onPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 1.pw,
              height: max(30.ph, 30.sh),
              color: colores.primaryBajaOpacidad,
            ),
            SizedBox(
              height: max(30.ph, 30.sh),
              width: max(40.pw, 40.sw),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: max(30.ph, 30.sh),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(100),
                    ),
                    color: colores.primary,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: colores.onPrimary,
                      size: 24.pf,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
