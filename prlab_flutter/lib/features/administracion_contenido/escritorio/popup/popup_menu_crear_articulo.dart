import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';

/// {@template PopUpMenuOpcionesAlCrearArticulo}
/// Se utiliza para mostrar un menú con diferentes
/// opciones cuando el usuario lo toca y esas opciones son para crear un nuevo
/// artículo como un solo articulo,por marca o por usar una plantilla
/// {@endtemplate}
class PopUpMenuOpcionesAlCrearArticulo extends StatelessWidget {
  /// {@macro PopUpMenuOpcionesAlCrearArticulo}
  const PopUpMenuOpcionesAlCrearArticulo({
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
          // TODO(mati): cambiar esto a funcion en flecha cuando tenga funcionalidad
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
            'A single article',
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

      // boton crear artículo
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
            color: colores.primaryOpacidadSesenta,
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