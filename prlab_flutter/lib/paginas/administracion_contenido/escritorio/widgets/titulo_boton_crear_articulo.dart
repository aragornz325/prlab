import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';

// TODO(mati): hacer documentacion
class TituloBotonCrearArticulo extends StatelessWidget {
  // TODO(mati): hacer documentacion
  const TituloBotonCrearArticulo({
    required this.nombreArticulo,
    super.key,
  });
  final String? nombreArticulo;

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
          // TODO(anyone): hacer que reciba el nombre del articulo o hacer l10n
          nombreArticulo ?? 'Your articles',
          style: TextStyle(
            fontSize: 30.pf,
            fontWeight: FontWeight.w600,
            color: colores.tertiary,
          ),
        ),
        const Spacer(),
        const PopUpMenuCrearArticulo()
      ],
    );
  }
}

// TODO cambiar de nombre y hacer documentacion y separar en otro widget aparte
class PopUpMenuCrearArticulo extends StatelessWidget {
  const PopUpMenuCrearArticulo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return PopupMenuButton<int>(
      offset: const Offset(-20, 35),
      color: colores.onPrimary,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      onSelected: (value) {
        switch (value) {
          // TODO(mati): cambiar esto a funcion en flecha
          case 1:
            break;
          case 2:
            break;
          case 3:
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          height: max(40.ph, 40.sh),
          child: Text(
            // TODO(mati): hacer l10n
            'A Single article',
            style: TextStyle(
              fontSize: 14.pf,
              color: colores.tertiary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        PopupMenuItem(
          value: 2,
          height: max(40.ph, 40.sh),
          child: Text(
            // TODO(mati): hacer l10n
            'By brand',
            style: TextStyle(
              fontSize: 14.pf,
              color: colores.tertiary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        PopupMenuItem(
          value: 3,
          height: max(40.ph, 40.sh),
          child: Text(
            // TODO(mati): hacer l10n
            'Use template',
            style: TextStyle(
              fontSize: 14.pf,
              color: colores.tertiary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
      child: Row(
        children: [
          SizedBox(
            width: max(140.pw, 140.sw),
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
                  l10n.pageContentAdministrationCreateArticle,
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
          Container(
            width: 1.pw,
            height: max(30.ph, 30.sh),
            color: colores.primaryBajaOpacidad,
          ),
          SizedBox(
            height: max(30.ph, 30.sh),
            width: max(40.pw, 40.sw),
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
        ],
      ),
    );
  }
}
