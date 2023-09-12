import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

class TarjetaCargando extends StatelessWidget {
  const TarjetaCargando({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      width: 300.pw,
      height: 223.ph,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: colores.surfaceTint,
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
