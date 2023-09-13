import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/bloc/bloc_editor_contenido.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/articulo_prlab.dart';

/// {@template PaginasDelArticulo}
/// Columna vertical que tiene las distintas paginas del articulo a las que se
/// pueden acceder.
/// [PaginasDelArticulo].
/// {@endtemplate}
class PaginasDelArticulo extends StatelessWidget {
  /// {@macro PaginasDelArticulo}
  const PaginasDelArticulo({
    required this.listaSeccionesDeArticulos,
    super.key,
  });

  final List<PaginaSeccionArticulo> listaSeccionesDeArticulos;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Expanded(
      child: Container(
        color: colores.surfaceTint,
        width: 151.pw,
        height: 508.ph,
        child: ListView.builder(
          itemCount: listaSeccionesDeArticulos.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                // TODO(SAM): agregar item seleccionado en rojo feature

                // callback para saber a cual pagina estoy apuntando y manejarlo
                PaginaDeArticuloPRLab.listTile(
                  paginaSeccionArticulo: listaSeccionesDeArticulos[index],
                  context: context,
                  estaSeleccionada: index == 0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
