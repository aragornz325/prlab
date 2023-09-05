import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template FiltradorDePeriodistas}
/// Contiene los filtros para la búsqueda de
/// periodistas.
///
/// Maneja campos de texto para buscar periodistas
/// por nombre o el tipo de medio de comunicación
/// y filtrado por países, lenguajes entre otros más.
/// {@endtemplate}
class FiltradorDePeriodistas extends StatefulWidget {
  /// {@macro FiltradorDePeriodistas}
  const FiltradorDePeriodistas({super.key});

  @override
  State<FiltradorDePeriodistas> createState() => _FiltradorDePeriodistasState();
}

class _FiltradorDePeriodistasState extends State<FiltradorDePeriodistas> {
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
          // TODO(Andre): Continuar este campo en proximo pr.
          _CampoDeTexto(
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }
}

/// {@template _CampoDeTexto}
/// Utilizado para algunos de los tipos de
/// filtrado que ofrece la página como el
/// filtrado por nombre de periodistas entre
/// otros.
/// {@endtemplate}
class _CampoDeTexto extends StatelessWidget {
  /// {@macro _CampoDeTexto}
  const _CampoDeTexto({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    // TODO(Andre): Continuar este campo en proximo pr.
    return const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.access_alarm),
      ),
    );
  }
}

/// {@template _ContenedorItemMenuFiltros}
/// Utilizado para representar un ítem de los
/// representados en la barra superior de
/// [FiltradorDePeriodistas].
/// {@endtemplate}
class _ContenedorItemMenuFiltros extends StatelessWidget {
  /// {@macro _ContenedorItemMenuFiltros}
  const _ContenedorItemMenuFiltros({
    required this.itemMenuFiltros,
    required this.itemSeleccionado,
    required this.onSeleccionado,
  });

  /// Ítem del menu que se verá representado en este
  /// contenedor.
  final ItemMenuFiltros itemMenuFiltros;

  /// El ítem que en este momento esta seleccionado
  /// por el usuario.
  ///
  /// Si un ítem es seleccionado, el resto de los items
  /// pasan a estar deseleccionados.
  final ItemMenuFiltros itemSeleccionado;

  /// Callback que se ejecuta cuando el usuario clickea
  /// en el componente.
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

/// Tipo de ítem que se muestra en la barra
/// superior de [FiltradorDePeriodistas].
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
      misSelecciones =>
        context.l10n.pageMediaDatabaseHorizontalMenuMySelectionsItem,
      busquedasGuardadas =>
        context.l10n.pageMediaDatabaseHorizontalMenuSavedSearchesItem,
    };
  }
}
