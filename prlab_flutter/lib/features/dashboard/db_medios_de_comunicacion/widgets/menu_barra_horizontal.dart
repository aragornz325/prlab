import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template MenuBarraHorizontal}
/// Contiene los iconos de navegación que
/// se muestran en la página de lista de
/// periodistas en la parte superior.
/// {@endtemplate}
class MenuBarraHorizontal extends StatefulWidget {
  /// {@macro MenuBarraHorizontal}
  const MenuBarraHorizontal({super.key});

  @override
  State<MenuBarraHorizontal> createState() => _MenuBarraHorizontalState();
}

class _MenuBarraHorizontalState extends State<MenuBarraHorizontal> {
  ItemMenu itemSeleccionado = ItemMenu.personas;

  void _onSeleccionado(ItemMenu itemMenu) {
    setState(() {
      itemSeleccionado = itemMenu;
    });
  }

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
              onSeleccionado: _onSeleccionado,
            ),
          ),
          const Spacer(),
          const _ContadorLimiteDeBusquedas(),
        ],
      ),
    );
  }
}

/// {@template _ContadorLimiteDeBusquedas}
/// Contador de la cantidad máxima de veces que
/// el usuario tiene permitido buscar según su tipo
/// de suscripción a la aplicación PRLAB.
/// {@endtemplate}
class _ContadorLimiteDeBusquedas extends StatelessWidget {
  /// {@macro _ContadorLimiteDeBusquedas}
  const _ContadorLimiteDeBusquedas();

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;

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
                  l10n.commonFeatureNotAvailable,
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

// ? Este componente `_ContenedorItemMenu` podría ser utilizado
// ? también en el contenedor de items de filtrado de periodistas
// ? ya que en ese widget se utiliza un componente
// ? muy similar.

/// {@template _ContenedorItemMenu}
/// Utilizado para representar un item de los
/// representados en la barra superior de
/// [MenuBarraHorizontal].
/// {@endtemplate}
class _ContenedorItemMenu extends StatelessWidget {
  /// {@macro _ContenedorItemMenu}
  const _ContenedorItemMenu({
    required this.itemMenu,
    required this.itemSeleccionado,
    required this.onSeleccionado,
  });

  /// Ítem del menú que se verá representado en este
  /// contenedor.
  final ItemMenu itemMenu;

  /// El ítem que en este momento esta seleccionado
  /// por el usuario.
  ///
  /// Si un ítem es seleccionado, el resto de los items
  /// pasan a estar deseleccionados.
  final ItemMenu itemSeleccionado;

  /// Callback que se ejecuta cuando el usuario clickea
  /// en el componente.
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

/// Tipo de ítem que se muestra en la barra
/// superior de [MenuBarraHorizontal] para
/// la navegación interna de la página de
/// búsqueda de medios de comunicación.
enum ItemMenu {
  personas(Icons.search_outlined),
  mediosDeComunicacion(Icons.fact_check_outlined),
  busquedaPorPalabraClave(Icons.save_outlined);

  const ItemMenu(this.icon);

  final IconData icon;

  /// Retorna el nombre de las opciones de navegación
  /// dentro de la página de la base de datos de
  /// medios de comunicación.
  String nombreItem(BuildContext context) {
    return switch (this) {
      personas => context.l10n.pageMediaDatabaseJournalistFilterPeopleItem,
      mediosDeComunicacion =>
        context.l10n.pageMediaDatabaseJournalistFilterMediaOutletsItem,
      busquedaPorPalabraClave =>
        context.l10n.pageMediaDatabaseJournalistFilterSearchByKeywordsItem,
    };
  }
}
