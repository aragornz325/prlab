import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/bloc/bloc_editor_contenido.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/widgets.dart';
import 'package:prlab_flutter/features/dashboard/widgets/encabezado_de_seccion.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/nada_para_ver.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template VistaEditorContenidoEscritorio}
/// Vista de editor de contenido de un articulo para escritorio
/// [VistaEditorContenidoEscritorio].
/// {@endtemplate}
class VistaEditorContenidoEscritorio extends StatelessWidget {
  /// {@macro VistaEditorContenidoEscritorio}
  const VistaEditorContenidoEscritorio({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: max(40.ph, 40.sh)),
            SizedBox(
              width: 1000.pw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<BlocEditorContenido, BlocEditorContenidoEstado>(
                    builder: (context, state) {
                      final articulo = state.articulo;

                      if (articulo != null) {
                        return EncabezadoDeSeccion(
                          icono: Icons.add,
                          titulo: articulo.titulo,
                          descripcion: l10n.pageEditContentSubtitle,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PRBoton.esOutlined(
                        fontSize: 15.pf,
                        fontWeight: FontWeight.w500,
                        onTap: () => const PRDialogErrorNoDisponible().show(
                          context,
                        ),
                        texto: l10n.commonPreview,
                        estaHabilitado: true,
                        width: 80.pw,
                        height: max(30.ph, 30.sh),
                      ),
                      SizedBox(width: 20.pw),
                      PRBoton(
                        fontSize: 15.pf,
                        fontWeight: FontWeight.w500,
                        onTap: () => const PRDialogErrorNoDisponible().show(
                          context,
                        ),
                        texto: l10n.commonShare,
                        estaHabilitado: true,
                        width: 80.pw,
                        height: max(30.ph, 30.sh),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.ph),
            BlocBuilder<BlocEditorContenido, BlocEditorContenidoEstado>(
              builder: (context, state) {
                final articulo = state.articulo;

                if (state is BlocEditorContenidoEstadoCargando) {
                  return SizedBox(
                    width: 1000.pw,
                    height: max(508.ph, 508.sh),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (articulo != null) {
                  return SizedBox(
                    width: 1000.pw,
                    height: max(508.ph, 508.sh),
                    child: Row(
                      children: [
                        PaginasDelArticulo(
                          listaSeccionesDeArticulos:
                              state.listaPaginasDeArticulo,
                        ),
                        SizedBox(width: 10.pw),
                        const ContainerEdicionArticulo(),
                      ],
                    ),
                  );
                } else {
                  return SizedBox(
                    width: 1000.pw,
                    height: max(508.ph, 508.sh),
                    child: const Center(
                      child: NadaParaVer(),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: max(20.ph, 20.sh)),
            const FooterEditorContenido(),
          ],
        ),
      ),
    );
  }
}
