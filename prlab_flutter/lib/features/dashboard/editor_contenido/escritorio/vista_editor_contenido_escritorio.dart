import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/celular/vista_editor_contenido_celular.dart';
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
  VistaEditorContenidoEscritorio({super.key});

  final listaPaginasDeArticulos = ListaDePaginasDelArticulo([
    // TODO(SAM): eliminar cuando venga del back
    Article('Home page', 'Flutter article1'),
    Article('Home page', 'Flutter article2'),
    Article('Home page', 'Flutter article3'),
    Article('Home page', 'Flutter article1'),
    Article('Home page', 'Flutter article2'),
    Article('Home page', 'Flutter article3'),
    Article('Home page', 'Flutter article1'),
    Article('Home page', 'Flutter article2'),
    Article('Home page', 'Flutter article3'),
    Article('Home page', 'Flutter article1'),
    Article('Home page', 'Flutter article2'),
    Article('Home page', 'Flutter article3'),
    Article('Home page', 'Flutter article1'),
    Article('Home page', 'Flutter article2'),
    Article('Home page', 'Flutter article3'),
    Article('Home page', 'Flutter article1'),
    Article('Home page', 'Flutter article2'),
    Article('Home page', 'Flutter article3'),
    Article('Home page', 'Flutter article1'),
    Article('Home page', 'Flutter article2'),
    Article('Home page', 'Flutter article3'),
    Article('Home page', 'Flutter article1'),
    Article('Home page', 'Flutter article2'),
    Article('Home page', 'Flutter article3'),
    Article('Home page', 'Flutter article1'),
    Article('Home page', 'Flutter article2'),
    Article('Home page', 'Flutter article3'),
  ]);

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 1000.pw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EncabezadoDeSeccion(
                    icono: Icons.add,
                    titulo:
                        'Flutter article', // TODO(SAM): probablemente sea el titulo del articulo, deberia definirlo Guille
                    descripcion: l10n.pageEditContentSubtitle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PRBoton.esOutlined(
                        onTap: () {
                          // TODO(anyone): agregarle funcionalidad feature en progreso
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
                        onTap: () {
                          // TODO(anyone): agregarle funcionalidad feature en progreso
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
            SizedBox(
              width: 1000.pw,
              height: 508.ph,
              child: Row(
                children: [
                  PaginasDelArticulo(
                    listaPaginasDeArticulos: listaPaginasDeArticulos,
                  ),
                  SizedBox(
                    width: 10.pw,
                  ),
                  const ContainerEdicionArticulo(),
                ],
              ),
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
                        // TODO(SAM): cambiar luego por widget correspondiente
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PRBoton(
                              onTap: () {
                                // TODO(anyone): agregarle funcionalidad feature en progreso
                                showDialog<void>(
                                  context: context,
                                  builder: (context) =>
                                      const PRDialogErrorNoDisponible(),
                                );
                              },
                              texto: l10n.commonAddPage,
                              estaHabilitado: true,
                              width: 139.pw,
                              height: 30.ph,
                            ),
                            PRBoton(
                              onTap: () {
                                // TODO(anyone): agregarle funcionalidad feature en progreso
                                showDialog<void>(
                                  context: context,
                                  builder: (context) =>
                                      const PRDialogErrorNoDisponible(),
                                );
                              },
                              texto: l10n.commonPublish,
                              estaHabilitado: true,
                              width: 139.pw,
                              height: 30.ph,
                            ),
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
      ),
    );
  }
}
