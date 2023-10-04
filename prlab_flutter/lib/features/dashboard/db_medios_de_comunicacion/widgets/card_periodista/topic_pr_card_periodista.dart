import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/theming/base.dart';

/// {@template TopicPRCardPeriodista}
/// Contenedor de tema cubierto por el periodista que va a ser listado en
/// la tarjeta del periodista.
/// {@endtemplate}
class TopicPRCardPeriodista extends StatelessWidget {
  /// {@macro TopicPRCardPeriodista}
  const TopicPRCardPeriodista({
    required this.topic,
    super.key,
  });

  /// Título que va recibir el tema cubierto
  final String topic;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      height: max(25.ph, 25.sh),
      decoration: BoxDecoration(
        color: colores.primaryOpacidadDiez,
        borderRadius: BorderRadius.circular(10.sw),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.pw),
      margin: EdgeInsets.only(right: 5.pw),
      child: Center(
        child: Text(
          topic,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.pf,
            fontWeight: FontWeight.w400,
            color: colores.tertiary,
          ),
        ),
      ),
    );
  }
}
