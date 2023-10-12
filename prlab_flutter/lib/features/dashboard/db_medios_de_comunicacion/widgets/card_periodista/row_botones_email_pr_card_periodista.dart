import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_boton.dart';

/// {@template RowBotonesEmailCardPeriodista}
/// Row inferior de la tarjeta de periodista que contiene
/// un botón de detalles, email del periodista y un botón
/// de agregar a la lista
/// {@endtemplate}
class RowBotonesEmailPRCardPeriodista extends StatelessWidget {
  /// {@macro RowBotonesEmailCardPeriodista}

  const RowBotonesEmailPRCardPeriodista({
    required this.periodista,
    required this.onTapAdd,
    required this.onTapDetails,
    super.key,
  });

  /// Modelo utilizado para recolectar la información del periodista y armar
  /// la tarjeta
  final Periodista periodista;

  /// Función a realizar en el momento de apretar el botón de Add to list
  final VoidCallback onTapAdd;

  /// Función a realizar en el momento de apretar el botón de Details
  final VoidCallback onTapDetails;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;
    return Row(
      children: [
        PRBoton.esOutlined(
          onTap: onTapDetails,
          texto: l10n.cardPeriodistaBotonDetails,
          estaHabilitado: true,
          width: 100.pw,
          height: max(30.ph, 30.sh),
          fontSize: 15.pf,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(width: 10.pw),
        Icon(
          Icons.mail_outline_outlined,
          color: colores.secondary,
          size: 20.pw,
        ),
        SizedBox(width: 5.pw),
        Text(
          periodista.email,
          style: TextStyle(
            color: colores.secondary,
            fontWeight: FontWeight.w400,
            fontSize: 14.pf,
          ),
        ),
        const Spacer(),
        PRBoton(
          onTap: onTapAdd,
          texto: l10n.cardPeriodistaBotonAdd,
          estaHabilitado: true,
          height: max(30.ph, 30.sh),
          width: 100.pw,
          fontSize: 15.pf,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
