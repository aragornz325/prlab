// ignore_for_file: must_be_immutable

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
class GraficoTorta extends StatefulWidget {
  /// {@macro GraficoTortaEjemplo1}
  GraficoTorta({
    required this.listaDePorcentajes,
    required this.colorAGenerar,
    this.touchedIndex = -1,
    this.contenido,
    super.key,
  });

  /// lista de porcentajes que tiene el gráfico
  final List<double> listaDePorcentajes;

  /// contenido de del gráfico para los factory
  final Widget? contenido;

  /// Lista de colores distintos para cada porcentaje a mostrar
  Color colorAGenerar;

  /// index seleccionado para que cambie ciertos parámetros para darle un efecto
  int touchedIndex;

  ///
  /// LLama a esta función `GraficoTortaEjemplo1.secundario`
  ///
  /// Grafico de torta de Secundario
  /// Toma parámetros como `touchedIndex`,`coloresDistintos`,
  /// `listaDePorcentajes` y `touchCallback` para personalizar la apariencia
  /// y el comportamiento del
  /// gráfico circular.
  factory GraficoTorta.secundario({
    required int touchedIndex,
    required List<Color> coloresDistintos,
    required List<double> listaDePorcentajes,
    required void Function(FlTouchEvent, PieTouchResponse?)? touchCallback,
  }) {
    return GraficoTorta(
      colorAGenerar: Colors.black,
      touchedIndex: touchedIndex,
      listaDePorcentajes: listaDePorcentajes,
      contenido: Expanded(
        child: AspectRatio(
          aspectRatio: 1,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(touchCallback: touchCallback),
              startDegreeOffset: 180,
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 1,
              centerSpaceRadius: 0,
              sections: [
                ...listaDePorcentajes.map(
                  (e) {
                    final isTouched =
                        listaDePorcentajes.indexOf(e) == touchedIndex;

                    final fontSize = isTouched ? 20.0 : 16.0;

                    final radius = isTouched ? 110.0 : 100.0;

                    const shadows = [
                      Shadow(color: Colors.black, blurRadius: 2),
                    ];

                    return PieChartSectionData(
                      color: coloresDistintos[listaDePorcentajes.indexOf(e)],
                      value: listaDePorcentajes[listaDePorcentajes.indexOf(e)]
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
    );
  }

  ///
  /// LLama a esta función `GraficoTortaEjemplo1.anillo`
  ///
  /// Grafico de torta de anillo
  /// Toma parámetros como `touchedIndex`,`coloresDistintos`,
  /// `listaDePorcentajes` y `touchCallback` para personalizar la apariencia
  /// y el comportamiento del
  /// gráfico circular.
  factory GraficoTorta.anillo({
    required int touchedIndex,
    required List<Color> coloresDistintos,
    required List<double> listaDePorcentajes,
    required void Function(FlTouchEvent, PieTouchResponse?)? touchCallback,
  }) {
    return GraficoTorta(
      colorAGenerar: Colors.black,
      listaDePorcentajes: listaDePorcentajes,
      contenido: Expanded(
        child: AspectRatio(
          aspectRatio: 3,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: touchCallback,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: [
                ...listaDePorcentajes.map((e) {
                  final isTouched =
                      listaDePorcentajes.indexOf(e) == touchedIndex;

                  final fontSize = isTouched ? 25.0 : 16.0;

                  final radius = isTouched ? 60.0 : 50.0;

                  const shadows = [
                    Shadow(color: Colors.black, blurRadius: 2),
                  ];

                  return PieChartSectionData(
                    color: coloresDistintos[listaDePorcentajes.indexOf(e)],
                    value: listaDePorcentajes[listaDePorcentajes.indexOf(e)]
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
    );
  }

  @override
  State<GraficoTorta> createState() => _GraficoTortaState();
}

class _GraficoTortaState extends State<GraficoTorta> {
  final colores = <Color>[];

  List<Color> generateShadesOfColor(Color baseColor, int numberOfShades) {
    final List<Color> shades = [];
    final double step = 1.0 / numberOfShades;

    for (int i = 0; i < numberOfShades; i++) {
      final double opacity = (i + 1) * step;
      final Color shade = baseColor.withOpacity(opacity);
      shades.add(shade);
    }

    return shades;
  }

  Widget build(BuildContext context) {
    return BlocProvider<BlocGraficoTorta>(
      create: (context) => BlocGraficoTorta()
        ..add(const BlocGraficoTortaEventoTraerDatos(idArticulo: 0)),
      child: BlocBuilder<BlocGraficoTorta, BlocGraficoTortaEstado>(
        builder: (context, state) {
          final colores = generateShadesOfColor(
            widget.colorAGenerar,
            state.porcentajes.length,
          );
          return AspectRatio(
            aspectRatio: 1.3,
            child: Column(
              children: <Widget>[
                SizedBox(height: math.max(28.ph, 28.sh)),
                if (widget.contenido == null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...state.porcentajes.map(
                        (e) => Indicator(
                          color: colores[state.porcentajes.indexOf(e)],
                          text: '${e.toString()} %',
                          isSquare: false,
                          size: widget.touchedIndex ==
                                  state.porcentajes.indexOf(e)
                              ? 18.pw
                              : 16.pw,
                          textColor: widget.touchedIndex ==
                                  state.porcentajes.indexOf(e)
                              ? Colors.black
                              : Colors.white70,
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: math.max(18.ph, 18.sh)),
                if (widget.contenido != null)
                  widget.contenido!
                else
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
                                  widget.touchedIndex = -1;
                                  return;
                                }
                                widget.touchedIndex = pieTouchResponse
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
                                color: colores[state.porcentajes.indexOf(e)],
                                value: state
                                    .porcentajes[state.porcentajes.indexOf(e)]
                                    .toDouble(),
                                title: '${e.toString()} %',
                                radius: 100,
                                titlePositionPercentageOffset: 0.55,
                                titleStyle: TextStyle(color: Colors.white),
                                borderSide: widget.touchedIndex ==
                                        state.porcentajes.indexOf(e)
                                    ? const BorderSide(
                                        color: Colors.white,
                                        width: 6,
                                      )
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
