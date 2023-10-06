import 'package:flutter/material.dart';

/// {@template Indicator}
/// Muestra una forma coloreada (ya sea un cuadrado o un círculo) junto
/// con una etiqueta de texto. Se pueden personalizar el color, el texto,
/// el tipo de forma, el tamaño y el color del texto.
/// {@endtemplate}
class Indicator extends StatelessWidget {
  /// {@macro Indicator}
  const Indicator({
    required this.color,
    required this.texto,
    required this.esCircular,
    super.key,
    this.tamanio = 16,
    this.colorDelTexto,
  });

  /// Color del indicator
  final Color color;

  /// Texto que se muestra junto al color
  final String texto;

  /// Identifica si el indicator es cuadrado o círculo
  final bool esCircular;

  /// Tamaño del indicator
  final double tamanio;

  /// Color del texto
  final Color? colorDelTexto;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: tamanio,
          height: tamanio,
          decoration: BoxDecoration(
            shape: esCircular ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          texto,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: colorDelTexto,
          ),
        ),
      ],
    );
  }
}
