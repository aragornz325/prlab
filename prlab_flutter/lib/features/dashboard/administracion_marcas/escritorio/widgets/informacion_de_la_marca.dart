import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extension_tema.dart';
import 'package:prlab_flutter/features/dashboard/administracion_marcas/escritorio/widgets/widgets.dart';
import 'package:prlab_flutter/l10n/l10n.dart';

/// {@template InformacionDeLaMarca}
/// Seccion de los 3 bloques de informacion de la marca
/// {@endtemplate}
class InformacionDeLaMarca extends StatelessWidget {
  /// {@macro InformacionDeLaMarca}
  const InformacionDeLaMarca({
    required this.cantidadArticulos,
    required this.cantidadClippings,
    required this.cantidadMiembros,
    super.key,
  });

  /// Cantidad de articulos de la marca
  final int cantidadArticulos;

  /// Cantidad de clippings de la marca
  final int cantidadClippings;

  /// Cantidad de miembros de la marca
  final int cantidadMiembros;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colores = context.colores;

    return Container(
      width: 485.pw,
      height: 80.ph,
      color: colores.surfaceTint,
      child: Row(
        children: [
          BloqueDeInformacionDeMarca(
            icono: Icons.donut_small_outlined,
            cuerpo: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.commonArticles,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10.pf,
                    color: colores.secondary,
                  ),
                ),
                Text(
                  '$cantidadArticulos',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.pf,
                    color: colores.primary,
                  ),
                ),
              ],
            ),
          ),
          BloqueDeInformacionDeMarca(
            tieneBordes: true,
            icono: Icons.image_outlined,
            cuerpo: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.commonClippings,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10.pf,
                    color: colores.secondary,
                  ),
                ),
                Text(
                  '$cantidadClippings',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.pf,
                    color: colores.primary,
                  ),
                ),
              ],
            ),
          ),
          BloqueDeInformacionDeMarca(
            icono: Icons.group,
            cuerpo: SizedBox(
              height: 30.ph,
              width: 70.pw,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 3.pw),
                itemCount: cantidadMiembros,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Align(
                    widthFactor: 0.3.pw,
                    child: Container(
                      width: 33.pw,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: colores.surfaceTint),
                        color: colores.outlineVariant,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
