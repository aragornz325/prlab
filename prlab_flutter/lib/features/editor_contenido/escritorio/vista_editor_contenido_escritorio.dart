import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';

import 'package:prlab_flutter/features/editor_contenido/celular/vista_editor_contenido_celular.dart';
import 'package:prlab_flutter/features/editor_contenido/widgets/componente_vertical_articulos.dart';
import 'package:prlab_flutter/features/editor_contenido/widgets/panel_prlab.dart';

/// {@template VistaEditorContenidoEscritorio}
/// Vista de editor de contenido de un articulo para escritorio
/// [VistaEditorContenidoEscritorio].
/// {@endtemplate}
class VistaEditorContenidoEscritorio extends StatelessWidget {
  /// {@macro VistaEditorContenidoEscritorio}
  VistaEditorContenidoEscritorio({super.key});
  final List<Article> articulos = [
    // TODO(SAM): eliminar cuando venga del back
    Article('Home page', 'Flutter article1'),
    Article('Home page', 'Flutter article2'),
    Article('Home page', 'Flutter article3'),
  ];
  @override
  Widget build(BuildContext context) {
    // final colores = context.colores;
    return Scaffold(
      body: ColoredBox(
        color: Colors.grey, //Todo (sam): cambiar luego por  el color que va.
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PanelPRLab(),
              ComponenteVerticalArticulos(
                articulos: articulos,
              ),
              SizedBox(
                height: 60.ph,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
