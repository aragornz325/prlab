// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

/// {@template PopUpMenuOpcionesAlCrearArticulo}
/// Se utiliza para mostrar un menú con diferentes
/// opciones cuando el usuario lo toca y esas opciones son para crear un nuevo
/// artículo como un solo articulo,por marca o por usar una plantilla
/// {@endtemplate}
class PopUpMenuOpcionesArticulo extends StatefulWidget {
  const PopUpMenuOpcionesArticulo({super.key});

  @override
  _PopUpMenuOpcionesArticuloState createState() =>
      _PopUpMenuOpcionesArticuloState();
}

class _PopUpMenuOpcionesArticuloState extends State<PopUpMenuOpcionesArticulo> {
  // TODO(mati) : pasarla la key de la vista de administracion
  final GlobalKey _menuKey = GlobalKey();
  void _showMenu() {
    final button = _menuKey.currentContext!.findRenderObject()! as RenderBox;
    final overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;

    final double yOffset = -270.0;
    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset(0, yOffset)),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    showMenu<int>(
      context: context,
      position: position,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10), // Ajusta el radio según lo desees
      ),
      items: [
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 1,
          child: const Text('Edit'),
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 2,
          child: const Text('Duplicate'),
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 3,
          child: const Text('Preview'),
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 4,
          child: const Text('Share'),
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 5,
          child: const Text('Send via email'),
        ),
        PopupMenuItem(
          height: max(30.ph, 30.sh),
          value: 6,
          child: const Text('Delete'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return IconButton(
      key: _menuKey,
      onPressed: _showMenu,
      icon: Icon(
        Icons.more_vert_outlined,
        size: 18.pf,
        color: colores.primary,
      ),
    );
  }
}
