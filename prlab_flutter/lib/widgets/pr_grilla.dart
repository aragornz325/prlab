import 'package:flutter/material.dart';

/// {@template Grilla}
/// Genérica que representa una cuadrícula o tabla
/// {@Grilla}
class Grilla<T> extends StatelessWidget {
  /// {@macro Grilla}
  const Grilla({
    required this.listaColumnas,
    super.key,
    this.scrollController,
  });

  /// Lista de ColumnaBase con la cual le pasamos la lista del tipo de esa
  /// columna
  final List<ColumnaBase> listaColumnas;

  /// Scroll con la cual se hace scroll entre esa columna.
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ...listaColumnas.map(
                (modelo) {
                  if (modelo.celdaEncabezadoColumna != null) {
                    return modelo.celdaEncabezadoColumna!(
                      modelo.nombreColumna ?? '',
                    );
                  }

                  return SizedBox(
                    width: modelo.widthDeLaColumna,
                    height: 50,
                    child: Text(modelo.nombreColumna ?? ''),
                  );
                },
              ),
            ],
          ),
          Flexible(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Row(
                children: [
                  ...listaColumnas.map(
                    (columna) {
                      return SizedBox(
                        width: columna.widthDeLaColumna,
                        child: Column(
                          children: [
                            if (columna is Columna<String>)
                              ...columna.lista.map((e) => columna.celda(e)),
                            if (columna is Columna<DateTime>)
                              ...columna.lista.map((e) => columna.celda(e)),
                            if (columna is Columna<bool>)
                              ...columna.lista.map((e) => columna.celda(e)),
                            if (columna is Columna<int>)
                              ...columna.lista.map((e) => columna.celda(e)),
                            if (columna is Columna<double>)
                              ...columna.lista.map((e) => columna.celda(e)),
                            const SizedBox.shrink(),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// {@template ColumnaBase}
/// clase base para las columnas que se vallan generando
/// {@ColumnaBase}
class ColumnaBase {
  /// {@macro ColumnaBase}
  ColumnaBase({
    this.nombreColumna,
    this.widthDeLaColumna = 200,
    this.celdaEncabezadoColumna,
  });

  final String? nombreColumna;
  final double widthDeLaColumna;
  final Widget Function(String value)? celdaEncabezadoColumna;
}

/// {@template Columna}
/// Modelo de datos que representa una lista con elementos del tipo [T].
/// {@Columna}
class Columna<T> extends ColumnaBase {
  /// {@macro Columna}
  Columna({
    required this.lista,
    required this.celda,
    super.widthDeLaColumna,
    super.nombreColumna,
    super.celdaEncabezadoColumna,
  }) : super();

  final List<T> lista;
  final Widget Function(T value) celda;
}
