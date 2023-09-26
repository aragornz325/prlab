import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/drawer/drawer.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';

/// Enum utilizado para indexar cada item del drawer.
enum DrawerPage {
  home,
  brands,
  articles,
  mediaDatabase,
  metrics;

  bool get esHome => this == DrawerPage.home;
  bool get esBrands => this == DrawerPage.brands;
  bool get esArticles => this == DrawerPage.articles;
  bool get esMediaDatabase => this == DrawerPage.mediaDatabase;
  bool get esMetrics => this == DrawerPage.metrics;
}

/// {@template PRDrawerListaItems}
/// Lista con los Items utilizados para PRDrawer
/// {@endtemplate}
class PRDrawerListaItems extends StatelessWidget {
  /// {@macro PRDrawerListaItems}

  const PRDrawerListaItems({
    required this.onTap,
    required this.enumDrawer,
    super.key,
  });

  /// Funcion utilizada para enviar y recibir un value de tipo DrawePage.
  final void Function(DrawerPage value) onTap;

  /// Enum requerido utilizado para definir si esta seleccionado el item.
  final DrawerPage enumDrawer;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PRDrawerItem(
          onTap: () => onTap(DrawerPage.home),
          icono: Icons.cottage_outlined,
          tituloItem: l10n.drawerHome,
          estaSeleccionado: enumDrawer.esHome,
        ),
        SizedBox(
          height: max(10.ph, 10.sh),
        ),
        PRDrawerItem(
          onTap: () => onTap(DrawerPage.brands),
          icono: Icons.workspace_premium_outlined,
          tituloItem: l10n.commonBrand,
          estaSeleccionado: enumDrawer.esBrands,
        ),
        SizedBox(
          height: max(10.ph, 10.sh),
        ),
        PRDrawerItem(
          onTap: () => onTap(DrawerPage.articles),
          icono: Icons.article_outlined,
          tituloItem: l10n.commonArticles,
          estaSeleccionado: enumDrawer.esArticles,
        ),
        SizedBox(
          height: max(10.ph, 10.sh),
        ),
        PRDrawerItem(
          onTap: () => onTap(DrawerPage.mediaDatabase),
          icono: Icons.explore_outlined,
          tituloItem: l10n.prAppBarCoverageMediaDbMedia,
          estaSeleccionado: enumDrawer.esMediaDatabase,
        ),
        SizedBox(
          height: max(10.ph, 10.sh),
        ),
        PRDrawerItem(
          onTap: () {
            // TODO(anyone): Descomentar cuando este la page de metricas
            // onTap(DrawerPage.metrics);

            const PRDialogErrorNoDisponible().show(context);
          },
          icono: Icons.leaderboard_outlined,
          tituloItem: l10n.commonMetrics,
          estaSeleccionado: enumDrawer.esMetrics,
        ),
      ],
    );
  }
}
