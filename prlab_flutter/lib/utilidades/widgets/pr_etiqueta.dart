import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template PREtiqueta}
/// Etiquetas utilizadas en las metricas de proyecto.
/// {@endtemplate}
class PREtiqueta extends StatelessWidget {
  /// {@macro PREtiqueta}
  const PREtiqueta({
    required this.color,
    required this.icono,
    required this.titulo,
    required this.numero,
    super.key,
  });

  /// Etiqueta de menciones.
  factory PREtiqueta.menciones({
    required BuildContext context,
    required int numero,
  }) {
    final colores = context.colores;
    final l10n = context.l10n;

    return PREtiqueta(
      icono: Icons.alternate_email,
      color: colores.primary,
      titulo: l10n.projectMetricsLabelMentions,
      numero: numero,
    );
  }

  /// Etiqueta de vínculos.
  factory PREtiqueta.vinculos({
    required BuildContext context,
    required int numero,
  }) {
    final colores = context.colores;
    final l10n = context.l10n;

    return PREtiqueta(
      icono: Icons.link,
      color: colores.primaryContainer,
      titulo: l10n.projectMetricsLabelBacklinks,
      numero: numero,
    );
  }

  /// Etiqueta de niveles.
  factory PREtiqueta.niveles({
    required BuildContext context,
    required int numero,
  }) {
    final colores = context.colores;
    final l10n = context.l10n;

    return PREtiqueta(
      icono: Icons.emoji_events_outlined,
      color: colores.onTertiary,
      titulo: l10n.projectMetricsLabelTier,
      numero: numero,
    );
  }

  /// Etiqueta de reacciones neutrales.
  factory PREtiqueta.neutral({
    required BuildContext context,
    required int numero,
  }) {
    final colores = context.colores;
    final l10n = context.l10n;

    return PREtiqueta(
      icono: Icons.sentiment_neutral_rounded,
      color: colores.secondary,
      titulo: l10n.projectMetricsLabelNeutral,
      numero: numero,
    );
  }

  /// Etiqueta de reacciones positivas.
  factory PREtiqueta.positiva({
    required BuildContext context,
    required int numero,
  }) {
    final colores = context.colores;
    final l10n = context.l10n;

    return PREtiqueta(
      icono: Icons.mood,
      color: colores.onTertiaryContainer,
      titulo: l10n.projectMetricsLabelPositive,
      numero: numero,
    );
  }

  /// Etiqueta de reacciones negativas.
  factory PREtiqueta.negativa({
    required BuildContext context,
    required int numero,
  }) {
    final colores = context.colores;
    final l10n = context.l10n;

    return PREtiqueta(
      icono: Icons.mood_bad,
      color: colores.error,
      titulo: l10n.projectMetricsLabelNegative,
      numero: numero,
    );
  }

  /// Icono de identificacion que recibe la etiqueta.
  final IconData icono;

  /// Es el color primario de la etiqueta, usado para iconos y puntaje.
  final Color color;

  /// Título que recibe la etiqueta.
  final String titulo;

  /// Número recibido en la etiqueta.
  final int numero;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      width: 160.pw,
      height: max(60.ph, 60.sh),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.sw),
        color: color.withOpacity(0.2),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 13.pw),
        child: Center(
          child: Row(
            children: [
              Icon(
                icono,
                size: 45.pw,
                color: color,
              ),
              SizedBox(width: 10.pw),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      height: 0,
                      fontSize: 14.pf,
                      fontWeight: FontWeight.w400,
                      color: colores.tertiary,
                    ),
                  ),
                  Text(
                    numero.toString(),
                    style: TextStyle(
                      height: 0,
                      color: color,
                      fontSize: 14.pf,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
