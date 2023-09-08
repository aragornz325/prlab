import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
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
        Checkbox(
          value: periodista.estaSeleccionado,
          onChanged: checkboxCallBack,
        ),
        SizedBox(width: 10.pw),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40.sw,
                  backgroundImage: Image.network(
                    periodista.avatar,
                  ).image,
                ),
                SizedBox(width: 10.pw),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      periodista.name,
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
                        Text(
                          l10n.cardPeriodistaAnchorAt,
                          style: estiloTitulo,
                        ),
                        Text(
                          periodista.anchor,
                          style: estiloSubtitulo,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.ph),
            Text(
              l10n.cardPeriodistaLocation,
              style: estiloTitulo,
            ),
            Text(
              periodista.location,
              style: estiloSubtitulo,
            ),
            SizedBox(height: 20.ph),
            Text(
              l10n.cardPeriodistaTopicCovered,
              style: estiloTitulo,
            ),
            SizedBox(
              height: 25.ph,
              width: 370.pw,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10.pw),
                scrollDirection: Axis.horizontal,
                itemCount: periodista.topicCovered.length,
                itemBuilder: (BuildContext context, int index) {
                  return TopicPRCardPeriodista(
                    topic: periodista.topicCovered[index],
                  );
                },
              ),
            ),
          ],
        ),
        const Spacer(),
        ValoracionPrCardPeriodista(periodista: periodista),
      ],
    );
  }
}
