// ignore_for_file: must_be_immutable

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/widgets/grafico_torta/modelos/modelos.dart';

/// {@template GraficoTorta}
/// La clase `GráficoTorta` es un widget con estado que genera un gráfico
/// circular con opciones personalizables.
///
/// Contiene dos factory:
///
/// `GraficoTorta.anillo` que dibuja el gráfico
/// con un espacio en el centro(parecido a un anillo)
/// que puede ser personalizado.
///
/// `GraficoTorta.secundario` que dibuja el gráfico de la misma forma
/// que el principal pero con la diferencia de que el index del seleccionado
/// cambia de tamaño y el tamaño de la letra.
///
/// {@endtemplate}
class GraficoTorta<T> extends StatefulWidget {
  /// {@macro GraficoTorta}
  GraficoTorta({
    required this.dataGraficos,
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
  /// Toma parámetros como `indiceSeleccionado`,`coloresDistintos`,
  /// `listaDePorcentajes` y `indiceSeleccionado` para personalizar
  /// la apariencia y el comportamiento del
  /// gráfico circular.
  factory GraficoTorta.anillo({
    /// context para el uso del theme
    required BuildContext context,

    /// Color principal con el cual se van a estar generando los colores de
    /// cada porción de torta [GraficoTorta].
    required Color colorAGenerar,

    /// lista de porcentajes que tiene el gráfico a mostrar [GraficoTorta].
    // TODO(Mati): cambiar docu.
    required List<DataGrafico<T>> dataGraficos,

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
    double tamanioDelGrafico = 100,
  }) {
    return GraficoTorta(
      colorAGenerar: colorAGenerar,
      dataGraficos: dataGraficos,
      contenido: PieChart(
        PieChartData(
          centerSpaceRadius: espacioEnElCentro,
          sectionsSpace: espacioEntreSeleccionado,
          centerSpaceColor: colorDelEspacioCentro,
          startDegreeOffset: rotacionDelGrafico,
          borderData: FlBorderData(show: false),
          pieTouchData: PieTouchData(touchCallback: touchCallback),
          sections: _generarDatosGraficoTorta<T>(
            esPrincipal: false,
            context: context,
            colorAGenerar: colorAGenerar,
            data: dataGraficos,
            estiloDelTitulo: estiloDelTitulo,
            indiceSeleccionado: indiceSeleccionado,
            tamanioDelGrafico: tamanioDelGrafico,
            sombras: const [
              Shadow(blurRadius: 2),
            ],
          ),
        ),
      ),
    );
  }

  /// LLama a esta función `GraficoTortaEjemplo1.secundario`
  ///
  /// Grafico de torta de Secundario
  /// Toma parámetros como `indiceSeleccionado`,`coloresDistintos`,
  /// `listaDePorcentajes` y `indiceSeleccionado` para personalizar
  /// la apariencia y el comportamiento del
  /// gráfico circular.
  factory GraficoTorta.secundario({
    /// context para el uso del theme
    required BuildContext context,

    /// Color principal con el cual se van a estar generando los colores de
    /// cada porción de torta [GraficoTorta].
    required Color colorAGenerar,

    /// lista de porcentajes que tiene el gráfico a mostrar [GraficoTorta].
    // TODO(Mati): cambiar docu.
    required List<DataGrafico<T>> listaDataGrafico,

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
    return GraficoTorta(
      colorAGenerar: colorAGenerar,
      indiceSeleccionado: indiceSeleccionado,
      dataGraficos: listaDataGrafico,
      contenido: Expanded(
        child: AspectRatio(
          aspectRatio: 1,
          child: PieChart(
            PieChartData(
              sectionsSpace: espacioEntreSeleccionado,
              centerSpaceRadius: espacioEnElCentro,
              centerSpaceColor: colorDelEspacioCentro,
              startDegreeOffset: rotacionDelGrafico,
              pieTouchData: PieTouchData(touchCallback: touchCallback),
              borderData: FlBorderData(show: false),
              sections: _generarDatosGraficoTorta<T>(
                esPrincipal: false,
                context: context,
                colorAGenerar: colorAGenerar,
                data: listaDataGrafico,
                estiloDelTitulo: estiloDelTitulo,
                indiceSeleccionado: indiceSeleccionado,
                tamanioDelGrafico: tamanioDelGrafico,
                sombras: const [
                  Shadow(
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// lista de porcentajes que tiene el gráfico a mostrar [GraficoTorta].
  // TODO(Mati): cambiar docu.
  final List<DataGrafico<T>> dataGraficos;

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
  State<GraficoTorta<T>> createState() => _GraficoTortaState();
}

class _GraficoTortaState<T> extends State<GraficoTorta<T>> {
  final colores = <Color>[];

  @override
  Widget build(BuildContext context) {
    final contenido = widget.contenido;

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
    return AspectRatio(
      aspectRatio: 1.3,
      child: Expanded(
        child: contenido ??
            PieChart(
              PieChartData(
                centerSpaceColor: widget.colorDelEspacioCentro,
                startDegreeOffset: widget.rotacionDelGrafico,
                sectionsSpace: widget.espacioEntreSeleccionado,
                centerSpaceRadius: widget.espacioEnElCentro,
                borderData: FlBorderData(show: false),
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    // ? Aca se podría agregar un callback según el indice para
                    // ? poder tomar el 'T' que nos brinda el modelo de
                    // ? DataGrafico y poder hacer cosas con ese modelo.
                    // ? ej: onClickPorcionDelPieChart.call(dataGraficos[index])
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        widget.indiceSeleccionado = -1;
                        return;
                      }

                      widget.indiceSeleccionado =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                sections: _generarDatosGraficoTorta<T>(
                  context: context,
                  estiloBordeConCursorDelGrafico:
                      widget.estiloBordeConCursorDelGrafico,
                  estiloBordeSinCursorDelGrafico:
                      widget.estiloBordeSinCursorDelGrafico,
                  estiloDelTitulo: widget.estiloDelTitulo,
                  indiceSeleccionado: widget.indiceSeleccionado,
                  posicionDelTituloEnElGrafico:
                      widget.posicionDelTituloEnElGrafico,
                  tamanioDelGrafico: widget.tamanioDelGrafico,
                  colorAGenerar: widget.colorAGenerar,
                  data: widget.dataGraficos,
                ),
              ),
            ),
      ),
    );
  }
}

/// Genera las listas de `PieChartSectionData` lo que serian los pedazos de
/// torta del [GraficoTorta].
List<PieChartSectionData> _generarDatosGraficoTorta<T>({
  required BuildContext context,
  required List<DataGrafico<T>> data,
  required Color colorAGenerar,
  bool esPrincipal = true,
  int? indiceSeleccionado,
  double? posicionDelTituloEnElGrafico,
  double? tamanioDelGrafico,
  TextStyle? estiloDelTitulo,
  BorderSide? estiloBordeConCursorDelGrafico,
  BorderSide? estiloBordeSinCursorDelGrafico,
  List<Shadow>? sombras,
}) {
  final colores = context.colores;

  final listaDeColores = _onGenerarListaDeColoresBajaOpacidad(
    colorAGenerar,
    data.length,
  );

  final total = data.fold<double>(0, (p, e) => p + e.cantidad);

  return data.map(
    (e) {
      final isSeleccionado = data.indexOf(e) == indiceSeleccionado;

      final fontSize = isSeleccionado && !esPrincipal ? 20.0 : 16.0;

      final radius = isSeleccionado && !esPrincipal ? 110.0 : tamanioDelGrafico;

      final porcentaje = (e.cantidad / total) * 100;

      final titulo = '${porcentaje.toStringAsFixed(2)}%';

      return PieChartSectionData(
        titlePositionPercentageOffset: posicionDelTituloEnElGrafico,
        radius: radius,
        color: listaDeColores[data.indexOf(e)],
        value: porcentaje,
        title: titulo,
        titleStyle: estiloDelTitulo ??
            TextStyle(
              color: colores.surfaceTint,
              fontSize: fontSize,
              shadows: sombras,
            ),
        borderSide: isSeleccionado && esPrincipal
            ? estiloBordeConCursorDelGrafico ??
                BorderSide(
                  color: colores.surfaceTint,
                  width: 3,
                )
            : estiloBordeSinCursorDelGrafico ??
                BorderSide(
                  color: colores.surfaceTint.withOpacity(0),
                ),
      );
    },
  ).toList();
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
