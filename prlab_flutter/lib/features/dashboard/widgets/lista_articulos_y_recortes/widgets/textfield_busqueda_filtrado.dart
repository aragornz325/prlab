import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

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
              border: Border.all(color: colores.secondary),
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
          // TODO(anyone): hacer los dropdown
          Container(
            width: 410.pw,
            height: max(50.ph, 50.sh),
            padding: EdgeInsets.symmetric(horizontal: 5.pw),
            decoration: BoxDecoration(
              color: colores.surfaceTint,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: colores.secondary),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  color: colores.secondary,
                  size: 20.pf,
                ),
                SizedBox(width: 10.pw),
                Text(
                  l10n.commonAll,
                  style: TextStyle(
                    color: colores.secondary,
                    fontSize: 15.pf,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_drop_down,
                  color: colores.secondary,
                  size: 20.pf,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
