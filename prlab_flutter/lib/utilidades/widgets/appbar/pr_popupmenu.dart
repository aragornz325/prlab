import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/utilidades/widgets/appbar/appbar.dart';

/// {@template PRPopUpMenu}
/// PopUpMenu customizado para utilizar en AppBar
/// {@endtemplate}
class PRPopUpMenu extends StatefulWidget {
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
  State<PRPopUpMenu> createState() => _PRPopUpMenuState();
}

class _PRPopUpMenuState extends State<PRPopUpMenu> {
  bool _estaExpandido = false;
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return PopupMenuButton<MenuDeOpciones>(
      tooltip: '',
      onOpened: () {
        setState(() {
          _estaExpandido = true;
        });
      },
      onCanceled: () {
        setState(() {
          _estaExpandido = false;
        });
      },
      itemBuilder: (BuildContext context) {
        return widget.enumItemsMenu.map((MenuDeOpciones enumItemsMenu) {
          return PopupMenuItem<MenuDeOpciones>(
            labelTextStyle: MaterialStatePropertyAll(
              TextStyle(color: colores.tertiary),
            ),
            onTap: () => widget.onTap(enumItemsMenu),
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
      child: PRPopUpMenuRowTitulo(
        tituloMenu: widget.tituloMenu,
        estaExpandido: _estaExpandido,
      ),
    );
  }
}
