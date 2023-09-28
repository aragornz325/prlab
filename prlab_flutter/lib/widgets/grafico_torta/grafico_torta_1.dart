import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/widgets/grafico_torta/bloc/bloc_grafico_torta.dart';
import 'package:prlab_flutter/widgets/grafico_torta/indicator.dart';

/// {@template GraficoTortaEjemplo1}
/// TODO(mati): documentar
/// {@endtemplate}
class GraficoTortaEjemplo1 extends StatefulWidget {
  /// {@macro GraficoTortaEjemplo1}
  const GraficoTortaEjemplo1({
    required this.listaDePorcentajes,
    super.key,
  });

  final List<double> listaDePorcentajes;
  @override
  State<GraficoTortaEjemplo1> createState() => _GraficoTortaEjemplo1State();
}

class _GraficoTortaEjemplo1State extends State<GraficoTortaEjemplo1> {
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
                SizedBox(height: math.max(28.ph, 28.sh)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...state.porcentajes.map(
                      (e) => Indicator(
                        color: coloresDistintos[state.porcentajes.indexOf(e)],
                        text: '${e.toString()} %',
                        isSquare: false,
                        size: touchedIndex == state.porcentajes.indexOf(e)
                            ? 18.pw
                            : 16.pw,
                        textColor: touchedIndex == state.porcentajes.indexOf(e)
                            ? Colors.black
                            : Colors.white70,
                      ),
                    ),
                  ],
                ),
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
                            (e) => PieChartSectionData(
                              color: coloresDistintos[
                                  state.porcentajes.indexOf(e)],
                              value: state
                                  .porcentajes[state.porcentajes.indexOf(e)]
                                  .toDouble(),
                              title: '${e.toString()} %',
                              radius: 60,
                              titlePositionPercentageOffset: 0.55,
                              titleStyle: TextStyle(color: Colors.white),
                              borderSide:
                                  touchedIndex == state.porcentajes.indexOf(e)
                                      ? const BorderSide(
                                          color: Colors.white, width: 6)
                                      : BorderSide(
                                          color: Colors.white.withOpacity(0),
                                        ),
                            ),
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
