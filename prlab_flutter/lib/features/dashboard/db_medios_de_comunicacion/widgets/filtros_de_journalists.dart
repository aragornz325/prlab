import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

class FiltrosDeJournalists extends StatefulWidget {
  const FiltrosDeJournalists({super.key});

  @override
  State<FiltrosDeJournalists> createState() => _FiltrosDeJournalistsState();
}

class _FiltrosDeJournalistsState extends State<FiltrosDeJournalists> {
  ItemMenuFiltros itemSeleccionado = ItemMenuFiltros.busqueda;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      width: 376.sh,
      color: colores.surfaceTint,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...ItemMenuFiltros.values.map(
                (item) => _ContenedorItemMenuFiltros(
                  itemMenuFiltros: item,
                  itemSeleccionado: itemSeleccionado,
                  onSeleccionado: (itemMenu) {
                    setState(() {
                      itemSeleccionado = itemMenu;
                    });
                  },
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class _ContenedorItemMenuFiltros extends StatelessWidget {
  const _ContenedorItemMenuFiltros({
    required this.itemMenuFiltros,
    required this.itemSeleccionado,
    required this.onSeleccionado,
  });

  final ItemMenuFiltros itemMenuFiltros;

  final ItemMenuFiltros itemSeleccionado;

  final void Function(ItemMenuFiltros itemMenuFiltros) onSeleccionado;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final estaSeleccionado = itemMenuFiltros == itemSeleccionado;

    return InkWell(
      onTap: () => onSeleccionado.call(itemMenuFiltros),
      child: SizedBox(
        height: 65.sh,
        child: Center(
          child: Text(
            itemMenuFiltros.nombreItem(context),
            style: TextStyle(
              fontSize: 14.pf,
              color: estaSeleccionado ? colores.primary : colores.secondary,
              fontWeight: estaSeleccionado ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

enum ItemMenuFiltros {
  busqueda(Icons.search_outlined),
  misSelecciones(Icons.fact_check_outlined),
  busquedasGuardadas(Icons.save_outlined);

  const ItemMenuFiltros(this.icon);

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
