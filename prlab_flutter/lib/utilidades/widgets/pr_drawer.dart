import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template PRDrawer}
/// Barra de navegacion lateral en versiones tanto para celular como version web
/// {@endtemplate}
class PRDrawer extends StatelessWidget {
  /// {@macro PRDrawer}
  const PRDrawer({
    required this.esVersionCelular,
    super.key,
  });

  /// Este Booleano va a definir si el drawer es utilizado en celular o
  /// version de escritorio
  final bool esVersionCelular;
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;

    /// Variable utilizada para separar items
    final espacio = SizedBox(height: 30.ph);
    return Drawer(
      backgroundColor: colores.onPrimary,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colores.onPrimary,
            ),
            child: Center(
              child: Image.asset(
                Assets.assets_icons_logo_png,
                fit: BoxFit.cover,
                height: 80.ph,
              ),
            ),
          ),
          espacio,
          buildItem(
            context: context,
            iconoLeading: Icons.cottage_outlined,
            tituloItem: l10n.drawerHome,
            onTap: () {
              if (esVersionCelular) {
                Navigator.of(context).pop();
              } else {}
            },
          ),
          espacio,
          buildItem(
            context: context,
            iconoLeading: Icons.folder_open_outlined,
            tituloItem: l10n.drawerProjects,
            onTap: () {
              if (esVersionCelular) {
                Navigator.of(context).pop();
              } else {}
            },
          ),
          espacio,
          buildItem(
            context: context,
            iconoLeading: Icons.space_dashboard_outlined,
            tituloItem: l10n.drawerTemplates,
            onTap: () {
              if (esVersionCelular) {
                Navigator.of(context).pop();
              } else {}
            },
          ),
          const Spacer(),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.ph),
            child: buildItem(
              context: context,
              iconoLeading: Icons.logout_outlined,
              tituloItem: l10n.drawerLogOut,
              onTap: () {
                if (esVersionCelular) {
                  Navigator.of(context).pop();
                } else {}
              },
            ),
          )
        ],
      ),
    );
  }

  /// Este widget sera utilizado cada vez que se agregue un item al drawer
  Widget buildItem({
    required BuildContext context,
    required VoidCallback onTap,

    /// Icono utilizado en el item del lado izquierdo del texto
    required IconData iconoLeading,

    /// Texto del titulo del item a crear
    required String tituloItem,
  }) {
    /// Variable declarada para utilizar el colorScheme
    final colores = context.colores;

    /// Variable utilizada para llamar al padding izaquierdo de los items.
    final padding = EdgeInsets.only(left: 30.pw);
    return ListTile(
      contentPadding: padding,
      leading: Icon(
        iconoLeading,
        color: colores.primary,
      ),
      title: Text(
        tituloItem,
        style: TextStyle(
          color: colores.primary,
          fontSize: 16.pf,
        ),
      ),
      onTap: onTap,
    );
  }
}
