// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/dialog/dialog.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template PopUpMenuOpcionesArticulo}
/// Se utiliza para mostrar un menú con diferentes
/// opciones cuando el usuario lo toca y esas opciones son para crear un nuevo
/// artículo como un solo articulo,por marca o por usar una plantilla
/// {@endtemplate}
class PopUpMenuOpcionesArticulo extends StatefulWidget {
  /// {@macro PopUpMenuOpcionesArticulo}
  const PopUpMenuOpcionesArticulo({
    super.key,
    required this.idArticulo,
  });

  /// Id del articulo seleccionado
  final int idArticulo;

  @override
  _PopUpMenuOpcionesArticuloState createState() =>
      _PopUpMenuOpcionesArticuloState();
}

class _PopUpMenuOpcionesArticuloState extends State<PopUpMenuOpcionesArticulo> {
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
      offset: const Offset(-5, -235),
      color: colores.surfaceTint,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.sw),
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 1,
          child: Text(
            l10n.commonEdit,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 14.pf,
            ),
          ),
          onTap: () {
            context.router
                .replace(RutaEditorContenido(idArticulo: widget.idArticulo));
          },
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 2,
          child: Text(
            l10n.commonDuplicate,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 14.pf,
            ),
          ),
          onTap: () {
            // TODO(anyone): agregarle funcionalidad
            showDialog<void>(
              context: context,
              builder: (context) => const PRDialogErrorNoDisponible(),
            );
          },
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 3,
          child: Text(
            l10n.commonPreview,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 14.pf,
            ),
          ),
          onTap: () {
            // TODO(anyone): agregarle funcionalidad
            showDialog<void>(
              context: context,
              builder: (context) => const PRDialogErrorNoDisponible(),
            );
          },
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 4,
          child: Text(
            l10n.commonShare,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 14.pf,
            ),
          ),
          onTap: () {
            // TODO(anyone): agregarle funcionalidad
            showDialog<void>(
              context: context,
              builder: (context) => const PRDialogErrorNoDisponible(),
            );
          },
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 5,
          child: Text(
            l10n.pageContentAdministrationPopupSendViaMail,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 14.pf,
            ),
          ),
          onTap: () {
            // TODO(anyone): agregarle funcionalidad
            showDialog<void>(
              context: context,
              builder: (context) => const PRDialogErrorNoDisponible(),
            );
          },
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 6,
          child: Text(
            l10n.commonDelete,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 14.pf,
            ),
          ),
          onTap: () {
            showDialog<void>(
              context: context,
              builder: (context) => PrDialogConfirmarAlEliminarArticulo(
                idArticulo: widget.idArticulo,
              ),
            );
          },
        ),
      ],

      // boton crear artículo
      child: CircleAvatar(
        radius: 20.sw,
        backgroundColor: estaDesplegado
            ? colores.primaryOpacidadVeinte
            : colores.surfaceTint,
        child: Icon(
          Icons.more_vert_outlined,
          color: colores.primary,
          size: 18.pw,
        ),
      ),
    );
  }
}
