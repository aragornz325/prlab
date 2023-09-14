import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

/// {@template DrawerIndicadorItemSeleccionado}
/// Es el indicador decorativo para mostrar si el item esta seleccionado
/// {@endtemplate}
class DrawerIndicadorItemSeleccionado extends StatelessWidget {
  /// {@macro DrawerIndicadorItemSeleccionado}
  const DrawerIndicadorItemSeleccionado({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return Padding(
      padding: EdgeInsets.only(right: 22.pw),
      child: Container(
        width: 8.pw,
        height: max(40.ph, 40.sh),
        decoration: BoxDecoration(
          color: colores.primary,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.sw),
            bottomRight: Radius.circular(20.sw),
          ),
        ),
      ),
    );
  }
}
