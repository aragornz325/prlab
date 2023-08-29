import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

import 'package:prlab_flutter/features/editor_contenido/celular/vista_editor_contenido_celular.dart';
import 'package:prlab_flutter/features/editor_contenido/widgets/paginas_del_articulo.dart';

import 'package:prlab_flutter/features/editor_contenido/widgets/panel_prlab.dart';

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
                height: 60.ph,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
