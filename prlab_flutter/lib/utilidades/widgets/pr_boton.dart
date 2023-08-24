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
    this.width = 359,
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
  }) {
    return PRBoton(
      onTap: onTap,
      texto: texto,
      estaHabilitado: estaHabilitado,
      esOutlined: true,
      width: width,
    );
  }

  final double width;
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
        width: width,
        height: 50.ph,
        decoration: BoxDecoration(
          color: esOutlined
              ? colores.background
              : estaHabilitado && !muestraEstadoDeCarga
                  ? colores.primary
                  : colores.primaryBajaOpacidad,
          borderRadius: BorderRadius.circular(100),
          border: esOutlined
              ? Border.all(
                  width: 2.pw,
                  color: estaHabilitado
                      ? colores.primary
                      : colores.primaryBajaOpacidad,
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
                            : colores.primaryBajaOpacidad
                        : colores.background,
                  ),
                ),
        ),
      ),
    );
  }
}
