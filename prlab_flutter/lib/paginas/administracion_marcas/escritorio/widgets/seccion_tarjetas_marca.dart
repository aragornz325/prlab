import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/paginas/administracion_marcas/escritorio/widgets/tarjeta_marca.dart';

/// {@template SeccionTarjetasDeMarca}
/// Seccion de la vista donde se muestran 2 marcas
/// {@endtemplate}
class SeccionTarjetasDeMarca extends StatelessWidget {
  /// {@macro SeccionTarjetasDeMarca}
  const SeccionTarjetasDeMarca({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 365.ph,
      width: 1040.pw,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const TarjetaMarca(
            linkMarca: 'https://flutter.dev/',
            nombreMarca: 'Flutter',
            linksArticulos: [
              'Flutter Article',
              'Flutter Article',
              'Flutter Article',
              'Flutter Article',
              'Flutter Article',
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 35.ph),
        itemCount: 2,
      ),
    );
  }
}
