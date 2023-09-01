import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PopUpMenuAgregarPagina}
/// Se utiliza para mostrar un menú con diferentes
/// opciones cuando el usuario lo toca y esas opciones son agregar pagina
/// de cobertura,  pagina de metricas y pagina de rendimiento.
/// {@endtemplate}
class PopUpMenuAgregarPagina extends StatelessWidget {
  /// {@macro PopUpMenuAgregarPagina}
  const PopUpMenuAgregarPagina({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return PopupMenuButton<int>(
      offset: const Offset(-7, -165),
      color: colores.onPrimary,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      onSelected: (value) {
        switch (value) {
          // TODO(anyone): agregarle funcionalidad
          case 1:
            showDialog<void>(
              context: context,
              builder: (context) => const PRDialogErrorNoDisponible(),
            );
          case 2:
            showDialog<void>(
              context: context,
              builder: (context) => const PRDialogErrorNoDisponible(),
            );
          case 3:
            showDialog<void>(
              context: context,
              builder: (context) => const PRDialogErrorNoDisponible(),
            );
          default:
            showDialog<void>(
              context: context,
              builder: (context) => const PRDialogErrorNoDisponible(),
            );
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          height: max(40.ph, 40.sh),
          child: Text(
            l10n.pageEditContentArticleTitleCoveragePage,
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
            l10n.pageEditContentArticleTitleMetricsPage,
            style: TextStyle(
              fontSize: 14.pf,
              color: colores.tertiary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        PopupMenuItem(
          value: 3,
          height: max(
            40.ph,
            40.sh,
          ),
          child: Text(
            l10n.pageEditContentArticleTitlePerformancePage,
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
            width: max(
              96.pw,
              96.sw,
            ),
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
                  l10n.commonAddPage,
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
            height: max(
              30.ph,
              30.sh,
            ),
            // TODO(anyone): sacar linea blanca
            color: colores.tertiaryContainer,
          ),
          SizedBox(
            height: max(
              30.ph,
              30.sh,
            ),
            width: max(
              42.pw,
              42.sw,
            ),
            child: Container(
              height: max(
                30.ph,
                30.sh,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(100),
                ),
                color: colores.primary,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_drop_down_rounded,
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
