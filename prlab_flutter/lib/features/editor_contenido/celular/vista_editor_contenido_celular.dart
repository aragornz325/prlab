import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/editor_contenido/widgets/paginas_del_articulo.dart';
import 'package:prlab_flutter/features/editor_contenido/widgets/panel_prlab.dart';

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
  ]);
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return Scaffold(
      body: ColoredBox(
        color: colores.background,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PanelPRLab(),
              PaginasDelArticulo(
                listaPaginasDeArticulos: listaPaginasDeArticulos,
              ),
              SizedBox(
                height: 10.ph,
              ),
            ],
          ),
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
