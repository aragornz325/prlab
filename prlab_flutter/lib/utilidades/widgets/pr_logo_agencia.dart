import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template LogoPrLabAgencia}
/// Muestra el logo de pr lab y la internacional PR agencia
/// {@endtemplate}
class LogoPrLabAgencia extends StatelessWidget {
  /// {@macro LogoPrLabAgencia}
  @override
  const LogoPrLabAgencia({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return Row(
      children: [
        SizedBox(
          height: 70.ph,
          width: 75.pw,
          child: Image.asset(Assets.assets_icons_logo_png),
        ),
        SizedBox(width: 20.pw),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.commonPRLab,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colores.tertiary,
                fontSize: 40.pf,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              l10n.pageCreateAdminAccountSubtitleInternationalPRLabAgency,
              style: TextStyle(
                color: colores.tertiary,
                fontSize: 14.pf,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
