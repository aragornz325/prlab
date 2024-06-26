import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/inicio/bloc/bloc_inicio.dart';
import 'package:prlab_flutter/features/dashboard/inicio/escritorio/widgets/widgets.dart';
import 'package:prlab_flutter/features/dashboard/widgets/encabezado_de_seccion.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/serverpod_client.dart';
import 'package:prlab_flutter/utilidades/widgets/card_articulo_reciente.dart/pr_card_articulo_reciente.dart';
import 'package:prlab_flutter/utilidades/widgets/nada_para_ver.dart';

/// {@template VistaEscritorioInicio}
/// Vista de escritorio del Inicio del dashboard, seccion que el usuario ve
/// cuando inicia sesión
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: max(40.ph, 40.sh)),
            ContenedorDeLaBarraDeBusqueda(
              nombreUsuario: sessionManager.signedInUser?.userName ?? '',
            ),
            SizedBox(height: max(50.ph, 50.sh)),
            EncabezadoDeSeccion(
              titulo: l10n.pageHomeHeaderTitle,
              descripcion: l10n.pageHomeHeaderDescription,
              icono: Icons.folder_open_outlined,
            ),
            BlocBuilder<BlocInicio, BlocInicioEstado>(
              builder: (context, state) {
                if (state.estaEnEstadoCargando) {
                  return const TarjetasDeCarga();
                }
                if (state.estaEnEstadoError) {
                  // TODO(anyone): Mostrar algun tipo de error message
                  return const Text('Error');
                }
                return SizedBox(
                  width: 1010.pw,
                  height: max(300.ph, 300.sh),
                  child: state.listaArticulos.isEmpty
                      ? const Center(
                          child: NadaParaVer(),
                        )
                      // TODO(Gon): Cambiar cuando se traiga la lista del back
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                PRCardeArticuloReciente(
                                  onTap: () {
                                    // TODO(Gon): Agregar pusheo a la ruta
                                    // correspondiente
                                  },
                                  titulo: state.listaArticulos[index].titulo,
                                ),
                                SizedBox(
                                  width: 55.pw,
                                ),
                              ],
                            );
                          },
                          itemCount: state.listaArticulos.length,
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
