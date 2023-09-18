import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

/// {@template EncabezadoDeSeccion}
/// Encabezado de la sección del dashboard
/// {@endtemplate}
class EncabezadoDeSeccion extends StatelessWidget {
  /// {@macro EncabezadoDeSeccion}
  const EncabezadoDeSeccion({
    required this.titulo,
    required this.descripcion,
    required this.icono,
    super.key,
  });

  /// Titulo del encabezado
  final String titulo;

  /// Descripcion del encabezado
  final String descripcion;

  /// Icono del encabezado
  final IconData icono;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return SizedBox(
      width: 770.pw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icono,
                size: 40.pw,
                color: colores.primary,
              ),
              SizedBox(width: 5.pw),
              SizedBox(
                width: 725.pw,
                child: Text(
                  titulo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30.pf,
                    color: colores.tertiary,
                  ),
                ),
              ),
            ],
          ),
          Text(
            descripcion,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15.pf,
              color: colores.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
