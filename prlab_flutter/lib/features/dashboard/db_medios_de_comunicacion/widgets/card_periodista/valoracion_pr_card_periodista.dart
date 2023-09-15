import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/card_periodista/card_periodista.dart';
import 'package:prlab_flutter/theming/base.dart';

/// {@template ValoracionPrCardPeriodista}
/// Contenedor del número de valoración del periodista.
/// {@endtemplate}
class ValoracionPrCardPeriodista extends StatelessWidget {
  /// {@macro ValoracionPrCardPeriodista}
  const ValoracionPrCardPeriodista({
    required this.periodista,
    super.key,
  });

  //! TODO: Cambiar por modelo del backend
  /// Modelo utilizado para recolectar la informacion del periodista y armar
  /// la tarjeta con su información
  final Periodista periodista;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      width: 22.pw,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colores.primaryOpacidadDiez,
      ),
      child: Center(
        child: Text(
          periodista.valoracion.toString(),
          style: TextStyle(
            color: colores.primary,
            fontSize: 12.pf,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
