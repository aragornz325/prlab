import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/utilidades/widgets/appbar/appbar.dart';

/// {@template PRAppBar}
/// Componente de navegacion estatico en conjunto con PRDrawer
/// {@endtemplates}
class PRAppBar extends StatelessWidget {
  /// {@macro PRAppBar}
  const PRAppBar({
    required this.onTap,
    super.key,
  });

  /// Función utilizada para enviar y recibir un value de tipo MenuDeOpciones.
  final void Function(MenuDeOpciones value) onTap;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      height: max(100.ph, 100.sh),
      decoration: BoxDecoration(color: colores.surfaceTint),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.pw),
        child: Row(
          children: [
            PRAppBarRowTitulosConIconos(onTap: onTap),
            const Spacer(),
            PRAppBarRowIconos(onTap: onTap),
          ],
        ),
      ),
    );
  }
}
