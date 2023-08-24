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
    final l10n = context.l10n;

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
        Row(
          children: [
            SizedBox(
              width: max(140.pw, 140.sw),
              child: PopUpMenuVerTareas(
                colorIcon: Colors.blueAccent,
              ),
              // InkWell(
              //   onTap: () => PopUpMenuVerTareas(colorIcon: Colors.black),
              //   child: Container(
              //     height: max(30.ph, 30.sh),
              //     decoration: BoxDecoration(
              //       borderRadius: const BorderRadius.horizontal(
              //         left: Radius.circular(100),
              //       ),
              //       color: colores.primary,
              //     ),
              //     child: Center(
              //       child: Text(
              //         l10n.pageContentAdministrationCreateArticle,
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           fontSize: 15.pf,
              //           color: colores.onPrimary,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
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
                onTap: () {
                  // TODO(anyone): agregarle funcionalidad
                },
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

// TODO cambiar de nombre y hacer documentacion
class PopUpMenuVerTareas extends StatelessWidget {
  const PopUpMenuVerTareas({
    required this.colorIcon,
    super.key,
  });

  ///color del icono
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;

    return PopupMenuButton<int>(
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
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      onSelected: (value) {
        switch (value) {
          case 2:
            break;
          case 3:
            break;
          case 4:
            break;
          case 5:
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          height: 30.ph,
          enabled: false,
          child: Text(
            'Opciones',
            style: TextStyle(
              fontSize: 14.pf,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 2,
          height: 30.ph,
          child: Row(
            children: [
              const Icon(
                Icons.add_circle_outline,
                color: Colors.red,
                size: 20,
              ),
              SizedBox(width: 10.pw),
              Text(
                'Agregar Tarea',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.pf,
                ),
              ),
            ],
          ),
        ),
        const PopupMenuDivider(),
        if (true)
          PopupMenuItem(
            value: 3,
            height: 30.ph,
            child: Row(
              children: [
                const Icon(
                  Icons.settings_outlined,
                  color: Colors.red,
                  size: 20,
                ),
                SizedBox(width: 10.pw),
                Text(
                  'Configuracion del proyecto',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.pf,
                  ),
                ),
              ],
            ),
          ),
        if (true) const PopupMenuDivider(),
        if (true)
          PopupMenuItem(
            value: 4,
            height: 30.ph,
            child: Row(
              children: [
                const Icon(
                  Icons.border_color_outlined,
                  color: Colors.red,
                  size: 20,
                ),
                SizedBox(width: 10.pw),
                Text(
                  'Editar proyecto',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.pf,
                  ),
                ),
              ],
            ),
          ),
        if (true) const PopupMenuDivider(),
      ],
    );
  }
}
