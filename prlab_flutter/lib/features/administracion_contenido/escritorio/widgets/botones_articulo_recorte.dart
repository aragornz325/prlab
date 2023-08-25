import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template BotonesArticulosYRecorte}
/// Son dos botones de `artículos` y `recorte` donde se tendría que navegar
/// entre dos vistas.
/// {@endtemplate}
class BotonesArticulosYRecorte extends StatelessWidget {
  /// {@macro BotonesArticulosYRecorte}
  const BotonesArticulosYRecorte({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.pw,
        vertical: max(20.ph, 20.sh),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              // TODO(anyone): agregarle funcionalidad
            },
            child: Row(
              children: [
                Icon(
                  Icons.article_outlined,
                  size: 18.pf,
                  color: colores.primary,
                ),
                SizedBox(width: 5.pw),
                Text(
                  l10n.commonArticle,
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
            onTap: () {
              // TODO(anyone): agregarle funcionalidad
            },
            child: Row(
              children: [
                Icon(
                  Icons.image_outlined,
                  size: 18.pf,
                  color: colores.secondary,
                ),
                SizedBox(width: 5.pw),
                Text(
                  l10n.pageContentAdministrationButtonNavegationClippings,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.pf,
                    color: colores.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
