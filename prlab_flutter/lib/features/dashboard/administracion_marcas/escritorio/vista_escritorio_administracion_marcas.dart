import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/bloc/bloc_administracion_marcas.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/escritorio/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/nada_para_ver.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: max(40.ph, 40.sh)),
            EncabezadoDeSeccion(
              icono: Icons.beenhere_outlined,
              titulo: l10n.pageBrandAdministrationTitle,
              descripcion: l10n.pageBrandAdministrationDescription,
            ),
            SizedBox(height: max(20.ph, 20.sh)),
            BlocBuilder<BlocAdministracionMarcas,
                BlocAdministracionMarcasEstado>(
              builder: (context, state) {
                if (state.estaEnEstadoCargando) {
                  return SizedBox(
                    width: 1000.pw,
                    height: max(510.ph, 510.sh),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state.estaEnEstadoError) {
                  // TODO(Gon): Manejar el error del estado
                  return const Center(
                    child: Text('Error'),
                  );
                } else {
                  if (state.marcas.isNotEmpty) {
                    return const SeccionTarjetasDeMarca();
                  }
                  return SizedBox(
                    width: 1000.pw,
                    height: max(510.ph, 510.sh),
                    child: const Center(
                      child: NadaParaVer(),
                    ),
                  );
                }
              },
            ),
            // TODO(anyone): cambiar luego por widget del footer
            SizedBox(
              height: max(50.ph, 50.sh),
            ),
          ],
        ),
      ),
    );
  }
}
