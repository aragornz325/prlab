import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
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
      body: Row(
        children: [
          Container(
            width: 210.pw,
            height: 100.hp,
            color: colores.primary.withOpacity(.5),
          ),
          SizedBox(width: 30.pw),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 1040.pw,
                height: 100.ph,
                color: colores.primary.withOpacity(.5),
              ),
              SizedBox(height: 40.pw),
              EncabezadoDeSeccion(
                titulo: l10n.pageBrandAdministrationTitle,
                descripcion: l10n.pageBrandAdministrationDescription,
              ),
              SizedBox(height: 20.pw),
              const SeccionTarjetasDeMarca(),
              SizedBox(height: 30.pw),
              const SeccionTarjetasDeInformacionDeMarcas(),
              SizedBox(
                width: 1040.pw,
                height: 85.ph,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
