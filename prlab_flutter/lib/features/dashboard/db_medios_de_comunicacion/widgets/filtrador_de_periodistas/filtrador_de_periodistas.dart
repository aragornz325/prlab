import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/bloc/bloc_db_medios_de_comunicacion.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dropdown.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

part 'campo_de_texto_filtrador.dart';
part 'seccion_filtrado_por_personas.dart';
part 'tile_con_check_boxes.dart';

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
  ItemMenuFiltros _itemSeleccionado = ItemMenuFiltros.busqueda;

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onCambiarDePagina(ItemMenuFiltros itemMenu) {
    setState(() {
      if (_pageController.page != itemMenu.index) {
        _pageController.jumpToPage(
          itemMenu.index,
        );
      }

      _itemSeleccionado = itemMenu;
    });
  }

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
                  itemSeleccionado: _itemSeleccionado,
                  onSeleccionado: _onCambiarDePagina,
                ),
              ),
            ],
          ),
          const Divider(height: 0),
          SizedBox(
            // ? Esto funcionaría mejor para la PageView si
            // ? fuese mas dinámico y no un valor en duro.
            height: 620.sh,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (value) {
                _itemSeleccionado = ItemMenuFiltros.values.firstWhere(
                  (element) => element.index == value,
                );

                _onCambiarDePagina(_itemSeleccionado);
              },
              children: [
                const SeccionFiltradoPorPersonas(),
                Center(
                  child: Image.asset(Assets.assets_images_nada_para_ver_png),
                ),
                Center(
                  child: Image.asset(Assets.assets_images_nada_para_ver_png),
                ),
              ],
            ),
          ),
        ],
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
