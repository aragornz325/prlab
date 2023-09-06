import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/bloc/bloc_editor_contenido.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/popups/popup_agregar_pagina.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/popups/popup_publicar.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/widgets/encabezado_de_seccion.dart';
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
    final colores = context.colores;
    final l10n = context.l10n;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.ph),
                SizedBox(
                  width: 1000.pw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<BlocEditorContenido,
                          BlocEditorContenidoEstado>(
                        builder: (context, state) {
                          if (state.articulo != null) {
                            return EncabezadoDeSeccion(
                              icono: Icons.add,
                              titulo: state.articulo!.titulo,
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
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                builder: (context) =>
                                    const PRDialogErrorNoDisponible(),
                              );
                            },
                            texto: l10n.commonPreview,
                            estaHabilitado: true,
                            width: 100.pw,
                            height: 30.ph,
                          ),
                          SizedBox(
                            width: 20.pw,
                          ),
                          PRBoton(
                            fontSize: 15.pf,
                            fontWeight: FontWeight.w500,
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                builder: (context) =>
                                    const PRDialogErrorNoDisponible(),
                              );
                            },
                            texto: l10n.commonShare,
                            estaHabilitado: true,
                            width: 100.pw,
                            height: 30.ph,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.ph),
                BlocBuilder<BlocEditorContenido, BlocEditorContenidoEstado>(
                  builder: (context, state) {
                    if (state is BlocEditorContenidoEstadoCargando) {
                      return SizedBox(
                        width: 1000.pw,
                        height: 508.ph,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state.articulo != null) {
                      return SizedBox(
                        width: 1000.pw,
                        height: 508.ph,
                        child: Row(
                          children: [
                            PaginasDelArticulo(
                              listaSeccionesDeArticulos:
                                  state.listaSeccionesArticulo,
                            ),
                            SizedBox(
                              width: 10.pw,
                            ),
                            const ContainerEdicionArticulo(),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox(
                        width: 1000.pw,
                        height: 508.ph,
                        child: Center(
                          child: Image.asset(
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
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PopUpMenuAgregarPagina(),
                                PopUpMenuOpcionesPublicar(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
