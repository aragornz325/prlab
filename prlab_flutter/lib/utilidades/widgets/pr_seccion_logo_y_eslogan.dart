import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

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
    final l10n = context.l10n;
    final colores = context.colores;

    return SizedBox(
      height: 100.hp,
      width: 55.5.wp,
      child: Stack(
        children: [
          SizedBox(
            height: 832.ph,
            child: Image.asset(
              Assets.assets_images_diario_png,
              fit: BoxFit.cover,
              width: 55.5.wp,
            ),
          ),
          SizedBox(
            height: 832.ph,
            child: Image.asset(
              Assets.assets_images_opacidad_png,
              fit: BoxFit.cover,
              width: 55.5.wp,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.assets_icons_logo_png,
                  fit: BoxFit.cover,
                  height: 170.ph,
                ),
                SizedBox(
                  width: 550.pw,
                  child: Text(
                    l10n.pageLoginLeadingAgency,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colores.onPrimary,
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
                      height: 30.ph,
                    ),
                    SizedBox(
                      width: 100.pw,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
