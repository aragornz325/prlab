import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/prlab_configuracion/base.dart';

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

    return Padding(
      padding: EdgeInsets.only(top: 20.ph, left: 20.pw),
      child: Row(
        children: [
          SizedBox(
            height: 82.ph,
            width: 67.pw,
            child: Image.asset(Assets.assets_icons_logo_png),
          ),
          SizedBox(width: 20.pw),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.commonPRLab,
                style: TextStyle(
                  color: colores.tertiary,
                  fontSize: 40.pf,
                  fontWeight: FontWeight.w600,
                  height: .8.ph,
                ),
              ),
              Text(
                PRLabConfiguracion.descripcionPRLab,
                style: TextStyle(
                  color: colores.tertiary,
                  fontSize: 14.pf,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
