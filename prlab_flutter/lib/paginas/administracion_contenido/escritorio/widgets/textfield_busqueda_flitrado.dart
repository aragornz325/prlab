import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

// TODO(mati): hacer documentacion
class TextFieldBusquedaFiltrado extends StatelessWidget {
// TODO(mati): hacer documentacion
  const TextFieldBusquedaFiltrado({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

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
              color: colores.onPrimary,
              borderRadius: BorderRadius.all(Radius.circular(10)),
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
                  // TODO(mati): hacer l10n
                  hintText: 'Search',
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
          // TODO(mati): hacer los dropdown
          Container(
            width: 410.pw,
            height: max(50.ph, 50.sh),
            padding: EdgeInsets.symmetric(horizontal: 5.pw),
            decoration: BoxDecoration(
              color: colores.onPrimary,
              borderRadius: BorderRadius.all(Radius.circular(10)),
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
                  // TODO(mati): hacer l10n
                  'All',
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
