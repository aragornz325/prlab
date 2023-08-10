import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

class TituloBienvenidaConImagen extends StatelessWidget {
  const TituloBienvenidaConImagen({
    required this.l10n,
    super.key,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
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
                  color: const Color(0xff363636),
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
