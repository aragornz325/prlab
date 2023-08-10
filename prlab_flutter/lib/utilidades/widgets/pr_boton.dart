import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';

/// Botones a utilizarse en el proyecto, variantes fill y .outlined

class PRBoton extends StatelessWidget {
  const PRBoton({
    required this.onTap,
    required this.texto,
    required this.habilitado,
    this.width = 359,
    this.outlined = false,
    this.mostrarCircular = false,
    super.key,
  });

  /// Variante outlined de PRBoton
  factory PRBoton.outlined({
    required VoidCallback onTap,
    required String texto,
    required bool habilitado,
    required double width,
  }) {
    return PRBoton(
      onTap: onTap,
      texto: texto,
      habilitado: habilitado,
      outlined: true,
      width: width.pw,
    );
  }

  final double width;
  final VoidCallback onTap;
  final String texto;
  final bool habilitado;
  final bool outlined;
  final bool mostrarCircular;
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return GestureDetector(
      onTap: habilitado ? onTap : null,
      child: Container(
        width: width.pw,
        height: 50.ph,
        decoration: BoxDecoration(
          color: outlined
              ? theme.colorScheme.background
              : habilitado
                  ? theme.colorScheme.primary
                  : theme.colorScheme.primary.withOpacity(.2),
          borderRadius: BorderRadius.circular(25),
          border: outlined
              ? Border.all(
                  color: habilitado
                      ? theme.colorScheme.primary
                      : theme.colorScheme.primary.withOpacity(.2),
                )
              : null,
        ),
        child: Center(
          child: mostrarCircular
              ? const CircularProgressIndicator()
              : Text(
                  texto,
                  style: TextStyle(
                    fontSize: 16.pf,
                    fontWeight: FontWeight.w600,
                    color: outlined
                        ? habilitado
                            ? theme.colorScheme.primary
                            : theme.colorScheme.primary.withOpacity(.2)
                        : theme.colorScheme.background,
                  ),
                ),
        ),
      ),
    );
  }
}
