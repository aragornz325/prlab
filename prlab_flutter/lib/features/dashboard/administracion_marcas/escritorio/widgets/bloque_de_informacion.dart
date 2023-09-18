import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';

/// {@template BloqueDeInformacionDeMarca}
/// Bloque donde se muestra una categoria y cantidad de
/// elementos de esa categoria
/// {@endtemplate}
class BloqueDeInformacionDeMarca extends StatelessWidget {
  /// {@macro BloqueDeInformacionDeMarca}
  const BloqueDeInformacionDeMarca({
    required this.icono,
    required this.cuerpo,
    this.tieneBordes = false,
    super.key,
  });

  /// Icono del bloque
  final IconData icono;

  /// Se usa para ponerle bordes a la izquierda y derecha del bloque
  final bool tieneBordes;

  /// Widget con la informacion del bloque
  final Widget cuerpo;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      decoration: tieneBordes
          ? BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 1.pw,
                  color: colores.outline,
                ),
                right: BorderSide(
                  width: 1.pw,
                  color: colores.outline,
                ),
              ),
            )
          : null,
      width: 160.pw,
      height: max(80.ph, 80.sh),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icono,
              size: 40.pw,
              color: colores.secondary,
            ),
            SizedBox(width: 5.pw),
            cuerpo,
          ],
        ),
      ),
    );
  }
}
