import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

import 'package:prlab_flutter/utilidades/widgets/drawer/drawer.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PrDrawer}
/// Item disponible a utlizar en PRDrawer
/// {@endtemplate}
class PrDrawer extends StatefulWidget {
  /// {@macro PrDrawer}
  const PrDrawer({super.key});

  @override
  State<PrDrawer> createState() => _PrDrawerState();
}

class _PrDrawerState extends State<PrDrawer> {
  /// "Index" inicial del drawer
  DrawerPage enumDrawer = DrawerPage.home;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;
    return Container(
      height: 832.ph,
      width: 210.pw,
      decoration: BoxDecoration(color: colores.surfaceTint),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 140.ph,
            child: Center(
              child: Image.asset(
                Assets.assets_icons_logo_png,
                fit: BoxFit.cover,
                height: 80.ph,
              ),
            ),
          ),
          Container(
            height: 1.ph,
            decoration: BoxDecoration(color: colores.outlineVariant),
          ),
          PRDrawerListaItems(
            enumDrawer: enumDrawer,
            onTap: (value) {
              setState(() {
                enumDrawer = value;
              });
              switch (value) {
                case DrawerPage.home:
                  context.router.push(const RutaAdministracionMarcas());
                case DrawerPage.projects:
                case DrawerPage.templates:
                  showDialog<void>(
                    context: context,
                    builder: (context) => const PRDialogErrorNoDisponible(),
                  );
              }
            },
          ),
          const Spacer(),
          Container(
            height: 1.ph,
            decoration: BoxDecoration(color: colores.outlineVariant),
          ),
          SizedBox(
            height: 84.ph,
            child: Align(
              alignment: Alignment.centerLeft,
              child: PRDrawerItem(
                onTap: () {
                  // TODO(Anyone): Funcion de deslogueo
                  showDialog<void>(
                    context: context,
                    builder: (context) => const PRDialogErrorNoDisponible(),
                  );
                },
                icono: Icons.logout_outlined,
                tituloItem: l10n.drawerLogOut,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
