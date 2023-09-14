import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/prlab_configuracion/base.dart';

/// {@template SeccionLogoYEslogan}
/// Seccion que muestra el logo y eslogan de la empresa
/// {@endtemplate}
class SeccionLogoYEslogan extends StatelessWidget {
  /// {@macro SeccionLogoYEslogan}
  const SeccionLogoYEslogan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return SizedBox(
      height: 100.hp,
      width: 55.5.wp,
      child: Stack(
        children: [
          SizedBox(
            height: max(832.ph, 832.sh),
            child: Image.asset(
              Assets.assets_images_diario_png,
              fit: BoxFit.cover,
              width: 55.5.wp,
            ),
          ),
          SizedBox(
            height: max(832.ph, 832.sh),
            child: Image.asset(
              Assets.assets_images_opacidad_png,
              fit: BoxFit.cover,
              width: 55.5.wp,
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                alignment: Alignment.center,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.assets_icons_logo_png,
                  fit: BoxFit.cover,
                  height: max(170.ph, 170.sh),
                ),
                SizedBox(
                  width: 550.pw,
                  child: Text(
                    PRLabConfiguracion.esloganPRLab,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colores.surfaceTint,
                      fontSize: 64.pf,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      Assets.assets_images_subrayado_png,
                      width: 300.pw,
                      height: max(30.ph, 30.sh),
                    ),
                    SizedBox(
                      width: 100.pw,
                    ),
                  ],
                ),
                SizedBox(
                  height: max(150.ph, 150.sh),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
