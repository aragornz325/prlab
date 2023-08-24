import 'package:flutter/material.dart';

class Grilla extends StatelessWidget {
  const Grilla({
    required this.listaModelos,
    super.key,
    this.scrollController,
  });

  final List<ModeloLista> listaModelos;

  final ScrollController? scrollController;

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
                  ...listaModelos.map(
                    (modelo) {
                      return SizedBox(
                        width: modelo.widthDeLaColumna,
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
    this.widthDeLaColumna = 200,
    this.nombreColumna,
    this.celdaEncabezadoColumna,
  });

  final String? nombreColumna;
  final List<T> lista;
  final Widget Function<T>(T value) celda;
  final Widget Function(String value)? celdaEncabezadoColumna;
  // TODO(mati): cambiar de nombre
  final double widthDeLaColumna;
}
