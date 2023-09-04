import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/celular/vista_editor_contenido_celular.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/articulo_prlab.dart';

/// {@template PaginasDelArticulo}
/// Columna vertical que tiene las distintas paginas del articulo a las que se
/// pueden acceder.
/// [PaginasDelArticulo].
/// {@endtemplate}
class PaginasDelArticulo extends StatelessWidget {
  /// {@macro PaginasDelArticulo}
  const PaginasDelArticulo({
    required this.listaPaginasDeArticulos,
    super.key,
  });

  final ListaDePaginasDelArticulo
      listaPaginasDeArticulos; // Todo(Sam): Cambiar por la lista de articulos
  // del back

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return Expanded(
      child: Container(
        color: colores.surfaceTint,
        width: 151.pw,
        height: 508.ph,
        child: ListView.builder(
          itemCount: listaPaginasDeArticulos.articulos.length,
          itemBuilder: (context, index) {
            return ArticuloPRLab.home(
              titulo: listaPaginasDeArticulos.articulos[index].title,
              context: context,
              contenidoArticulo:
                  listaPaginasDeArticulos.articulos[index].content,
            );
          },
        ),
      ),
    );
  }
}
