import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/theming/base.dart';

/// {@template  ArticuloPRLab}
/// Elemento de la lista que representa un pagina o característica
///  de los articulos que se puede presionar para abrirlo y permitir su edición.
/// Tiene sus factory, permite la creación de distintos articulos.
/// [ArticuloPRLab].
/// {@endtemplate}
class ArticuloPRLab extends StatelessWidget {
  /// {@macro ArticuloPRLab}
  const ArticuloPRLab({
    required this.titulo,
    required this.contenidoArticulo,
    required this.contenido,
    required this.onTap,
    super.key,
  });

  /// Articulo factory que tiene el icono de una casa.en la lista de los
  /// articulos.
  factory ArticuloPRLab.home({
    required String titulo,
    required String contenidoArticulo,
    required BuildContext context,
  }) {
    final colores = context.colores;
    return ArticuloPRLab(
      titulo: titulo,
      contenidoArticulo: contenidoArticulo,
      onTap: () {
        // TODO(onyone): poner onTap del articulo home.
      },
      contenido: Row(
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
  final Widget? contenido;

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
            color: colores.primaryAltaOpacidad,
          ),
          child: contenido,
        ),
      ),
    );
  }
}
