import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

import 'package:prlab_flutter/utilidades/widgets/drawer/drawer.dart';

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
      decoration: BoxDecoration(color: colores.onPrimary),
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
            decoration: BoxDecoration(color: colores.onSecondary),
          ),
          PRDrawerListaItems(
            enumDrawer: enumDrawer,
            onTap: (value) {
              setState(() {
                enumDrawer = value;
              });
            },
          ),
          const Spacer(),
          Container(
            height: 1.ph,
            decoration: BoxDecoration(color: colores.onSecondary),
          ),
          SizedBox(
            height: 84.ph,
            child: Align(
              alignment: Alignment.centerLeft,
              child: PRDrawerItem(
                onTap: () {}, // TODO(Anyone): Funcion de deslogueo
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
