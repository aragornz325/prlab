import 'package:flutter/widgets.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template NadaParaVer}
/// Tiene una imagen y un texto que indica que no hay informacion que mostrar
/// {@endtemplate}
class NadaParaVer extends StatelessWidget {
  /// {@macro NadaParaVer}
  const NadaParaVer({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.assets_images_nada_para_ver_png),
        Text(
          l10n.commonNothingToSee,
          style: TextStyle(
            color: colores.secondary,
            fontSize: 15.pf,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
