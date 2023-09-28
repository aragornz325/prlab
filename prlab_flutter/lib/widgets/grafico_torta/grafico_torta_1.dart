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
class GraficoTortaEjemplo1 extends StatefulWidget {
  /// {@macro GraficoTortaEjemplo1}
  GraficoTortaEjemplo1({
    required this.listaDePorcentajes,
    required this.coloresDistintos,
    this.touchedIndex = -1,
    this.contenido,
    super.key,
  });

  /// lista de porcentajes que tiene el gráfico
  final List<double> listaDePorcentajes;

  /// contenido de del gráfico para los factory
  final Widget? contenido;

  /// Lista de colores distintos para cada porcentaje a mostrar
  List<Color> coloresDistintos;

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
  factory GraficoTortaEjemplo1.secundario({
    required int touchedIndex,
    required List<Color> coloresDistintos,
    required List<double> listaDePorcentajes,
    required void Function(FlTouchEvent, PieTouchResponse?)? touchCallback,
  }) {
    return GraficoTortaEjemplo1(
      coloresDistintos: coloresDistintos,
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
  factory GraficoTortaEjemplo1.anillo({
    required int touchedIndex,
    required List<Color> coloresDistintos,
    required List<double> listaDePorcentajes,
    required void Function(FlTouchEvent, PieTouchResponse?)? touchCallback,
  }) {
    return GraficoTortaEjemplo1(
      coloresDistintos: coloresDistintos,
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

                  const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

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
  State<GraficoTortaEjemplo1> createState() => _GraficoTortaEjemplo1State();
}

class _GraficoTortaEjemplo1State extends State<GraficoTortaEjemplo1> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocGraficoTorta>(
      create: (context) => BlocGraficoTorta()
        ..add(const BlocGraficoTortaEventoTraerDatos(idArticulo: 0)),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: Column(
          children: <Widget>[
            SizedBox(height: math.max(28.ph, 28.sh)),
            if (widget.contenido == null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...widget.listaDePorcentajes.map(
                    (e) => Indicator(
                      color: widget.coloresDistintos[
                          widget.listaDePorcentajes.indexOf(e)],
                      text: '${e.toString()} %',
                      isSquare: false,
                      size: widget.touchedIndex ==
                              widget.listaDePorcentajes.indexOf(e)
                          ? 18.pw
                          : 16.pw,
                      textColor: widget.touchedIndex ==
                              widget.listaDePorcentajes.indexOf(e)
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
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
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
                        ...widget.listaDePorcentajes.map(
                          (e) => PieChartSectionData(
                            color: widget.coloresDistintos[
                                widget.listaDePorcentajes.indexOf(e)],
                            value: widget.listaDePorcentajes[
                                    widget.listaDePorcentajes.indexOf(e)]
                                .toDouble(),
                            title: '${e.toString()} %',
                            radius: 60,
                            titlePositionPercentageOffset: 0.55,
                            titleStyle: TextStyle(color: Colors.white),
                            borderSide: widget.touchedIndex ==
                                    widget.listaDePorcentajes.indexOf(e)
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
      ),
    );
  }
}
