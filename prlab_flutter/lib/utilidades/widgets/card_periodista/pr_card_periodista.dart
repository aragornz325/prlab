import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/theming/base.dart';
import 'package:prlab_flutter/utilidades/widgets/card_periodista/card_periodista.dart';

/// {@template PRCardPeriodista}
/// Tarjeta con la descripción y los detalles del periodista.
/// {@endtemplate}
class PRCardPeriodista extends StatelessWidget {
  /// {@macro PRCardPeriodista}
  const PRCardPeriodista({super.key});

  @override
  Widget build(BuildContext context) {
    //! TODO: cambiar por modelo creado por el backend
    final periodista = Periodista(
      name: 'Javier Milei',
      anchor: 'Presidente de Argentina',
      location: 'Argentina',
      topicCovered: [
        'Politics',
        'Economy',
        'Libertarian',
        'Humanity',
        'blablablablablabla',
      ],
      email: 'javi_goalkeeper@yahoo.com',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/d/da/Javier_Milei_VIVA22_%28cropped%29.jpg',
      valoracion: 99,
      estaSeleccionado: true,
    );

    final colores = context.colores;
    return Container(
      height: 290.ph,
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
              onTapDetails: () {},
            ),
          ],
        ),
      ),
    );
  }
}
