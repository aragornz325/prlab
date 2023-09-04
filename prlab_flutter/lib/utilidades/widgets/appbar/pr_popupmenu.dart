import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/utilidades/widgets/appbar/appbar.dart';

/// {@template PRPopUpMenu}
/// PopUpMenu customizado para utilizar en AppBar
/// {@endtemplate}
class PRPopUpMenu extends StatelessWidget {
  /// {@macro PRpopUpMenu}
  const PRPopUpMenu({
    required this.tituloMenu,
    required this.enumItemsMenu,
    required this.onTap,
    super.key,
  });

  /// Titulo que va a tomar el item
  final String tituloMenu;

  /// Lista de items en el enum MenuDeOpciones para construir el PopUpMenu
  final List<MenuDeOpciones> enumItemsMenu;

  /// Función utilizada para enviar y recibir un value de tipo MenuDeOpciones.
  final void Function(MenuDeOpciones) onTap;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return PopupMenuButton<MenuDeOpciones>(
      itemBuilder: (BuildContext context) {
        return enumItemsMenu.map((MenuDeOpciones enumItemsMenu) {
          return PopupMenuItem<MenuDeOpciones>(
            labelTextStyle: MaterialStatePropertyAll(
              TextStyle(color: colores.tertiary),
            ),
            onTap: () => onTap(enumItemsMenu),
            value: enumItemsMenu,
            child: Text(
              enumItemsMenu.nombreItem(context),
              style: TextStyle(fontSize: 14.pf),
            ),
          );
        }).toList();
      },
      constraints: BoxConstraints(minWidth: 185.pw),
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: PRPopUpMenuRowTitulo(tituloMenu: tituloMenu, estaExpandido: false),
    );
  }
}
