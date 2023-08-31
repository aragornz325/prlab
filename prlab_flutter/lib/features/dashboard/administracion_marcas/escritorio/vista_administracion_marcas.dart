import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/bloc/bloc_administracion_marcas.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/escritorio/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template VistaEscritorioAdministracionMarcas}
/// Vista del dashboard en la seccion de administracion de marcas
/// {@endtemplate}
class VistaEscritorioAdministracionMarcas extends StatefulWidget {
  /// {@macro VistaEscritorioAdministracionMarcas}
  const VistaEscritorioAdministracionMarcas({super.key});

  @override
  State<VistaEscritorioAdministracionMarcas> createState() =>
      _VistaEscritorioAdministracionMarcasState();
}

class _VistaEscritorioAdministracionMarcasState
    extends State<VistaEscritorioAdministracionMarcas> {
  @override
  void initState() {
    context
        .read<BlocAdministracionMarcas>()
        .add(BlocAdministracionMarcasEventoInicializar());

    super.initState();
  }

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
          const SeccionTarjetasDeMarca(),
        ],
      ),
    );
  }
}
