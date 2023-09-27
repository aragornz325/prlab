import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

/// {@template DividerPeriodo}
/// Divider customizado de la barra de seleccion de periodo
/// {@endtemplate}
class DividerPeriodo extends StatelessWidget {
  /// {@macro DividerPeriodo}
  const DividerPeriodo({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return Container(
      height: max(40.ph, 40.sh),
      width: 0.5.pw,
      decoration: BoxDecoration(color: colores.outlineVariant),
    );
  }
}
