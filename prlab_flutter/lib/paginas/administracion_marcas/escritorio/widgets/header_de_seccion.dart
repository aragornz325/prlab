import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template HeaderDeSeccion}
/// Titulo de la seccion del dashboard
/// {@endtemplate}
class HeaderDeSeccion extends StatelessWidget {
  /// {@macro HeaderDeSeccion}
  const HeaderDeSeccion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.beenhere_outlined,
              size: 40.pf,
              color: colores.primary,
            ),
            SizedBox(width: 5.pw),
            Text(
              l10n.pageBrandAdministrationTitle,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30.pf,
                color: colores.tertiary,
              ),
            ),
          ],
        ),
        Text(
          l10n.pageBrandAdministrationSubtitle,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15.pf,
            color: colores.secondary,
          ),
        )
      ],
    );
  }
}
