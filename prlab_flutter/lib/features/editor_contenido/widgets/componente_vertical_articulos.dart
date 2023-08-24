import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/editor_contenido/celular/vista_editor_contenido_celular.dart';
import 'package:prlab_flutter/features/editor_contenido/widgets/articulo_prlab.dart';

/// {@template ComponenteVerticalArticulos}
/// Banner que tiene una lista de articulos que permite presionarlos
/// para su edicion.
/// [ComponenteVerticalArticulos].
/// {@endtemplate}
class ComponenteVerticalArticulos extends StatelessWidget {
  /// {@macro ComponenteVerticalArticulos}
  const ComponenteVerticalArticulos({required this.articulos, super.key});

  final List<Article> articulos; // Todo(Sam): Cambiar por la lista de articulos
  // del back

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: 151.pw,
            height: 508.ph,
            child: ListView.builder(
              itemCount: articulos.length,
              itemBuilder: (context, index) {
                return ArticuloPRLab.home(
                  titulo: articulos[index].title,
                  context: context,
                  contenidoArticulo: articulos[index].content,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
