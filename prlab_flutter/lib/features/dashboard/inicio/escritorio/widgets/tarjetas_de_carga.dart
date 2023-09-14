import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

/// {@template TarjetasDeCarga}
/// Fila con tarjetas en estado de cargando para mostrar hasta que se recibe la
/// información del back
/// {@endtemplate}
class TarjetasDeCarga extends StatelessWidget {
  /// {@macro TarjetasDeCarga}
  const TarjetasDeCarga({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1010.pw,
      height: 300.ph,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const _TarjetaCargando(),
          SizedBox(
            width: 50.pw,
          ),
          const _TarjetaCargando(),
          SizedBox(
            width: 50.pw,
          ),
          const _TarjetaCargando(),
        ],
      ),
    );
  }
}

/// {@template TarjetaCargando}
/// Tarjeta en estado de cargando, para mostrar hasta que se recibe la
/// información del back
/// {@endtemplate}
class _TarjetaCargando extends StatelessWidget {
  /// {@macro TarjetaCargando}
  const _TarjetaCargando();

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      width: 300.pw,
      height: max(223.ph, 223.sh),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.sw),
        ),
        color: colores.surfaceTint,
      ),
      child: Center(
        child: CircularProgressIndicator(color: colores.secondary),
      ),
    );
  }
}
