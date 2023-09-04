import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/bloc/bloc_administracion_marcas.dart';
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
          height: 510.ph,
          width: 1040.pw,
          child: BlocBuilder<BlocAdministracionMarcas,
              BlocAdministracionMarcasEstado>(
            builder: (context, state) {
              return ListView.separated(
                itemCount: state.marcas.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TarjetaMarca(
                        marca: state.marcas[index],
                      ),
                      SizedBox(height: 30.ph),
                      // TODO(Gon):
                      // Consumir informacion de la marca traida del back
                      // cuando se agreguen los articulos al modelo
                      const InformacionDeLaMarca(
                        cantidadArticulos: 3,
                        cantidadClippings: 3,
                        cantidadMiembros: 3,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 35.ph),
              );
            },
          ),
        ),
      ],
    );
  }
}
