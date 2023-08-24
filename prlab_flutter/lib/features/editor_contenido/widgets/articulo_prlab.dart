import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

/// {@template  ArticuloPRLab}
/// Elemento de listview.builder que representa un articulo que se puede
/// presionar para abrirlo y permitir su edicion. Tiene sus factory, permite
/// la creacion de distintos articulos.
/// [ArticuloPRLab].
/// {@endtemplate}
class ArticuloPRLab extends StatelessWidget {
  /// {@macro ArticuloListView}
  const ArticuloPRLab({
    required this.titulo,
    required this.contenidoArticulo,
    required this.contenidoWidget,
    required this.onTap,
    super.key,
  });

  /// Articulo factory que tiene el icono de una casa.
// TODO(SAM): Mejorar doc.
  factory ArticuloPRLab.home({
    required String titulo,
    required String contenidoArticulo,
    required BuildContext context,
  }) {
    final colores = context.colores;
    return ArticuloPRLab(
      titulo: titulo,
      contenidoArticulo: contenidoArticulo,
      onTap: () {}, // TODO(SAM): poner onTap del articulo home.
      contenidoWidget: Row(
        children: [
          Center(
            child: SizedBox(
              height: 30.ph,
              width: 30.pw,
              child: Image.asset(
                Assets.assets_icons_casa_png,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 10.pf,
                  color: colores.secondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                contenidoArticulo,
                style: TextStyle(
                  color: colores.tertiary,
                  fontSize: 12.pf,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  final String titulo;
  final String contenidoArticulo;
  final VoidCallback? onTap;
  final Widget? contenidoWidget;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          top: 20.ph,
          left: 10.pw,
          right: 10.pw,
        ),
        child: Container(
          width: 132.pw,
          height: 55.ph,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colores.primary,
            ),
            color: colores.primary.withOpacity(.2),
          ),
          child: contenidoWidget,
        ),
      ),
    );
  }
}
