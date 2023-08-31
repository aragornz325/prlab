import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/escritorio/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/appbar/appbar.dart';
import 'package:prlab_flutter/utilidades/widgets/drawer/drawer.dart';

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
      body: Row(
        children: [
          const PrDrawer(),
          SizedBox(width: 30.pw),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PRAppBar(
                onTap: (value) {},
              ),
              SizedBox(height: 40.ph),
              EncabezadoDeSeccion(
                icono: Icons.beenhere_outlined,
                titulo: l10n.pageBrandAdministrationTitle,
                descripcion: l10n.pageBrandAdministrationDescription,
              ),
              const SeccionTarjetasDeMarca(),
              SizedBox(
                width: 1040.pw,
                height: 84.ph,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
