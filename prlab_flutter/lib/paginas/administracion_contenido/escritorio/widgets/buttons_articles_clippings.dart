import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';

// TODO(mati): hacer documentacion
class ButtonsArticlesClippings extends StatelessWidget {
// TODO(mati): hacer documentacion
  const ButtonsArticlesClippings({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.pw,
        vertical: max(20.ph, 20.sh),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Icon(
                  Icons.article_outlined,
                  size: 18.pf,
                  color: colores.primary,
                ),
                SizedBox(width: 5.pw),
                Text(
                  // TODO(mati) hacer l10n
                  'Articles',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.pf,
                    color: colores.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 40.pw),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Icon(
                  Icons.image_outlined,
                  size: 18.pf,
                  color: colores.secondary,
                ),
                SizedBox(width: 5.pw),
                Text(
                  // TODO(mati) hacer l10n
                  'Clippings',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.pf,
                    color: colores.secondary,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
