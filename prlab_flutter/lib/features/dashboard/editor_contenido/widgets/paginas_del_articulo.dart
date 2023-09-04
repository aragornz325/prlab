import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_client/prlab_client.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/editor_contenido/widgets/articulo_prlab.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

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

  final List<Articulo> listaSeccionesDeArticulos;
// TODO(SAM): Ver diseño y acomodar, solo el selecionado se ve de color rojo
// y agregar evento
  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;
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
                ArticuloPRLab.listTile(
                  titulo: l10n.pageEditContentArticleTitleHomePage,
                  context: context,
                  contenidoArticulo:
                      listaSeccionesDeArticulos[index].contenido!,
                  icono: Assets.assets_icons_casa_png,
                ),
                ArticuloPRLab.listTile(
                  titulo: l10n.pageEditContentArticleTitleMetricsPage,
                  context: context,
                  contenidoArticulo:
                      listaSeccionesDeArticulos[index].contenido!,
                  icono: Assets.assets_icons_leaderboard_png,
                ),
                ArticuloPRLab.listTile(
                  titulo: l10n.pageEditContentArticleTitleCoveragePage,
                  context: context,
                  contenidoArticulo:
                      listaSeccionesDeArticulos[index].contenido!,
                  icono: Assets.assets_icons_link_png,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
