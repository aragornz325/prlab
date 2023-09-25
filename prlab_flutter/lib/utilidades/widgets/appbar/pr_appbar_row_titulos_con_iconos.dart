import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/appbar/appbar.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dialog.dart';

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
        // TODO(anyone): Descomentar cuando se use el appbar
        /* PRPopUpMenu(
          onTap: onTap,
          tituloMenu: l10n.prAppBarCreateContent,
          enumItemsMenu: MenuDeOpciones.crearContenido,
         ),*/
        // TODO(anyone): Eliminar cuando se use el appbar
        GestureDetector(
          onTap: () => const PRDialogErrorNoDisponible().show(context),
          child: Row(
            children: [
              Text(
                l10n.prAppBarCreateContent,
                style: TextStyle(
                  color: context.colores.tertiary,
                  fontSize: 16.pf,
                ),
              ),
              Icon(
                Icons.arrow_drop_down_rounded,
                size: 25,
                color: context.colores.tertiary,
              ),
            ],
          ),
        ),
        SizedBox(width: 40.pw),
        // TODO(anyone): Descomentar cuando se use el appbar
        /* PRPopUpMenu(
           onTap: onTap,
           tituloMenu: l10n.prAppBarDistributionContent,
           enumItemsMenu: MenuDeOpciones.distribucionDeContenido,
         ),*/
        // TODO(anyone): Eliminar cuando se use el appbar
        GestureDetector(
          onTap: () => const PRDialogErrorNoDisponible().show(context),
          child: Row(
            children: [
              Text(
                l10n.prAppBarDistributionContent,
                style:
                    TextStyle(color: context.colores.tertiary, fontSize: 16.pf),
              ),
              Icon(
                Icons.arrow_drop_down_rounded,
                size: 25,
                color: context.colores.tertiary,
              ),
            ],
          ),
        ),
        SizedBox(width: 40.pw),
        // TODO(anyone): Descomentar cuando se use el appbar
        /*  PRPopUpMenu(
           onTap: onTap,
           tituloMenu: l10n.prAppBarCoverageMedia,
           enumItemsMenu: MenuDeOpciones.coberturaMedia,
         ),*/
        // TODO(anyone): Eliminar cuando se use el appbar
        GestureDetector(
          onTap: () => const PRDialogErrorNoDisponible().show(context),
          child: Row(
            children: [
              Text(
                l10n.prAppBarCoverageMedia,
                style:
                    TextStyle(color: context.colores.tertiary, fontSize: 16.pf),
              ),
              Icon(
                Icons.arrow_drop_down_rounded,
                size: 25,
                color: context.colores.tertiary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
