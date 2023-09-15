import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template EncabezadoDelKyc}
/// Contiene título y subtítulo que aparece en
/// la parte superior del formulario del kyc.
/// {@endtemplate}
class EncabezadoDelKyc extends StatelessWidget {
  /// {@macro EncabezadoDelKyc}
  const EncabezadoDelKyc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.pw),
          child: Text(
            l10n.pageKycTitle,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 40.pf,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: max(10.ph, 10.sh)),
        Text(
          l10n.pageKycSubtitle,
          style: TextStyle(
            color: colores.secondary,
            fontSize: 15.pf,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: max(50.ph, 50.sh)),
      ],
    );
  }
}
