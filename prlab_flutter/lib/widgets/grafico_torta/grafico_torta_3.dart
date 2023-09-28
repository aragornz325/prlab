import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/widgets/grafico_torta/bloc/bloc_grafico_torta.dart';

/// {@template GraficoTortaEjemplo1}
/// TODO(mati): documentar
/// {@endtemplate}
class GraficoTortaEjemplo3 extends StatefulWidget {
  /// {@macro GraficoTortaEjemplo1}
  const GraficoTortaEjemplo3({
    required this.listaDePorcentajes,
    super.key,
  });

  final List<double> listaDePorcentajes;
  @override
  State<GraficoTortaEjemplo3> createState() => _GraficoTortaEjemplo3State();
}

class _GraficoTortaEjemplo3State extends State<GraficoTortaEjemplo3> {
  int touchedIndex = -1;

  List<Color> coloresDistintos = [
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocGraficoTorta>(
      create: (context) => BlocGraficoTorta()
        ..add(const BlocGraficoTortaEventoTraerDatos(idArticulo: 0)),
      child: BlocBuilder<BlocGraficoTorta, BlocGraficoTortaEstado>(
        builder: (context, state) {
          return AspectRatio(
            aspectRatio: 1.3,
            child: Column(
              children: <Widget>[
                SizedBox(height: math.max(18.ph, 18.sh)),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex = -1;
                                return;
                              }
                              touchedIndex = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          },
                        ),
                        startDegreeOffset: 180,
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 1,
                        centerSpaceRadius: 0,
                        sections: [
                          ...state.porcentajes.map(
                            (e) {
                              final isTouched =
                                  state.porcentajes.indexOf(e) == touchedIndex;
                              final fontSize = isTouched ? 20.0 : 16.0;
                              final radius = isTouched ? 110.0 : 100.0;
                              const shadows = [
                                Shadow(color: Colors.black, blurRadius: 2)
                              ];
                              return PieChartSectionData(
                                color: coloresDistintos[
                                    state.porcentajes.indexOf(e)],
                                value: state
                                    .porcentajes[state.porcentajes.indexOf(e)]
                                    .toDouble(),
                                title: '${e.toString()}%',
                                radius: radius,
                                titleStyle: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffffffff),
                                  shadows: shadows,
                                ),
                                badgePositionPercentageOffset: .98,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
