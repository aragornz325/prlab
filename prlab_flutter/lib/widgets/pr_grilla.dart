import 'package:flutter/material.dart';

class Grilla<T> extends StatelessWidget {
  const Grilla({
    required this.listaColumnas,
    super.key,
    this.scrollController,
  });

  final List<ColumnaBase> listaColumnas;

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
                            if (columna is Columna<dynamic>)
                              ...columna.lista.map((e) => columna.celda(e)),
                            if (columna is Columna<T>)
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

class ColumnaBase {
  ColumnaBase({
    this.nombreColumna,
    this.widthDeLaColumna = 200,
    this.celdaEncabezadoColumna,
  });

  final String? nombreColumna;
  final double widthDeLaColumna;
  final Widget Function(String value)? celdaEncabezadoColumna;
}

/// Modelo de datos que representa una lista con elementos del tipo [T].
class Columna<T> extends ColumnaBase {
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
