import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/widgets/grafico_torta/bloc/bloc_grafico_torta.dart';
import 'package:prlab_flutter/widgets/grafico_torta/indicator.dart';

class GraficoTortaEjemplo2 extends StatefulWidget {
  const GraficoTortaEjemplo2({
    required this.listaDePorcentajes,
    super.key,
  });
  final List<double> listaDePorcentajes;
  @override
  State<GraficoTortaEjemplo2> createState() => _GraficoTortaEjemplo2State();
}

class _GraficoTortaEjemplo2State extends State<GraficoTortaEjemplo2> {
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
            child: Row(
              children: <Widget>[
                const SizedBox(
                  height: 18,
                ),
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
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: [
                          ...state.porcentajes.map((e) {
                            final isTouched =
                                state.porcentajes.indexOf(e) == touchedIndex;
                            final fontSize = isTouched ? 25.0 : 16.0;
                            final radius = isTouched ? 60.0 : 50.0;
                            const shadows = [
                              Shadow(color: Colors.black, blurRadius: 2)
                            ];
                            return PieChartSectionData(
                              color: coloresDistintos[
                                  state.porcentajes.indexOf(e)],
                              value: state
                                  .porcentajes[state.porcentajes.indexOf(e)]
                                  .toDouble(),
                              title: '${e.toString()} %',
                              radius: radius,
                              titleStyle: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                shadows: shadows,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Indicator(
                      color: Colors.blue,
                      text: 'First',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Colors.yellow,
                      text: 'Second',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Colors.purple,
                      text: 'Third',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Colors.green,
                      text: 'Fourth',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 28,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
