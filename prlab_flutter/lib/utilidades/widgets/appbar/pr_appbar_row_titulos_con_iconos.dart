import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/appbar/appbar.dart';
import 'package:prlab_flutter/utilidades/widgets/appbar/pr_popupmenu.dart';

/// {@template PRAppBarRowTitulosConIconos}
/// Componente de PRAppBar el cual contiene los items que se muestran con título
/// {@endtemplates}
class PRAppBarRowTitulosConIconos extends StatelessWidget {
  /// {@macro PRAppBarRowTitulosConIconos}
  const PRAppBarRowTitulosConIconos({
    required this.onTap,
    super.key,
  });

  /// Función utilizada para enviar y recibir un value de tipo MenuDeOpciones.
  final void Function(MenuDeOpciones value) onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: [
        PRPopUpMenu(
          onTap: onTap,
          tituloMenu: l10n.prAppBarCreateContent,
          enumItemsMenu: MenuDeOpciones.crearContenido,
        ),
        SizedBox(width: 40.pw),
        PRPopUpMenu(
          tituloMenu: l10n.prAppBarDistributionContent,
          enumItemsMenu: MenuDeOpciones.distribucionDeContenido,
          onTap: onTap,
        ),
        SizedBox(width: 40.pw),
        PRPopUpMenu(
          tituloMenu: l10n.prAppBarCoverageMedia,
          onTap: onTap,
          // TODO(Manu): en diseño no tiene items pero le paso otro para evitar error
          enumItemsMenu: MenuDeOpciones.crearContenido,
        )
      ],
    );
  }
}
