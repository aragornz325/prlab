import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/drawer/drawer.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';

/// Enum utilizado para indexar cada item del drawer.
enum DrawerPage {
  home,
  projects,
  templates;

  bool get esHome => this == DrawerPage.home;
  bool get esProjects => this == DrawerPage.projects;
  bool get esTemplates => this == DrawerPage.templates;
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
          height: 10.ph,
        ),
        PRDrawerItem(
          onTap: () {
            // TODO(anyone): Descomentar cuando haya una page de projects
            // onTap(DrawerPage.projects);

            showDialog<void>(
              context: context,
              builder: (context) => const PRDialogErrorNoDisponible(),
            );
          },
          icono: Icons.folder_open_outlined,
          tituloItem: l10n.drawerProjects,
          estaSeleccionado: enumDrawer.esProjects,
        ),
        SizedBox(
          height: 10.ph,
        ),
        PRDrawerItem(
          onTap: () {
            // TODO(anyone): Descomentar cuando haya una page de templates
            // onTap(DrawerPage.templates);

            showDialog<void>(
              context: context,
              builder: (context) => const PRDialogErrorNoDisponible(),
            );
          },
          icono: Icons.space_dashboard_outlined,
          tituloItem: l10n.drawerTemplates,
          estaSeleccionado: enumDrawer.esTemplates,
        ),
      ],
    );
  }
}
