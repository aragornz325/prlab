import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/bloc/bloc_administracion_marcas.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/escritorio/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template VistaEscritorioAdministracionMarcas}
/// Vista del dashboard en la seccion de administracion de marcas
/// {@endtemplate}
class VistaEscritorioAdministracionMarcas extends StatelessWidget {
  /// {@macro VistaEscritorioAdministracionMarcas}
  const VistaEscritorioAdministracionMarcas({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return Scaffold(
      backgroundColor: colores.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EncabezadoDeSeccion(
            icono: Icons.beenhere_outlined,
            titulo: l10n.pageBrandAdministrationTitle,
            descripcion: l10n.pageBrandAdministrationDescription,
          ),
          SizedBox(height: 20.pw),
          BlocBuilder<BlocAdministracionMarcas, BlocAdministracionMarcasEstado>(
            builder: (context, state) {
              if (state is BlocAdministracionMarcasEstadoCargando) {
                return SizedBox(
                  width: 1000.pw,
                  height: 510.ph,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                if (state.marcas.isNotEmpty) {
                  return const SeccionTarjetasDeMarca();
                }
                return SizedBox(
                  width: 1000.pw,
                  height: 510.ph,
                  child: Center(
                    child: Image.asset(
                      // TODO(Gon): Cambiar imagen por un widget que tenga la
                      // imagen y el texto de nothing to see
                      Assets.assets_images_nada_para_ver_png,
                    ),
                  ),
                );
              }
            },
          ),
          SizedBox(
            width: 1040.pw,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.ph,
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: Text(
                      'Showing page 1 of 1 <      >',
                      // TODO(SAM): cambiar luego por widget
                      // correspondiente
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.pf,
                        color: colores.secondary,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.pw,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.pw,
                    ),
                    child: SizedBox(
                      height: 40.ph,
                      width: 800.pw,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
