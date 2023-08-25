import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/paginas/administracion_contenido/escritorio/widgets/widgets.dart';

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

    // TODO(mati): sacar por la lista del back y hacer una variable arriba para pasarle la lista del modelo del back
    final listaPrArticuls = [
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'Flutter article',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'Flutter article',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'Flutter article',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'Flutter article',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'Flutter article',
        status: 'Draft',
        tieneAutor: false,
      ),
      PRArticulo(
        fecha: DateTime.now(),
        nombre: 'Flutter article',
        status: 'Draft',
        tieneAutor: false,
      ),
    ];

    return Container(
      width: 1000.pw,
      color: colores.background,
      child: Column(
        children: [
          TituloBotonCrearArticulo(nombreArticulo: tituloArticulo),
          DescripcionArticulo(descripcionArticulo: descripcionArticulo),
          SizedBox(height: max(20.ph, 20.sh)),
          Container(
            height: max(530.ph, 530.sh),
            width: 1000.pw,
            color: colores.onPrimary,
            child: Column(
              children: [
                const BotonesArticulosYRecorte(),
                Divider(color: colores.onSecondary),
                const TextFieldBusquedaFiltrado(),
                Divider(color: colores.onSecondary),
                ListaArticulos(articulos: listaPrArticuls),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
