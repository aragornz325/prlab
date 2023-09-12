import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/inicio/bloc/bloc_inicio.dart';
import 'package:prlab_flutter/features/dashboard/inicio/escritorio/widgets/widgets.dart';
import 'package:prlab_flutter/features/dashboard/widgets/encabezado_de_seccion.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template VistaEscritorioInicio}
/// Vista del Inicio del dashboard, seccion que el usuario ve cuando inicia
/// sesión
/// {@endtemplate}
class VistaEscritorioInicio extends StatelessWidget {
  /// {@macro VistaEscritorioInicio}
  const VistaEscritorioInicio({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: colores.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.ph),
          const EncabezadoInicio(),
          SizedBox(height: 50.ph),
          EncabezadoDeSeccion(
            titulo: l10n.pageHomeHeaderTitle,
            descripcion: l10n.pageHomeHeaderDescription,
            icono: Icons.folder_open_outlined,
          ),
          BlocBuilder<BlocInicio, BlocInicioEstado>(
            builder: (context, state) {
              if (state is BlocInicioEstadoCargando) {
                return const TarjetasDeCarga();
              }
              return SizedBox(
                width: 1010.pw,
                height: 300.ph,
                child: state.listaArticulos.isEmpty
                    ? Center(
                        child: Image.asset(
                          // TODO(Gon): Cambiar imagen por un widget que tenga la
                          // imagen y el texto de nothing to see
                          Assets.assets_images_nada_para_ver_png,
                        ),
                      )
                    // TODO(Gon): Cambiar cuando se traiga la lista del back
                    : SizedBox(
                        width: 1010.pw,
                        height: 300.ph,
                        child: const Text('Lista de articulos recientes'),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
