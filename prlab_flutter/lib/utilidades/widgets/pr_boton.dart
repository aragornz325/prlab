import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/theming/base.dart';

/// {@template PRBoton}
/// Botones a utilizarse en el proyecto, variantes fill y .outlined
/// {@endtemplate}
class PRBoton extends StatelessWidget {
  /// {@macro PRBoton}
  const PRBoton({
    required this.onTap,
    required this.texto,
    required this.estaHabilitado,
    this.width,
    this.height,
    this.esOutlined = false,
    this.muestraEstadoDeCarga = false,
    super.key,
  });

  /// Variante outlined de PRBoton
  factory PRBoton.esOutlined({
    required VoidCallback onTap,
    required String texto,
    required bool estaHabilitado,
    required double width,
    double? height,
  }) {
    return PRBoton(
      onTap: onTap,
      texto: texto,
      estaHabilitado: estaHabilitado,
      esOutlined: true,
      width: width,
      height: height,
    );
  }

  /// Ancho del boton, por defecto 359.pw
  final double? width;

  /// Altura del boton, por defecto 50.ph
  final double? height;

  /// Funcion al presionar el boton
  final VoidCallback onTap;

  /// Asigna el texto interno en el boton.
  final String texto;

  /// Da funcionalidad y color dependiendo de cuestiones externas.
  final bool estaHabilitado;

  /// Asigna diseño si es outlined
  final bool esOutlined;

  /// Si es true muestra un circular progress indicator dentro del boton.
  final bool muestraEstadoDeCarga;
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return GestureDetector(
      onTap: estaHabilitado ? onTap : null,
      child: Container(
        width: width ?? 359.pw,
        height: height ?? 50.ph,
        decoration: BoxDecoration(
          color: esOutlined
              ? colores.background
              : estaHabilitado && !muestraEstadoDeCarga
                  ? colores.primary
                  : colores.primaryOpacidadSesenta,
          borderRadius: BorderRadius.circular(100),
          border: esOutlined
              ? Border.all(
                  color: estaHabilitado
                      ? colores.primary
                      : colores.primaryOpacidadSesenta,
                )
              : null,
        ),
        child: Center(
          child: muestraEstadoDeCarga
              ? const CircularProgressIndicator()
              : Text(
                  texto,
                  style: TextStyle(
                    fontSize: 16.pf,
                    fontWeight: FontWeight.w600,
                    color: esOutlined
                        ? estaHabilitado
                            ? colores.primary
                            : colores.primaryOpacidadSesenta
                        : colores.background,
                  ),
                ),
        ),
      ),
    );
  }
}
