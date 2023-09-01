import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';
import 'package:prlab_flutter/utilidades/widgets/encabezado_de_seccion.dart';
import 'package:prlab_flutter/utilidades/widgets/widgets.dart';

/// {@template VistaRedaccionEdicionContenidoCelular}
/// Vista de editor de contenido de un articulo para celular
/// [VistaEditorContenidoCelular].
/// {@endtemplate}
class VistaEditorContenidoCelular extends StatelessWidget {
  /// {@macro VistaRedaccionEdicionContenidoCelular}
  VistaEditorContenidoCelular({super.key});

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
        child: Row(
          children: [
            Container(
              width: 210.pw,
              height: 100.hp,
              color: colores.primaryOpacidadCincuenta,
            ),
            SizedBox(width: 30.pw),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 1040.pw,
                  height: 100.ph,
                  color: colores.primaryOpacidadCincuenta,
                ),
                SizedBox(height: 40.ph),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EncabezadoDeSeccion(
                      icono: Icons.add,
                      // TODO(SAM): probablemente sea el titulo del articulo,
                      // deberia definirlo Guille
                      titulo: 'Flutter article',
                      descripcion: l10n.pageEditContentSubtitle,
                    ),
                    SizedBox(
                      width: 500.pw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PRBoton.esOutlined(
                            onTap: () {
                              // TODO(anyone): agregarle funcionalidad feature
                              // en progreso
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
                              // TODO(anyone): agregarle funcionalidad feature
                              // en progreso
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
                    ),
                  ],
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PRBoton(
                                  onTap: () {
                                    // TODO(anyone): agregarle funcionalidad
                                    // feature en progreso
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
                                    // TODO(anyone): agregarle funcionalidad
                                    // feature en progreso
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
          ],
        ),
      ),
    );
  }
}

class Article {
  // TODO(SAM): remover luego cuando este el modelo del back
  Article(this.title, this.content);
  final String title;
  final String content;
}

class ListaDePaginasDelArticulo {
  ListaDePaginasDelArticulo(this.articulos);
  final List<Article> articulos;
}
