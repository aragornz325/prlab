import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/editor_contenido/widgets/componente_vertical_articulos.dart';
import 'package:prlab_flutter/features/editor_contenido/widgets/panel_prlab.dart';

/// {@template VistaRedaccionEdicionContenidoCelular}
/// Vista de editor de contenido de un articulo para celular
/// [VistaEditorContenidoCelular].
/// {@endtemplate}
class VistaEditorContenidoCelular extends StatelessWidget {
  /// {@macro VistaRedaccionEdicionContenidoCelular}
  VistaEditorContenidoCelular({super.key});

  final List<Article> articulos = [
    // TODO(SAM): eliminar cuando venga del back
    Article('Home page', 'Flutter article1'),
    Article('Home page', 'Flutter article2'),
    Article('Home page', 'Flutter article3'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Colors.grey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PanelPRLab(),
              ComponenteVerticalArticulos(
                articulos: articulos,
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
  Article(this.title, this.content);
  final String title;
  final String content;
}
