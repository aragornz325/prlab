import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/escritorio/widgets/widgets.dart';

/// {@template SeccionTarjetasDeMarca}
/// Seccion de la vista donde se muestran las marcas y su respectiva informacion
/// {@endtemplate}
class SeccionTarjetasDeMarca extends StatelessWidget {
  /// {@macro SeccionTarjetasDeMarca}
  const SeccionTarjetasDeMarca({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 480.ph,
          width: 1040.pw,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // TODO(Gon): Consumir informacion de la marca traida del back
                  const TarjetaMarca(
                    linkMarca: 'https://flutter.dev/',
                    nombreMarca: 'Flutter',
                    linksArticulos: [
                      'Flutter Article',
                      'Flutter Article',
                      'Flutter Article',
                      'Flutter Article',
                      'Flutter Article',
                    ],
                  ),
                  SizedBox(height: 30.ph),
                  // TODO(Gon): Consumir informacion de la marca traida del back
                  const InformacionDeLaMarca(
                    cantidadArticulos: 3,
                    cantidadClippings: 3,
                    cantidadMiembros: 4,
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 35.ph),
            itemCount: 2,
          ),
        ),
      ],
    );
  }
}
