import 'package:flutter/material.dart';

class Grilla extends StatelessWidget {
  const Grilla({
    required this.listaModelos,
    super.key,
    this.scrollController,
    this.width = 200,
  });

  final List<ModeloLista> listaModelos;

  final ScrollController? scrollController;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ...listaModelos.map(
                (modelo) {
                  if (modelo.celdaEncabezadoColumna != null) {
                    return modelo.celdaEncabezadoColumna!(
                      modelo.nombreColumna ?? '',
                    );
                  }

                  return SizedBox(
                    width: width,
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
                  ...listaModelos.map(
                    (modelo) {
                      return SizedBox(
                        width: width,
                        child: Column(
                          children: [
                            ...modelo.lista.map((e) => modelo.celda(e)),
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

/// Modelo de datos que representa una lista con elementos del tipo [T].
class ModeloLista<T> {
  ModeloLista({
    required this.lista,
    required this.celda,
    this.nombreColumna,
    this.celdaEncabezadoColumna,
  });

  final String? nombreColumna;
  final List<T> lista;
  final Widget Function<T>(T value) celda;
  final Widget Function(String value)? celdaEncabezadoColumna;
}
