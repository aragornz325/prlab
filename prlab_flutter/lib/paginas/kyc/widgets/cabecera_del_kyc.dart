import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template cabecera_del_kyc}
/// Contiene título y subtítulo que aparece en
/// la parte superior del formulario del kyc.
/// {@endtemplate}
class CabeceraDelKyc extends StatelessWidget {
  /// {@macro cabecera_del_kyc}
  const CabeceraDelKyc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.pw),
          child: Text(
            // TODO(Andreas:
            // Hablar con nico sobre problema con el paquete que en la resolucion
            // de telefono no se achica lo suficiente el texto.
            l10n.pageKycTitle,
            style: TextStyle(
              //TODO(Gon): Cambiar cuando esten los colores del theme
              color: const Color(0xff363636),
              fontSize: 40.pf,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 10.ph),
        Text(
          // TODO(Andreas:
          // Hablar con nico sobre problema con el paquete que en la resolucion
          // de telefono no se achica lo suficiente el texto.
          l10n.pageKycSubtitle,
          style: TextStyle(
            //TODO(Gon): Cambiar cuando esten los colores del theme
            color: const Color(0xff707070),
            fontSize: 15.pf,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 50.ph),
      ],
    );
  }
}
