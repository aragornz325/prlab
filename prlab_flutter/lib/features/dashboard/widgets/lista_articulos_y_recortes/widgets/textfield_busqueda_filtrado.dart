import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/widgets/lista_articulos_y_recortes/dialog/pr_dialog_filtrar_por_autor.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';
import 'package:prlab_flutter/utilidades/widgets/dropdowns_package.dart';

/// {@template TextFieldBusquedaFiltrado}
/// Dos componentes uno es un textfield/campo de texto y el otro es un dropdown
/// para filtrar la lista articulos, por estado o fecha
/// {@endtemplate}
class TextFieldBusquedaFiltrado extends StatelessWidget {
  /// {@macro TextFieldBusquedaFiltrado}
  const TextFieldBusquedaFiltrado({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: max(20.ph, 20.sh)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 410.pw,
            height: max(50.ph, 50.sh),
            padding: EdgeInsets.symmetric(horizontal: 5.pw),
            decoration: BoxDecoration(
              color: colores.surfaceTint,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: colores.outline),
            ),
            child: Center(
              child: TextFormField(
                style: TextStyle(
                  color: colores.primary,
                  fontSize: 15.pf,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintText: l10n.commonSearch,
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.manage_search,
                    color: colores.secondary,
                    size: 20.pf,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 412.pw,
            child: PRDropdown(
              list: const [
                {'id': '0', 'label': 'All'},
                {'id': '1', 'label': 'Author'},
                {'id': '2', 'label': 'Status'},
                {'id': '3', 'label': 'Dates'},
              ],
              initiallySelected: const [
                {'id': '0', 'label': 'All'},
              ],
              onChange: (newList) {
                // TODO(anyone): Abrir los popups para cada categoria seleccionada
                final id = newList[0]['id'];
                switch (id) {
                  case '0':
                    return;
                  case '1':
                    showDialog<void>(
                      context: context,
                      builder: (context) {
                        return const PrDialogFiltrarPorAutor();
                      },
                    );
                  case '2':
                    return;
                  case '3':
                    return;
                }
              },
              textStyle: TextStyle(
                fontSize: 15.pf,
                color: colores.secondary,
              ),
              oneMinimumSelected: true,
              whenEmpty: l10n.commonChooseFromTheList,
              iconsColor: colores.primary,
              itemhaveIcons: true,
              listTextStyle: TextStyle(
                fontSize: 14.pf,
                color: colores.tertiary,
              ),
              selectedItemColor: colores.primaryOpacidadVeinte,
              itemsIconList: const [
                Icons.menu,
                Icons.person_outline,
                Icons.checklist_rtl,
                Icons.calendar_month,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
