import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/inicio/escritorio/widgets/widgets.dart';

/// {@template TarjetasDeCarga}
/// Row con tarjetas en estado de cargando para mostrar mientras se recibe la
/// informacion del back
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
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const TarjetaCargando(),
              SizedBox(
                width: 50.pw,
              ),
              const TarjetaCargando(),
              SizedBox(
                width: 50.pw,
              ),
              const TarjetaCargando(),
            ],
          ),
        ],
      ),
    );
  }
}
