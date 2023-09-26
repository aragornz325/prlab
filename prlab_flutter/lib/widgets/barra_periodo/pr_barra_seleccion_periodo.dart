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

// TODO(Seba): reemplazar constantes por l10n
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TagPeriodo(
          periodo: Periodo.hoy,
          onTap: (value) {
            setState(() {
              periodo = value;
            });
          },
          esPrimero: true,
          texto: 'Today',
          estaSeleccionado: periodo.esHoy,
        ),
        const DividerPeriodo(),
        TagPeriodo(
          periodo: Periodo.ayer,
          onTap: (value) {
            setState(() {
              periodo = value;
            });
          },
          texto: 'Yesterday',
          estaSeleccionado: periodo.esAyer,
        ),
        const DividerPeriodo(),
        TagPeriodo(
          periodo: Periodo.ultimaSemana,
          onTap: (value) {
            setState(() {
              periodo = value;
            });
          },
          texto: 'Last 7 days',
          estaSeleccionado: periodo.esUltimaSemana,
        ),
        const DividerPeriodo(),
        TagPeriodo(
          periodo: Periodo.ultimoMes,
          onTap: (value) {
            setState(() {
              periodo = value;
            });
          },
          texto: 'Last 30 days',
          estaSeleccionado: periodo.esUltimoMes,
        ),
        const DividerPeriodo(),
        TagPeriodo(
          periodo: Periodo.ultimosTresMeses,
          onTap: (value) {
            setState(() {
              periodo = value;
            });
          },
          texto: 'Last 3 months',
          estaSeleccionado: periodo.esUltimosTresMeses,
        ),
        const DividerPeriodo(),
        TagPeriodo(
          periodo: Periodo.ultimosSeisMeses,
          onTap: (value) {
            setState(() {
              periodo = value;
            });
          },
          texto: 'Last 6 months',
          estaSeleccionado: periodo.esUltimosSeisMeses,
        ),
        const DividerPeriodo(),
        TagPeriodo(
          periodo: Periodo.ultimosDoceMeses,
          onTap: (value) {
            setState(() {
              periodo = value;
            });
          },
          esUltimo: true,
          texto: 'Last 12 months',
          estaSeleccionado: periodo.esUltimosDoceMeses,
        ),
      ],
    );
  }
}
