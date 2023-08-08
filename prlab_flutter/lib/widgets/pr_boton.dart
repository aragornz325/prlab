import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';

class PRBoton extends StatelessWidget {
  const PRBoton({
    required this.onTap,
    required this.texto,
    required this.habilitado,
    this.width = 359,
    super.key,
  });

  final double width;
  final VoidCallback onTap;
  final String texto;
  final bool habilitado;
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return GestureDetector(
      onTap: habilitado ? onTap : () {},
      child: Container(
        width: width.pw,
        height: 50.ph,
        decoration: BoxDecoration(
          color: habilitado
              ? theme.colorScheme.primary
              : theme.colorScheme.primary.withOpacity(.2),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(texto),
        ),
      ),
    );
  }
}
