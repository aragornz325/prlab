import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/widgets/barra_periodo/pr_barra_seleccion_periodo.dart';

/// {@template TagPeriodo}
/// Item seleccionable en la barra de seleccion de periodo
/// {@endtemplate}
class TagPeriodo extends StatelessWidget {
  /// {@macro TagPeriodo}
  const TagPeriodo({
    required this.texto,
    required this.estaSeleccionado,
    required this.onTap,
    required this.periodo,
    this.esPrimero = false,
    this.esUltimo = false,
    super.key,
  });

  /// Texto interno que recibe el tag
  /// utilizado para seleccionar el período.
  final String texto;

  /// Identifica la posicion del tag para determinar el border radius derecho
  final bool esPrimero;

  /// Identifica la posicion del tag para determinar el border radius izquierdo
  final bool esUltimo;

  /// Identifica si el tag esta seleccionado para mostrar la UI correspondiente,
  /// cambiar el color de fondo y del texto.
  final bool estaSeleccionado;

  /// Función que cumplira el tag al ser seleccionado.
  final void Function(Periodo value) onTap;

  /// Enum creado para diferenciar los periodos
  final Periodo periodo;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return InkWell(
      onTap: () => onTap(periodo),
      child: Container(
        width: 137.pw,
        height: max(40.ph, 40.sh),
        decoration: BoxDecoration(
          color: estaSeleccionado ? colores.primary : colores.surfaceTint,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(
              esPrimero ? 10.sw : 0.sw,
            ),
            right: Radius.circular(
              esUltimo ? 10.sw : 0.sw,
            ),
          ),
        ),
        child: Center(
          child: Text(
            texto,
            style: TextStyle(
              fontSize: 15.pf,
              color: estaSeleccionado ? colores.surfaceTint : colores.tertiary,
            ),
          ),
        ),
      ),
    );
  }
}
