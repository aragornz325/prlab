import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/administracion_contenido/escritorio/widgets/widgets.dart';
import 'package:prlab_flutter/features/dashboard/widgets/widgets.dart';

/// {@template ContenidoPrincipal}
/// Contenido principal de la pagina donde muestra t0do el
/// contenido de una articulo donde tiene dos variables
/// `tituloArticulo` (opcional) y una `descripcionArticulo`,
/// {@endtemplate}
class ContenidoPrincipal extends StatelessWidget {
  /// {@macro ContenidoPrincipal}
  const ContenidoPrincipal({
    required this.descripcionArticulo,
    this.tituloArticulo,
    super.key,
  });

  /// Titulo del articulo
  final String? tituloArticulo;

  /// Descripcion del articulo
  final String descripcionArticulo;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      width: 1000.pw,
      color: colores.background,
      child: Column(
        children: [
          TituloBotonCrearArticulo(nombreArticulo: tituloArticulo),
          DescripcionArticulo(descripcionArticulo: descripcionArticulo),
          SizedBox(height: max(20.ph, 20.sh)),
          const ListaArticulosYRecortes(),
        ],
      ),
    );
  }
}
