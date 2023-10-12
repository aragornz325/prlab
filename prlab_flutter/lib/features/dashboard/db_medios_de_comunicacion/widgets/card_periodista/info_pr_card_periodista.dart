import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/extensiones/extension_periodista.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/card_periodista/card_periodista.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template InfoPRCardPeriodista}
/// Aquí tendremos toda la información del periodista
/// {@endtemplate}
class InfoPRCardPeriodista extends StatelessWidget {
  /// {@macro InfoPRCardPeriodista}
  const InfoPRCardPeriodista({
    required this.periodista,
    required this.checkboxCallBack,
    super.key,
  });

  // TODO(Manu): Cambiar por modelo del backend

  /// Modelo utilizado para recolectar la informacion del periodista y armar
  /// la tarjeta con su información
  final Periodista periodista;

  /// Función del checkbox para seleccionar un periodista
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool?)? checkboxCallBack;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;
    final estiloTitulo = TextStyle(
      height: 0.ph,
      fontSize: 15.pf,
      fontWeight: FontWeight.w500,
      color: colores.tertiary,
    );
    final estiloSubtitulo = TextStyle(
      height: 0.ph,
      fontSize: 15.pf,
      fontWeight: FontWeight.w400,
      color: colores.secondary,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 10.pw),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: colores.primary,
                  radius: 40.sw,
                  backgroundImage: Image.network(
                    periodista.urlImagen,
                    color: colores.primary,
                  ).image,
                ),
                SizedBox(width: 10.pw),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      periodista.nombreCompleto,
                      style: TextStyle(
                        height: 0.ph,
                        fontSize: 20.pf,
                        fontWeight: FontWeight.w600,
                        color: colores.primary,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    l10n.pageMediaDatabaseAt(periodista.puesto),
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: colores.secondary,
                                ),
                              ),
                              TextSpan(
                                text: periodista.medio,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: colores.tertiary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: max(20.ph, 20.sh)),
            Text(
              l10n.cardPeriodistaLocation,
              style: estiloTitulo,
            ),
            Text(
              periodista.localizacion,
              style: estiloSubtitulo,
            ),
            SizedBox(height: max(20.ph, 20.sh)),
            Text(
              l10n.cardPeriodistaTopicCovered,
              style: estiloTitulo,
            ),
            SizedBox(
              height: max(25.ph, 25.sh),
              width: 340.pw,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10.pw),
                scrollDirection: Axis.horizontal,
                itemCount: periodista.temas.length,
                itemBuilder: (BuildContext context, int index) {
                  return TopicPRCardPeriodista(
                    topic: periodista.temas[index],
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
