// ignore_for_file: must_be_immutable

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/widgets/grafico_torta/bloc/bloc_grafico_torta.dart';

/// {@template GraficoTorta}
/// TODO(mati): documentar
/// {@endtemplate}
class GraficoTorta extends StatefulWidget {
  /// {@macro GraficoTorta}
  GraficoTorta({
    required this.listaDePorcentajes,
    required this.colorAGenerar,
    this.tamanioDelGrafico = 100,
    this.posicionDelTituloEnElGrafico = 0.55,
    this.indiceSeleccionado = -1,
    this.espacioEnElCentro = 0,
    this.rotacionDelGrafico = 180,
    this.espacioEntreSeleccionado = 1,
    this.estiloBordeConCursorDelGrafico,
    this.estiloBordeSinCursorDelGrafico,
    this.colorDelEspacioCentro,
    this.estiloDelTitulo,
    this.contenido,
    super.key,
  });

  /// LLama a esta función `GraficoTortaEjemplo1.anillo`
  ///
  /// Grafico de torta de anillo
  /// Toma parámetros como `touchedIndex`,`coloresDistintos`,
  /// `listaDePorcentajes` y `touchCallback` para personalizar la apariencia
  /// y el comportamiento del
  /// gráfico circular.
  factory GraficoTorta.anillo({
    /// context para el uso del theme
    required BuildContext context,

    /// Color principal con el cual se van a estar generando los colores de
    /// cada porción de torta [GraficoTorta].
    required Color colorAGenerar,

    /// lista de porcentajes que tiene el gráfico a mostrar [GraficoTorta].
    required List<double> listaDePorcentajes,

    /// index seleccionado para que cambie ciertos parámetros para darle un
    /// efecto [GraficoTorta].
    int indiceSeleccionado = -1,

    /// Efecto que hace al dejar el cursor sobre una porción
    /// de torta [GraficoTorta].
    void Function(FlTouchEvent, PieTouchResponse?)? touchCallback,

    /// Color del espacio del centro de la torta [GraficoTorta].
    Color? colorDelEspacioCentro,

    /// Espacio en el centro cuando es muy grande el gráfico puede ser el de un
    /// anillo [GraficoTorta].
    double? espacioEnElCentro = 40,

    /// Espacio entre pedazos de torta [GraficoTorta]..
    double? espacioEntreSeleccionado = 0,

    /// rotación del gráfico para darle un efecto [GraficoTorta].
    double? rotacionDelGrafico,

    /// Estilo Del titulo dentro del circulo [GraficoTorta].
    TextStyle? estiloDelTitulo,

    /// Radio Total del Grafico define el tamaño del circulo [GraficoTorta].
    double tamanioDelGrafico = 50,
  }) {
    final colores = context.colores;

    return GraficoTorta(
      colorAGenerar: Colors.black,
      listaDePorcentajes: listaDePorcentajes,
      contenido: Expanded(
        child: AspectRatio(
          aspectRatio: 3,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: espacioEnElCentro,
              sectionsSpace: espacioEntreSeleccionado,
              centerSpaceColor: colorDelEspacioCentro,
              startDegreeOffset: rotacionDelGrafico,
              pieTouchData: PieTouchData(
                touchCallback: touchCallback,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              sections: [
                ...listaDePorcentajes.map((e) {
                  // TODO(mati): preguntarle a louka si esta logica va aca o
                  // TODO(mati): la hace en otro lado
                  final listaDeColores = _onGenerarListaDeColoresBajaOpacidad(
                    colorAGenerar,
                    listaDePorcentajes.length,
                  );

                  final isTouched =
                      listaDePorcentajes.indexOf(e) == indiceSeleccionado;

                  final fontSize = isTouched ? 25.0 : 16.0;

                  final radius = isTouched ? 60.0 : tamanioDelGrafico;

                  final shadows = [
                    Shadow(color: colores.secondary, blurRadius: 1),
                  ];

                  return PieChartSectionData(
                    color: listaDeColores[listaDePorcentajes.indexOf(e)],
                    value: listaDePorcentajes[listaDePorcentajes.indexOf(e)],
                    title: '$e %',
                    radius: radius,
                    titleStyle: estiloDelTitulo ??
                        TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: colores.tertiary,
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

  /// LLama a esta función `GraficoTortaEjemplo1.secundario`
  ///
  /// Grafico de torta de Secundario
  /// Toma parámetros como `touchedIndex`,`coloresDistintos`,
  /// `listaDePorcentajes` y `touchCallback` para personalizar la apariencia
  /// y el comportamiento del
  /// gráfico circular.
  factory GraficoTorta.secundario({
    /// context para el uso del theme
    required BuildContext context,

    /// Color principal con el cual se van a estar generando los colores de
    /// cada porción de torta [GraficoTorta].
    required Color colorAGenerar,

    /// lista de porcentajes que tiene el gráfico a mostrar [GraficoTorta].
    required List<double> listaDePorcentajes,

    /// index seleccionado para que cambie ciertos parámetros para darle un
    /// efecto.
    int indiceSeleccionado = -1,

    /// Efecto que hace al dejar el cursor sobre una porción
    /// de torta [GraficoTorta].
    void Function(FlTouchEvent, PieTouchResponse?)? touchCallback,

    /// Color del espacio del centro de la torta [GraficoTorta].
    Color? colorDelEspacioCentro,

    /// Espacio en el centro cuando es muy grande el gráfico puede ser el de un
    /// anillo[GraficoTorta].
    double? espacioEnElCentro = 0,

    /// Espacio entre pedazos de torta [GraficoTorta].
    double? espacioEntreSeleccionado = 1,

    /// rotación del gráfico para darle un efecto [GraficoTorta].
    double? rotacionDelGrafico = 180,

    /// Radio Total del Grafico define el tamaño del circulo [GraficoTorta].
    double tamanioDelGrafico = 100,

    /// Estilo Del titulo dentro del circulo [GraficoTorta].
    TextStyle? estiloDelTitulo,
  }) {
    final colores = context.colores;

    return GraficoTorta(
      colorAGenerar: colorDelEspacioCentro ?? Colors.black,
      indiceSeleccionado: indiceSeleccionado,
      listaDePorcentajes: listaDePorcentajes,
      contenido: Expanded(
        child: AspectRatio(
          aspectRatio: 1,
          child: PieChart(
            PieChartData(
              sectionsSpace: espacioEntreSeleccionado,
              centerSpaceRadius: espacioEnElCentro,
              pieTouchData: PieTouchData(touchCallback: touchCallback),
              startDegreeOffset: rotacionDelGrafico,
              borderData: FlBorderData(
                show: false,
              ),
              sections: [
                ...listaDePorcentajes.map(
                  (e) {
                    // TODO(mati): preguntarle a louka si esta logica va aca o
                    // TODO(mati): la hace en otro lado
                    final listaDeColores = _onGenerarListaDeColoresBajaOpacidad(
                      colorAGenerar,
                      listaDePorcentajes.length,
                    );

                    final isTouched =
                        listaDePorcentajes.indexOf(e) == indiceSeleccionado;

                    final fontSize = isTouched ? 20.0 : 16.0;

                    final radius = isTouched ? 110.0 : tamanioDelGrafico;

                    const shadows = [
                      Shadow(color: Colors.black, blurRadius: 2),
                    ];

                    return PieChartSectionData(
                      color: listaDeColores[listaDePorcentajes.indexOf(e)],
                      value: listaDePorcentajes[listaDePorcentajes.indexOf(e)]
                          .toDouble(),
                      title: '$e%',
                      radius: radius,
                      titleStyle: estiloDelTitulo ??
                          TextStyle(
                            fontSize: fontSize,
                            color: colores.surfaceTint,
                            fontWeight: FontWeight.bold,
                            shadows: shadows,
                          ),
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

  /// lista de porcentajes que tiene el gráfico a mostrar [GraficoTorta].
  final List<double> listaDePorcentajes;

  /// contenido de del gráfico para los factory de [GraficoTorta].
  final Widget? contenido;

  /// Color principal con el cual se van a estar generando los colores de cada
  /// porción de torta [GraficoTorta].
  Color colorAGenerar;

  /// index seleccionado para que cambie ciertos parámetros para darle un efecto
  int indiceSeleccionado;

  /// Radio Total del Grafico define el tamaño del circulo [GraficoTorta].
  final double tamanioDelGrafico;

  /// Posición del Titulo en el Grafico cuanto mayor es el tamaño
  /// mas lejos del centro estará [GraficoTorta].
  final double posicionDelTituloEnElGrafico;

  /// Estilo Del titulo dentro del circulo [GraficoTorta].
  final TextStyle? estiloDelTitulo;

  /// Define el estilo del border cuando el cursor esta sobre de la porción de
  /// torta [GraficoTorta].
  final BorderSide? estiloBordeConCursorDelGrafico;

  /// Define el estilo del border cuando el cursor no esta sobre de la porción
  /// de torta [GraficoTorta].
  final BorderSide? estiloBordeSinCursorDelGrafico;

  /// Espacio en el centro cuando es muy grande el gráfico puede ser el de un
  /// anillo[GraficoTorta].
  final double? espacioEnElCentro;

  /// Espacio entre pedazos de torta [GraficoTorta].
  final double? espacioEntreSeleccionado;

  /// rotación del gráfico para darle un efecto [GraficoTorta].
  final double? rotacionDelGrafico;

  /// Color del espacio del centro de la torta [GraficoTorta].
  final Color? colorDelEspacioCentro;

  @override
  State<GraficoTorta> createState() => _GraficoTortaState();
}

class _GraficoTortaState extends State<GraficoTorta> {
  final colores = <Color>[];

  Widget build(BuildContext context) {
    final colores = context.colores;

    // TODO(mati): sacar este bloc para que se mande la lista del otro bloc
    return BlocProvider<BlocGraficoTorta>(
      create: (context) => BlocGraficoTorta()
        ..add(const BlocGraficoTortaEventoTraerDatos(idArticulo: 0)),
      child: BlocBuilder<BlocGraficoTorta, BlocGraficoTortaEstado>(
        builder: (context, state) {
          final listaDeColores = _onGenerarListaDeColoresBajaOpacidad(
            widget.colorAGenerar,
            // TODO(mati): reemplazar por la lista que manden
            // widget.porcentajes.map
            state.porcentajes.length,
          );

          return AspectRatio(
            aspectRatio: 1.3,
            child: Column(
              children: <Widget>[
                // TODO(mati) : hablar con louka de sacar esto es el indicador
                // TODOde cual esta seleccionado se puede hacer desde otro
                // TODOcomponente calculo que sera borrado

                // SizedBox(height: math.max(28.ph, 28.sh)),
                // if (widget.contenido == null)
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       ...state.porcentajes.map(
                //         (e) => Indicator(
                //           color: colores[state.porcentajes.indexOf(e)],
                //           text: '${e.toString()} %',
                //           isSquare: false,
                //           size: widget.indiceSeleccionado ==
                //                   state.porcentajes.indexOf(e)
                //               ? 18.pw
                //               : 16.pw,
                //           textColor: widget.indiceSeleccionado ==
                //                   state.porcentajes.indexOf(e)
                //               ? Colors.black
                //               : Colors.white70,
                //         ),
                //       ),
                //     ],
                //   ),
                // SizedBox(height: math.max(18.ph, 18.sh)),

                if (widget.contenido != null)
                  widget.contenido!
                else
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        centerSpaceColor: widget.colorDelEspacioCentro,
                        startDegreeOffset: widget.rotacionDelGrafico,
                        sectionsSpace: widget.espacioEntreSeleccionado,
                        centerSpaceRadius: widget.espacioEnElCentro,
                        borderData: FlBorderData(
                          show: false,
                        ),
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                widget.indiceSeleccionado = -1;
                                return;
                              }
                              widget.indiceSeleccionado = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          },
                        ),
                        sections: [
                          // TODO(mati): reemplazar por la lista que manden
                          // widget.porcentajes.map
                          ...state.porcentajes.map(
                            (e) => PieChartSectionData(
                              titlePositionPercentageOffset:
                                  widget.posicionDelTituloEnElGrafico,
                              radius: widget.tamanioDelGrafico,
                              color:
                                  listaDeColores[state.porcentajes.indexOf(e)],
                              value: state
                                  .porcentajes[state.porcentajes.indexOf(e)],
                              title: '$e%',
                              titleStyle: widget.estiloDelTitulo ??
                                  TextStyle(
                                    color: colores.surfaceTint,
                                  ),
                              borderSide: widget.indiceSeleccionado ==
                                      state.porcentajes.indexOf(e)
                                  ? widget.estiloBordeConCursorDelGrafico ??
                                      BorderSide(
                                        color: colores.surfaceTint,
                                        width: 3,
                                      )
                                  : widget.estiloBordeSinCursorDelGrafico ??
                                      BorderSide(
                                        color:
                                            colores.surfaceTint.withOpacity(0),
                                      ),
                            ),
                          ),
                        ],
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

/// Devuelve una lista de colores en base a un color que le pases.
List<Color> _onGenerarListaDeColoresBajaOpacidad(
  Color colorBase,
  int numeroDeSombras,
) {
  final colores = <Color>[];
  final step = 1.0 / numeroDeSombras;

  for (var i = 0; i < numeroDeSombras; i++) {
    final opacidad = (i + 1) * step;
    final nuevoColor = colorBase.withOpacity(opacidad);
    colores.add(nuevoColor);
  }

  return colores;
}
