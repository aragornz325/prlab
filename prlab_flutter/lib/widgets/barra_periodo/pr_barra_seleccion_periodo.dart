import 'package:flutter/material.dart';
import 'package:prlab_flutter/widgets/barra_periodo/barra_periodo.dart';

//TODO(Seba): suplantar
/// Enum utilizado para indexar cada item de la barra de periodo.
enum Periodo {
  hoy,
  ayer,
  ultimaSemana,
  ultimoMes,
  ultimosTresMeses,
  ultimosSeisMeses,
  ultimosDoceMeses;

  bool get esHoy => this == Periodo.hoy;
  bool get esAyer => this == Periodo.ayer;
  bool get esUltimaSemana => this == Periodo.ultimaSemana;
  bool get esUltimoMes => this == Periodo.ultimoMes;
  bool get esUltimosTresMeses => this == Periodo.ultimosTresMeses;
  bool get esUltimosSeisMeses => this == Periodo.ultimosSeisMeses;
  bool get esUltimosDoceMeses => this == Periodo.ultimosDoceMeses;
}

/// {@template BarraSeleccionPeriodo}
/// Barra de seleccion de periodo
/// {@endtemplate}
class PRBarraSeleccionPeriodo extends StatefulWidget {
  /// {@macro BarraSeleccionPeriodo}
  const PRBarraSeleccionPeriodo({super.key});

  @override
  State<PRBarraSeleccionPeriodo> createState() =>
      _PRBarraSeleccionPeriodoState();
}

class _PRBarraSeleccionPeriodoState extends State<PRBarraSeleccionPeriodo> {
  Periodo periodo = Periodo.hoy;

// TODO(Seba): reemplazar texto por l10n de tu enum
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: Periodo.values
          .map(
            (p) => TagPeriodo(
              texto: p.name,
              estaSeleccionado: periodo == p,
              onTap: (value) {
                setState(() {
                  periodo = value;
                });
              },
              periodo: p,
              esPrimero: p.esHoy,
              esUltimo: p.esUltimosDoceMeses,
            ),
          )
          .toList(),
    );
  }
}
