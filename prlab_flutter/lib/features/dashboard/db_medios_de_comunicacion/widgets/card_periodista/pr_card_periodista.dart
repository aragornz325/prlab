import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/dialog/dialog.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/card_periodista/card_periodista.dart';
import 'package:prlab_flutter/theming/base.dart';

/// {@template PRCardPeriodista}
/// Tarjeta con la descripción y los detalles del periodista.
/// {@endtemplate}
class PRCardPeriodista extends StatelessWidget {
  /// {@macro PRCardPeriodista}
  const PRCardPeriodista({
    required this.periodista,
    super.key,
  });

  final Periodista periodista;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return Container(
      height: 300.ph,
      width: 560.pw,
      decoration: BoxDecoration(
        color: colores.surfaceTint,
        boxShadow: [
          BoxShadow(
            color: colores.secondaryBajaOpacidad,
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10.sw)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15.pw, 15.ph, 20.pw, 20.ph),
        child: Column(
          children: [
            InfoPRCardPeriodista(
              checkboxCallBack: (p0) {},
              periodista: periodista,
            ),
            SizedBox(height: 20.ph),
            RowBotonesEmailPRCardPeriodista(
              periodista: periodista,
              // TODO(Anyone): dar funcionalidad cuando este definida
              onTapAdd: () {},
              onTapDetails: () => DialogInformacionDePeriodista(
                idPeriodista: periodista.id,
              ).show(context),
            ),
          ],
        ),
      ),
    );
  }
}
