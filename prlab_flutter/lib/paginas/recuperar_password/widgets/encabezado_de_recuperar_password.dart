import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template EncabezadoDeRecuperarPassword}
/// Contiene título y subtítulo que aparece en
/// la parte superior del formulario de recuperar contraseña.
/// {@endtemplate}
class EncabezadoDeRecuperarPassword extends StatelessWidget {
  /// {@macro EncabezadoDeRecuperarPassword}
  const EncabezadoDeRecuperarPassword({
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
            l10n.commonRecoverPassword,
            style: TextStyle(
              color: colores.tertiary,
              fontSize: 40.pf,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 10.ph),
        Text(
          l10n.pageRecoverPasswordSubtitle,
          style: TextStyle(
            color: colores.secondary,
            fontSize: 15.pf,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 50.ph),
      ],
    );
  }
}
