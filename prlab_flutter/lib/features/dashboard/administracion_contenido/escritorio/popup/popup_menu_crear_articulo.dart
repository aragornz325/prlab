import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/bloc/bloc_dashboard.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PopUpMenuOpcionesAlCrearArticulo}
/// Se utiliza para mostrar un menú con diferentes
/// opciones cuando el usuario lo toca y esas opciones son para crear un nuevo
/// artículo como un solo articulo,por marca o por usar una plantilla
/// {@endtemplate}
class PopUpMenuOpcionesAlCrearArticulo extends StatefulWidget {
  /// {@macro PopUpMenuOpcionesAlCrearArticulo}
  const PopUpMenuOpcionesAlCrearArticulo({
    super.key,
  });

  @override
  State<PopUpMenuOpcionesAlCrearArticulo> createState() =>
      _PopUpMenuOpcionesAlCrearArticuloState();
}

class _PopUpMenuOpcionesAlCrearArticuloState
    extends State<PopUpMenuOpcionesAlCrearArticulo> {
  bool estaDesplegado = false;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return PopupMenuButton<int>(
      onOpened: () {
        setState(() {
          estaDesplegado = true;
        });
      },
      onCanceled: () {
        setState(() {
          estaDesplegado = false;
        });
      },
      offset: const Offset(-20, 35),
      color: colores.surfaceTint,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.sw),
        ),
      ),
      onSelected: (value) {
        switch (value) {
          // TODO(anyone): agregarle funcionalidad
          // TODO(anyone): manejar esto por tipos de enum
          case 1:
            context
                .read<BlocDashboard>()
                .add(BlocDashboardEventoCrearArticulo());
          case 2:
          case 3:
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
            l10n.pageContentAdministrationPopupASingleArticle,
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
            l10n.pageContentAdministrationPopupByBrand,
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
            l10n.pageContentAdministrationPopupUseTemplate,
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
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(100.sw),
                ),
                color: colores.primary,
              ),
              child: Center(
                child: Text(
                  l10n.pageContentAdministrationCreateArticle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.pf,
                    color: colores.surfaceTint,
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
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(100.sw),
                ),
                color: colores.primary,
              ),
              child: Center(
                child: Icon(
                  estaDesplegado
                      ? Icons.arrow_drop_up_outlined
                      : Icons.arrow_drop_down_outlined,
                  color: colores.surfaceTint,
                  size: 24.pw,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
