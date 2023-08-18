import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template TituloBienvenidaConImagen}
/// Widget custom de la vista de registro, que muestra un titulo de bienvenida
/// con una imagen que lo acompaña.
/// {@endtemplate}
class TituloBienvenidaConImagen extends StatelessWidget {
  /// {@macro TituloBienvenidaConImagen}
  const TituloBienvenidaConImagen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colores = context.colores;
    return SizedBox(
      height: 150.ph,
      width: 300.pw,
      child: Stack(
        children: [
          Positioned(
            left: 15.pw,
            top: 15.ph,
            child: Image.asset(
              Assets.assets_images_avion_de_papel_png,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 80.ph,
            left: 40.pw,
            child: Center(
              child: Text(
                l10n.pageSignUpTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colores.secondary,
                  fontSize: 40.pf,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
