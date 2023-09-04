import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

class MenuBarraHorizontal extends StatefulWidget {
  const MenuBarraHorizontal({super.key});

  @override
  State<MenuBarraHorizontal> createState() => _MenuBarraHorizontalState();
}

class _MenuBarraHorizontalState extends State<MenuBarraHorizontal> {
  ItemMenu itemSeleccionado = ItemMenu.busqueda;
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      height: 64.sh,
      color: colores.surfaceTint,
      padding: EdgeInsets.symmetric(horizontal: 30.pw),
      margin: EdgeInsets.only(right: 30.pw),
      child: Row(
        children: [
          ...ItemMenu.values.map(
            (item) => _ContenedorItemMenu(
              itemMenu: item,
              itemSeleccionado: itemSeleccionado,
              onSeleccionado: (itemMenu) {
                setState(() {
                  itemSeleccionado = itemMenu;
                });
              },
            ),
          ),
          const Spacer(),
          const _ContadorLimiteDeBusquedas(),
        ],
      ),
    );
  }
}

class _ContadorLimiteDeBusquedas extends StatelessWidget {
  const _ContadorLimiteDeBusquedas();

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Row(
      children: [
        // TODO(Andre): Preguntarle a vir que va aca.
        Text(
          'Limit 1500 / 3000',
          style: TextStyle(
            fontSize: 14.pf,
            color: colores.secondary,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 5.pw),
        PopupMenuButton<String>(
          itemBuilder: (BuildContext context) {
            return [
              // TODO(Andre): Preguntarle a vir que va aca.
              PopupMenuItem<String>(
                child: Text(
                  'Completar con algo aca',
                  style: TextStyle(
                    fontSize: 14.pf,
                    color: colores.secondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ];
          },
          constraints: BoxConstraints(minWidth: 185.pw),
          position: PopupMenuPosition.under,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            Icons.help_outline_rounded,
            color: colores.primary,
          ),
        ),
      ],
    );
  }
}

class _ContenedorItemMenu extends StatelessWidget {
  const _ContenedorItemMenu({
    required this.itemMenu,
    required this.itemSeleccionado,
    required this.onSeleccionado,
  });

  final ItemMenu itemMenu;

  final ItemMenu itemSeleccionado;

  final void Function(ItemMenu itemMenu) onSeleccionado;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final estaSeleccionado = itemMenu == itemSeleccionado;

    return Container(
      padding: EdgeInsets.only(right: 40.pw),
      child: InkWell(
        onTap: () => onSeleccionado.call(itemMenu),
        child: Row(
          children: [
            Icon(
              itemMenu.icon,
              size: 24.pw,
              color: estaSeleccionado ? colores.primary : colores.secondary,
            ),
            SizedBox(width: 5.pw),
            Text(
              itemMenu.nombreItem(context),
              style: TextStyle(
                fontSize: 14.pf,
                color: estaSeleccionado ? colores.primary : colores.secondary,
                fontWeight:
                    estaSeleccionado ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ItemMenu {
  busqueda(Icons.search_outlined),
  misSelecciones(Icons.fact_check_outlined),
  busquedasGuardadas(Icons.save_outlined);

  const ItemMenu(this.icon);

  final IconData icon;

  /// Retorna el nombre de las opciones de navegación
  /// dentro de la página de la base de datos de
  /// medios de comunicación.
  String nombreItem(BuildContext context) {
    return switch (this) {
      busqueda => context.l10n.commonSearch,
      // TODO(Andre): Poner l10n que va.
      misSelecciones => context.l10n.commonSearch,
      busquedasGuardadas => context.l10n.commonSearch,
    };
  }
}
